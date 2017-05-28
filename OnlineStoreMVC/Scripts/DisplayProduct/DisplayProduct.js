var ProductSortEnum = {
    PriceHighToLow: 1,
    PriceLowToHigh: 2,
    ProductNameAToZ: 3,
    ProductNameZToA: 4
}
var GetProductsByCategoryRequest = function (categoryId, index) {
    this.CategoryId = categoryId || null;
    this.BrandIds = [];
    this.SortBy = ProductSortEnum.ProductNameAToZ;
    this.BeginPrice = null; // decimal?
    this.EndPrice = null; // decimal?
    this.Index = index || 0; // int
    this.SearchString = ""; // string
    this.NumberOfResultsPerPage = 10; // int
}
var DisplayProductManagement = {
    model: {
        CategoryId: null, // int
        BrandIds: [], // List<int>
        SortBy: ProductSortEnum.ProductNameAToZ,// int 
        BeginPrice: null, // decimal?
        EndPrice: null, // decimal?
        Index: 0, // int
        SearchString: "", // string
        NumberOfResultsPerPage: 10 // int
    },
    controls: {
        priceRange: null,
        spin: null
    },
    init: function (categoryId, numberItems, index) {
        // Init spin
        this.controls.spin = new Spinner({
            lines: 15 // The number of lines to draw
            , length: 0 // The length of each line
            , width: 14 // The line thickness
            , radius: 28 // The radius of the inner circle
            , scale: 1 // Scales overall size of the spinner
            , corners: 0 // Corner roundness (0..1)
            , color: '#630a34' // #rgb or #rrggbb or array of colors
            , opacity: 0.25 // Opacity of the lines
            , rotate: 32 // The rotation offset
            , direction: 1 // 1: clockwise, -1: counterclockwise
            , speed: 1.7 // Rounds per second
            , trail: 64 // Afterglow percentage
            , fps: 20 // Frames per second when using setTimeout() as a fallback for CSS
            , zIndex: 2e9 // The z-index (defaults to 2000000000)
            , className: 'spinner' // The CSS class to assign to the spinner
            , top: '50%' // Top position relative to parent
            , left: '50%' // Left position relative to parent
            , shadow: true // Whether to render a shadow
            , hwaccel: false // Whether to use hardware acceleration
            , position: 'fixed' // Element positioning
        }).spin();
        // assign model
        this.model = new GetProductsByCategoryRequest(categoryId, index);
        // init paging control
        this.initPagingControl(numberItems, this.model.NumberOfResultsPerPage);
        // Init price range control
        var priceRangeElement = $('#Sl_PriceRange').slider({
            from: 5000,
            to: 150000,
            heterogeneity: ['50/50000'],
            step: 1000,
            dimension: '&nbsp;$',
            onstatechange: function (value) { console.log(value) }
        }).on('slideStop', function (ev) {
            var priceRange = ev.value;
            var minPrice = priceRange[0];
            var maxPrice = priceRange[1];
            DisplayProductManagement.updatePriceRangeFilter(minPrice, maxPrice);
        });

        this.controls.priceRange = priceRangeElement.data("slider");

        //Init layout
        if (numberItems != null && numberItems == 0) {
            $(".productlist-displayproduct").append(this.getNoResultMessage());
        }
        this.initShortDescriptionPopup();
        this.bindEvents();
    },
    initShortDescriptionPopup:function(){
        // Init pop up show short description for product item

        $("body .popover").remove();
        $('[data-toggle="popover"]').popover({
            trigger: "hover",
            container: "body",
            placement: "auto right",
            template: '<div class="popover" role="tooltip"><div class="arrow"></div><h3 class="popover-title"></h3><div class="popover-content"></div></div>'
        });
    },
    initPagingControl: function (numberItems, itemsOnPage) {
        $(".paging-control-filtercontent").empty();
        $(".paging-control-filtercontent").pagination({
            items: numberItems || 0,
            itemsOnPage: itemsOnPage,
            cssStyle: 'light-theme',
            prevText: '<',
            nextText: '>',
            onPageClick: onPaging,
            currentPage: DisplayProductManagement.model.Index
        });

        function onPaging(pageNumber, event) {
            DisplayProductManagement.updatePaging(pageNumber);
        }
    },
    bindEvents: function () {
        // brand checkboxs
        $(".branchfilter-displayproduct input:checkbox.ckb-brand-filtercontent").unbind("change").bind("change", function (sender) {
            var isCheck = $(this).is(":checked");
            var brandId = $(this).data("id");
            DisplayProductManagement.updateSelectedBrandList(brandId, isCheck);
        });

        // bind event for category item
        $(".b-filterItems .category-filterItems .category-link").unbind("click").bind("click", function () {
            $(".b-filterItems .category-filterItems .category-link").removeClass("active");
            $(this).addClass("active");
            DisplayProductManagement.updateCategoryFilter($(this).data("id"));
        });

        // sort
        $("#SortProductOptionsSelectListItems").unbind("change").bind("change", function () {
            var sortType = $("#SortProductOptionsSelectListItems").val();
            DisplayProductManagement.updateSortBy(sortType);
        });

        // search control
        $("#SearchProduct_Btn").unbind("click").bind("click", function () {
            var searchString = $("#tm_search_query").val().trim();
            DisplayProductManagement.updateSearch(searchString);
        });
    },
    updateSelectedBrandList: function (brandId, isAdd) {
        /// <summary>
        /// Update selected brands list when user add or remove a brand in filter
        /// </summary>
        /// <param>N/A</param>
        /// <returns>N/A</returns>

        if (isAdd) {
            var isExist = false;
            for (var i = 0; i < DisplayProductManagement.model.BrandIds.length; i++) {
                if (DisplayProductManagement.model.BrandIds[i] == brandId) {
                    isExist = true;
                }
            }
            if (!isExist) {
                DisplayProductManagement.model.BrandIds.push(brandId);
            }
        } else {
            for (var i = 0; i < DisplayProductManagement.model.BrandIds.length; i++) {
                if (DisplayProductManagement.model.BrandIds[i] == brandId) {
                    DisplayProductManagement.model.BrandIds.splice(i, 1);
                }
            }
        }

        DisplayProductManagement.updateListProducts();
    },
    updatePriceRangeFilter: function (minPrice, maxPrice) {
        /// <summary>
        /// Update price range in filter model 
        /// </summary>
        /// <param>N/A</param>
        /// <returns>N/A</returns>

        DisplayProductManagement.model.BeginPrice = minPrice;
        DisplayProductManagement.model.EndPrice = maxPrice;
        DisplayProductManagement.updateListProducts();
    },
    updateCategoryFilter: function (categoryId) {
        /// <summary>
        /// Update sort type in filter model 
        /// </summary>
        /// <param>N/A</param>
        /// <returns>N/A</returns>

        DisplayProductManagement.model.CategoryId = categoryId ? categoryId : null;
        DisplayProductManagement.updateListProducts();
    },
    updateSortBy: function (sortType) {
        /// <summary>
        /// Update sort type in filter model 
        /// </summary>
        /// <param>N/A</param>
        /// <returns>N/A</returns>

        DisplayProductManagement.model.SortBy = sortType ? sortType : ProductSortEnum.ProductNameAToZ;
        DisplayProductManagement.updateListProducts();
    },
    updatePaging: function (pageNumber) {
        /// <summary>
        /// Update layout when paging control changes 
        /// </summary>
        /// <param>N/A</param>
        /// <returns>N/A</returns>

        DisplayProductManagement.model.Index = pageNumber;
        DisplayProductManagement.updateListProducts();
    },
    updateSearch: function (searchString) {
        /// <summary>
        /// Update layout when search control changes 
        /// </summary>
        /// <param>N/A</param>
        /// <returns>N/A</returns>

        DisplayProductManagement.model.SearchString = searchString;
        DisplayProductManagement.updateListProducts();
    },
    updateListProducts: function () {
        /// <summary>
        /// Update list products by filters
        /// </summary>
        /// <param>N/A</param>
        /// <returns>N/A</returns>

        DisplayProductManagement.showSpin();
        $.ajax({
            type: "POST",
            url: "/Product/GetProductsByAjax",
            data: JSON.stringify(DisplayProductManagement.model),
            dataType: 'json',
            contentType: 'application/json; charset=utf-8',
            success: function (result) {
                DisplayProductManagement.updateGuiForListProducts(result.Products);
                DisplayProductManagement.updateModelAndLayout(result);
                DisplayProductManagement.hideSpin();
            },
            error: function (ex) {
                console.log(ex.message);
                DisplayProductManagement.hideSpin();
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
            $(".productlist-displayproduct").append(DisplayProductManagement.getNoResultMessage());
        } else {
            for (var i = 0; i < products.length; i++) {
                var itemHtml = DisplayProductManagement.genarateHtmlProductItem(products[i]);
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
        //if (product.IsNew) {
        //    template += '                       <span class="product-new-top">Mới</span>  ';
        //}
        template += '     ';
        template += '               </a>  ';
        template += '               <div class="item-info-product ">  ';
        template += '                   <h4 class="productname-item-info-product"><a href="/Product/ProductDetails?id=' + product.Id + '">' + product.Name + '</a></h4>  ';
        template += '                   <div class="brandname-item-groupproduct">Thương hiệu: '+product.BrandName+'</div>';
        template += '                   <div class="info-product-price">  ';
        template += '                       <span class="item_price">' + product.PriceFormatCurrency + '</span>  ';
        template += '                   </div>  ';
        //template += '                   <a href="#" class="item_add single-item hvr-outline-out button2">Thêm Vào Giỏ</a>  ';
        template += '               </div>  ';
        template += '           </div>  ';
        template += '      </div>  ';

        return template;
    },
    updateListBranch: function (model) {
        var generateBranchItem = function (item, isChecked) {
            var template = '';
            template +=  '<li>';
            template += '<label class="lbl-branch-filtercontent">';
            if(isChecked){
                template += '<input type="checkbox" checked class="ckb-brand-filtercontent" data-id="' + item.Id + '">' + item.Name;
            }else{
                template += '<input type="checkbox" class="ckb-brand-filtercontent" data-id="' + item.Id + '">' + item.Name;
            }
            template += '</label>';
            template +=  '</li>';

            return template;
        }

        var isChoosed = function (branchId, selectedBranchList) {
            for (var i = 0; i < selectedBranchList.length; i++) {
                if (branchId == selectedBranchList[i]) {
                    return true;
                }
            }

            return false;
        }

        $(".listbranch-displayproduct .b-branch-filtercontent>li").remove();
        if (model.Brands != null) {
            for (var i = 0; i < model.Brands.length; i++) {
                $(".listbranch-displayproduct>ul").append(generateBranchItem(model.Brands[i], isChoosed(model.Brands[i].Id, model.BrandIds)));
            }
        }

        // brand checkboxs
        $(".branchfilter-displayproduct input:checkbox.ckb-brand-filtercontent").unbind("change").bind("change", function (sender) {
            var isCheck = $(this).is(":checked");
            var brandId = $(this).data("id");
            DisplayProductManagement.updateSelectedBrandList(brandId, isCheck);
        });
    },
    getNoResultMessage: function () {
        return "<p class='noresult-panel'>Không có sản phẩm nào được tìm thấy</p>";
    },
    updateModelAndLayout: function (model) {
        // update title bar
        $(".b-productItems .sorting .display").text("Có " + model.NumberOfTitlesFound + " sản phẩm");
        DisplayProductManagement.initPagingControl(model.NumberOfTitlesFound, DisplayProductManagement.model.NumberOfResultsPerPage);
        DisplayProductManagement.updateListBranch(model);
        DisplayProductManagement.initShortDescriptionPopup();
    },
    showSpin: function (target) {
        /// <summary>
        /// Create spin control
        /// </summary>
        /// <param>N/A</param>
        /// <returns>N/A</returns>s

        $(".productlist-displayproduct").append(DisplayProductManagement.controls.spin.spin().el);
    },
    hideSpin: function () {
        /// <summary>
        /// Hide spin control
        /// </summary>
        /// <param>N/A</param>
        /// <returns>N/A</returns>

        DisplayProductManagement.controls.spin.stop();
    }
}