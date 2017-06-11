var ecom_HomePage = angular.module("ecom_HomePage", [])
    .controller("ecom_Main_Controller", [function () {
        var self = this;
        var init = function () {
            debugger
            initMainSlider();
            initProductGroupSlider();
            initPopover();
        }
        var initMainSlider = function () {
            // Init main slider 

            $('#visual').pignoseLayerSlider({
                play: '.btn-play',
                pause: '.btn-pause',
                next: '.btn-next',
                prev: '.btn-prev'
            });
        }
        var initProductGroupSlider = function () {
            // Init slider of products for each category
            var owl = $('.groupproduct-panel .owl-carousel');
            $.each(owl, function (i, groupProductPanel) {
                $(groupProductPanel).owlCarousel({
                    items: 6,
                    loop: true,
                    margin: 10,
                    autoplay: true,
                    autoplayTimeout: 2000,
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
                            loop: true
                        },
                        1200: {
                            items: 6,
                            nav: false,
                            loop: true
                        },
                         1336: {
                            items: 7,
                            nav: false,
                            loop: true
                        }
                    }
                });
                // Go to the next item
                $(groupProductPanel).closest(".b-groupproduct").find('.title-groupproduct .btn-previous-groupproduct').click(function () {
                    $(groupProductPanel).trigger('next.owl.carousel');
                })
                // Go to the previous item
                $(groupProductPanel).closest(".b-groupproduct").find('.title-groupproduct .btn-next-groupproduct').click(function () {
                    // With optional speed parameter
                    // Parameters has to be in square bracket '[]'
                    $(groupProductPanel).trigger('prev.owl.carousel', [300]);
                })
            });
        }
        var initPopover = function () {
            $('[data-toggle="popover"]').popover({
                trigger: "hover",
                container: "body",
                placement: "auto right",
                html:true,
                template: '<div class="popover" role="tooltip"><div class="arrow"></div><h3 class="popover-title"></h3><div class="popover-content"></div></div>'
            });
        }
        // Run when the first load module
        //init();
        angular.element(document).ready(function () {
            init();
        });
    }]);