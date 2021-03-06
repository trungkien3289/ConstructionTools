﻿var ProductSortEnum = {
    PriceHighToLow: 1,
    PriceLowToHigh: 2,
    ProductNameAToZ: 3,
    ProductNameZToA: 4
}
var SearchProductRequest = function (index, searchString) {
    this.CategoryIds = [];
    this.BrandIds = [];
    this.SortBy = ProductSortEnum.ProductNameAToZ;
    this.Index = index || 0; // int
    this.SearchString = searchString || ""; // string
    this.NumberOfResultsPerPage = 10; // int
}
var SearchProductManagement = {
    model: {
        CategoryIds: null, // int
        BrandIds: [], // List<int>
        SortBy: ProductSortEnum.ProductNameAToZ,// int 
        Index: 0, // int
        SearchString: "", // string
        NumberOfResultsPerPage: 10 // int
    },
    controls: {
        spin: null
    },
    init: function (numberItems, index, searchString) {
        // Init spin
        this.controls.spin = new Spinner({
            lines: 13 // The number of lines to draw
            , length: 28 // The length of each line
            , width: 14 // The line thickness
            , radius: 42 // The radius of the inner circle
            , scale: 1 // Scales overall size of the spinner
            , corners: 1 // Corner roundness (0..1)
            , color: '#000' // #rgb or #rrggbb or array of colors
            , opacity: 0.25 // Opacity of the lines
            , rotate: 0 // The rotation offset
            , direction: 1 // 1: clockwise, -1: counterclockwise
            , speed: 1 // Rounds per second
            , trail: 60 // Afterglow percentage
            , fps: 20 // Frames per second when using setTimeout() as a fallback for CSS
            , zIndex: 2e9 // The z-index (defaults to 2000000000)
            , className: 'spinner' // The CSS class to assign to the spinner
            , top: '50%' // Top position relative to parent
            , left: '50%' // Left position relative to parent
            , shadow: true // Whether to render a shadow
            , hwaccel: false // Whether to use hardware acceleration
            , position: 'fixed' // Element positioning
        }).spin();
        // Assign model
        this.model = new SearchProductRequest(index, searchString);
        // Init paging control
        this.initPagingControl(numberItems, this.model.NumberOfResultsPerPage);
        //Init layout
        if (numberItems !=null && numberItems == 0) {
            $("ul.product_list.grid.row").append(SearchProductManagement.getNoResultMessage());
        }
        // Init popover
        $('[data-toggle="popover"]').popover({
            trigger: "hover",
            container: "body",
            placement: "auto right",
            template: '<div class="popover" role="tooltip"><div class="arrow"></div><h3 class="popover-title"></h3><div class="popover-content"></div></div>'
        });
        // Add events
        this.bindEvents();
    },
    initPagingControl: function (numberItems, itemsOnPage) {
        $(".paging-control-filtercontent").empty();
        $(".paging-control-filtercontent").pagination({
            items: numberItems || 0,
            itemsOnPage: itemsOnPage,
            cssStyle: 'light-theme',
            onPageClick: onPaging,
            currentPage: SearchProductManagement.model.Index
        });

        function onPaging(pageNumber, event) {
            SearchProductManagement.updatePaging(pageNumber);
        }
    },
    bindEvents: function () {
        // brand checkboxs
        $("#layered_block_left input:checkbox.ckb-brand-filtercontent").unbind("change").bind("change", function (sender) {
            var isCheck = $(this).is(":checked");
            var brandId = $(this).data("id");
            SearchProductManagement.updateSelectedBrandList(brandId, isCheck);
        });

        // sort
        $("#SortProductOptionsSelectListItems").unbind("change").bind("change", function () {
            var sortType = $("#SortProductOptionsSelectListItems").val();
            SearchProductManagement.updateSortBy(sortType);
        });

        // search control
        $("#SearchProduct_Btn").unbind("click").bind("click", function (e) {
            searchProduct();
        });
        $("#tmsearch #tm_search_query").unbind("keypress").bind("keypress", function (e) {
            if (e.keyCode == 13) {
                searchProduct();
            }
        });

        function searchProduct() {
            var searchString = $("#tmsearch #tm_search_query").val();
            window.location.replace("/Product/SearchProduct?searchString=" + searchString);
        }
    },
    updateSelectedBrandList: function (brandId, isAdd) {
        /// <summary>
        /// Update selected brands list when user add or remove a brand in filter
        /// </summary>
        /// <param>N/A</param>
        /// <returns>N/A</returns>

        if (isAdd) {
            var isExist = false;
            for (var i = 0; i < SearchProductManagement.model.BrandIds.length; i++) {
                if (SearchProductManagement.model.BrandIds[i] == brandId) {
                    isExist = true;
                }
            }
            if (!isExist) {
                SearchProductManagement.model.BrandIds.push(brandId);
            }
        } else {
            for (var i = 0; i < SearchProductManagement.model.BrandIds.length; i++) {
                if (SearchProductManagement.model.BrandIds[i] == brandId) {
                    SearchProductManagement.model.BrandIds.splice(i, 1);
                }
            }
        }

        SearchProductManagement.updateListProducts();
    },
    updateSortBy: function (sortType) {
        /// <summary>
        /// Update sort type in filter model 
        /// </summary>
        /// <param>N/A</param>
        /// <returns>N/A</returns>

        SearchProductManagement.model.SortBy = sortType ? sortType : ProductSortEnum.ProductNameAToZ;
        SearchProductManagement.updateListProducts();
    },
    updatePaging: function (pageNumber) {
        /// <summary>
        /// Update layout when paging control changes 
        /// </summary>
        /// <param>N/A</param>
        /// <returns>N/A</returns>

        SearchProductManagement.model.Index = pageNumber;
        SearchProductManagement.updateListProducts();
    },
    updateListProducts: function () {
        /// <summary>
        /// Update list products by filters
        /// </summary>
        /// <param>N/A</param>
        /// <returns>N/A</returns>


        SearchProductManagement.showSpin();
        $.ajax({
            type: "POST",
            url: "/Product/GetSearchProductsByAjax",
            data: JSON.stringify(SearchProductManagement.model),
            dataType: 'json',
            contentType: 'application/json; charset=utf-8',
            success: function (result) {
                SearchProductManagement.updateGuiForListProducts(result.Products);
                SearchProductManagement.updateModelAndLayout(result);
                SearchProductManagement.hideSpin();
            },
            error: function (ex) {
                console.log(ex.message);
                SearchProductManagement.hideSpin();
            }
        });
    },
    updateGuiForListProducts: function (products) {
        /// <summary>
        /// Update Gui of list product panel after get data from server
        /// </summary>
        /// <param>N/A</param>
        /// <returns>N/A</returns>

        $(".productlist-displayproduct").empty();
        if (products && products.length == 0) {
            $(".productlist-displayproduct").append(SearchProductManagement.getNoResultMessage());
        } else {
            for (var i = 0; i < products.length; i++) {
                var itemHtml = SearchProductManagement.genarateHtmlProductItem(products[i]);
                $(".productlist-displayproduct").append(itemHtml);
            }
        }
    },
    genarateHtmlProductItem: function (product) {
        /// <summary>
        ///Genarate html element for each item of list products panel
        /// </summary>
        /// <param>N/A</param>
        /// <returns>N/A</returns>

        var template = '   <div class="col-md-3 product-men" data-toggle="popover" title="' + product.Name + '" data-content="' + product.ShortDescription + '">  ';
        template += '           <div class="men-pro-item simpleCart_shelfItem">  ';
        template += '               <a href="/Product/ProductDetails/' + product.Id + '" class="men-thumb-item">  ';
        template += '                   <img src="' + product.CoverImageUrl + '" alt="" class="pro-image-front">  ';
        template += '                   <img src="' + product.CoverImageUrl + '" alt="" class="pro-image-back">  ';
        template += '                   <div class="men-cart-pro">  ';
        template += '                       <div class="inner-men-cart-pro">  ';
        template += '                           <a href="/Product/ProductDetails?id=' + product.Id + '" class="link-product-add-cart">Chi Tiết</a>';
        template += '                       </div>  ';
        template += '                   </div>  ';
        if (product.SaleOff != 0) {
            template += '                       <div class="saleoff-item-groupproduct">' + product.SaleOff + '%</div>  ';
        }
        template += '     ';
        template += '               </a>  ';
        template += '               <div class="item-info-product ">  ';
        template += '                   <h4 class="productname-item-info-product"><a href="/Product/ProductDetails?id=' + product.Id + '">' + product.Name + '</a></h4>  ';
        template += '                   <div class="brandname-item-groupproduct">Thương hiệu: ' + product.BrandName + '</div>';
        template += '                   <div class="info-product-price">  ';
        template += '                       <span class="item_price">' + product.PriceFormatCurrency + '</span>  ';
        template += '                   </div>  ';
        //template += '                   <a href="#" class="item_add single-item hvr-outline-out button2">Thêm Vào Giỏ</a>  ';
        template += '               </div>  ';
        template += '           </div>  ';
        template += '      </div>  ';

        return template;
    },
    getNoResultMessage: function () {
        return "<li class='noresult-panel'>no results</li>";
    },
    updateModelAndLayout: function (model) {
        // update title bar
        $(".b-productItems .products-right-grids .display").text("Have " + model.NumberOfTitlesFound + " items");
        // update paging control
        SearchProductManagement.initPagingControl(model.NumberOfTitlesFound, SearchProductManagement.model.NumberOfResultsPerPage);
    },
    showSpin: function (target) {
        /// <summary>
        /// Create spin control
        /// </summary>
        /// <param>N/A</param>
        /// <returns>N/A</returns>s

        $(".productlist-displayproduct").append(SearchProductManagement.controls.spin.spin().el);
    },
    hideSpin: function () {
        /// <summary>
        /// Hide spin control
        /// </summary>
        /// <param>N/A</param>
        /// <returns>N/A</returns>

        SearchProductManagement.controls.spin.stop();
    }
}