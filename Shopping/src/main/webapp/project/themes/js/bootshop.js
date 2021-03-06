//Bootsshop-----------------------//
$(document).ready(function () {
    $('#myCarousel').carousel({
        interval: 4000
    })
    $('#featured').carousel({
        interval: 4000
    })
    $(function () {
        $('#gallery a').lightBox();
    });

    $('.subMenu > a').click(function (e) {
        e.preventDefault();
        const subMenu = $(this).siblings('ul');
        const li = $(this).parents('li');
        const subMenus = $('#sidebar li.subMenu ul');
        const subMenus_parents = $('#sidebar li.subMenu');
        if (li.hasClass('open')) {
            if (($(window).width() > 768) || ($(window).width() < 479)) {
                subMenu.slideUp();
            } else {
                subMenu.fadeOut(250);
            }
            li.removeClass('open');
        } else {
            if (($(window).width() > 768) || ($(window).width() < 479)) {
                subMenus.slideUp();
                subMenu.slideDown();
            } else {
                subMenus.fadeOut(250);
                subMenu.fadeIn(250);
            }
            subMenus_parents.removeClass('open');
            li.addClass('open');
        }
    });
    const ul = $('#sidebar > ul');
    $('#sidebar > a').click(function (e) {
        e.preventDefault();
        var sidebar = $('#sidebar');
        if (sidebar.hasClass('open')) {
            sidebar.removeClass('open');
            ul.slideUp(250);
        } else {
            sidebar.addClass('open');
            ul.slideDown(250);
        }
    });

});
