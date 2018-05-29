$(document).ready(function() {

    // Parallax Function
    ////////////////////////////////////////////
    function parallax() {
        var scrolled = $(window).scrollTop();
        $("#front-page").css('top', (scrolled * 0.6) + "px");
    }

    // Top Bar Click Animations
    ////////////////////////////////////////////
    $("#home-button").click(function() {
        $('html, body').animate({scrollTop: (0)}, 500);
    });

    $("#top-bar-short-bio").click(function() {
        $('html, body').animate({
            scrollTop: ($("#short-bio-page").offset().top - 79)
        }, 500);
    });
    ////////////////////////////////////////////
    $("#top-bar-my-skills").click(function() {
        $('html, body').animate({
            scrollTop: ($("#my-skills-page").offset().top - 79)
        }, 500);
    });
    ////////////////////////////////////////////
    $("#top-bar-my-work").click(function() {
        $('html, body').animate({
            scrollTop: ($("#my-work-page").offset().top - 79)
        }, 500);
    });
    ////////////////////////////////////////////
    $("#top-bar-contact-me").click(function() {
        $('html, body').animate({
            scrollTop: ($("#contact-me-page").offset().top - 79)
        }, 500);
    });
    //

});