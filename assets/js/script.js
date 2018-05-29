////

$(document).ready(function() {
    

var slideIndex = 0;
showSlides();

function showSlides() {
    var i;
    var slides = document.getElementsByClassName("mySlides");
    for (i = 0; i < slides.length; i++) {
        slides[i].style.display = "none"; 
    }
    slideIndex++;
    if (slideIndex > slides.length) {slideIndex = 1} 
    slides[slideIndex-1].style.display = "block"; 
    setTimeout(showSlides, 2500); // Change image every 2 seconds
}

    // Parallax Function
    ////////////////////////////////////////////
    function parallax() {
        var scrolled = $(window).scrollTop();
        $(".front-page").css('top', (scrolled * 0.6) + "px");
    }
    // Parallax Function Execution
    ////////////////////////////////////////////
    $(window).scroll(function() {
        parallax();
    })
    //

    // Top Bar Click Animations
    ////////////////////////////////////////////
    $("#home-button").click(function() {
        $('html, body').animate({scrollTop: (0)}, 500);
    });

    $("#navbar-about").click(function() {
        $('html, body').animate({
            scrollTop: ($("#about-section").offset().top - 50)
        }, 500);
    });
    ////////////////////////////////////////////
    $("#navbar-projects").click(function() {
        $('html, body').animate({
            scrollTop: ($("#project-section").offset().top - 50)
        }, 500);
    });
    ////////////////////////////////////////////
    $("#navbar-blog").click(function() {
        $('html, body').animate({
            scrollTop: ($("#blog-section").offset().top - 50)
        }, 500);
    });
    ////////////////////////////////////////////
    $("#navbar-resume").click(function() {
        $('html, body').animate({
            scrollTop: ($("#resume-section").offset().top - 50)
        }, 500);
    });
    //

});

