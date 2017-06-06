var DetailProductManagement = {
    init: function () {
        this.bindEvents();
        this.initZoomImageControl();
        this.initProductGroupSlider();
        this.initPopover();
        this.initZoomFuntionality();
    },
    initProductGroupSlider:function(){
        // Init slider of products for each category
        var owl = $('.owl-carousel');
        $.each(owl, function (i, groupProductPanel) {
            $(groupProductPanel).owlCarousel({
                items: 6,
                loop: false,
                margin: 10,
                autoplay: true,
                autoplayTimeout: 1000,
                autoplayHoverPause: true,
                //responsiveClass: true,
                responsive: {
                    0: {
                        items: 2,
                        nav: true
                    },
                    600: {
                        items: 4,
                        nav: false
                    },
                    800: {
                        items: 4,
                        nav: false
                    },
                    1000: {
                        items: 5,
                        nav: false,
                        loop: false
                    },
                    1200: {
                        items: 6,
                        nav: false,
                        loop: false
                    },
                    1336: {
                        items: 7,
                        nav: false,
                        loop: false
                    }
                }
            });
            // Go to the next item
            $(groupProductPanel).closest(".b-groupproduct").find('.title-groupproduct .btn-previous-groupproduct').click(function () {
                owl.trigger('next.owl.carousel');
            })
            // Go to the previous item
            $(groupProductPanel).closest(".b-groupproduct").find('.title-groupproduct .btn-next-groupproduct').click(function () {
                // With optional speed parameter
                // Parameters has to be in square bracket '[]'
                owl.trigger('prev.owl.carousel', [300]);
            })
        });
    },
    initPopover: function () {

        $("body .popover").remove();
        $('[data-toggle="popover"]').popover({
            trigger: "hover",
            container: "body",
            placement: "auto right",
            html:true,
            template: '<div class="popover" role="tooltip"><div class="arrow"></div><h3 class="popover-title"></h3><div class="popover-content"></div></div>'
        });
    },
    initZoomFuntionality:function(){
        $("#picture-frame").zoomToo({
            magnify: 1
        });

        $('body').scrollspy({ target: '#scrollSpy_ProductDetails' });
    },
    bindEvents: function () {
        $("#thumbs_list_frame li").unbind("click").bind("click", function () {
            var imagePath = $(this).data("imagepath") || "/Content/Images/no-image.png";
            $("#picture-frame>img").attr("src", imagePath);
            $("#picture-frame>img").data("zoom-image", imagePath);
            DetailProductManagement.initZoomImageControl();
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
    initZoomImageControl: function () {
        $("#picture-frame").zoomToo({
            magnify: 1
        });
    }
}
