//--Function set height for header
function setHeightForHeaderAndMenu() {
    var headerHeight = $(".header-bot").innerHeight();
    var menuHeight = $(".ban-top").innerHeight();
    var totalHeight = headerHeight + menuHeight;

    $(".header_menu_container").height(totalHeight);
}

$(document).ready(function () {
    setHeightForHeaderAndMenu();
})

$(window).resize(function () {
    setHeightForHeaderAndMenu();
})