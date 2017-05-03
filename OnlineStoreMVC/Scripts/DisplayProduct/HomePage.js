angular.module("ecom_HomePage", [])
    .controller("ecom_Main_Controller", [function () {
        var self = this;
        var init = function () {

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

            var $frame = $('.products-groupproduct .frame');

            $.each($frame, function (i, groupProductPanel) {
                $(groupProductPanel).sly({
                    horizontal: 1,
                    itemNav: 'basic',
                    smart: 1,
                    activateOn: 'click',
                    mouseDragging: 1,
                    touchDragging: 1,
                    releaseSwing: 1,
                    startAt: 0,
                    scrollBy: 1,
                    activatePageOn: 'click',
                    speed: 300,
                    elasticBounds: 1,
                    easing: 'easeOutExpo',
                    dragHandle: 1,
                    dynamicHandle: 1,
                    clickBar: 1,

                    // Cycling
                    cycleBy: "items",
                    cycleInterval: 2000,
                    pauseOnHover: true,
                    startPaused: false,

                    // Buttons
                    prevPage: $(groupProductPanel).closest(".b-groupproduct").find('.title-groupproduct .btn-previous-groupproduct'),
                    nextPage: $(groupProductPanel).closest(".b-groupproduct").find('.title-groupproduct .btn-next-groupproduct')
                });
            });
        }
        var initPopover = function () {
            $('[data-toggle="popover"]').popover({
                trigger: "hover",
                container: "body",
                placement: "auto right",
                template: '<div class="popover" role="tooltip"><div class="arrow"></div><h3 class="popover-title"></h3><div class="popover-content"></div></div>'
            });
        }
        // Run when the first load module
        init();
    }]);