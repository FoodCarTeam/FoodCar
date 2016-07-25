// Foundation JavaScript
// Documentation can be found at: http://foundation.zurb.com/docs

$(document).foundation();

$(function () {
    // Automatically center horizontally the header ad unit
    $("#Header div[id^=div-gpt-ad-]").css({ margin: "10px auto" });

    $(document).ready(function () {
        if ($(window).width() < 450) {
            $("#btnReportError").hide();
        } else {
            $("#btnReportError").show();
        }

        if ($(window).width() < 700) {
            $("#btnToggleView").addClass("phone");
        } else {
            $("#btnToggleView").removeClass("phone");
        }
    });

    $(window).resize(function () {
        if ($(window).width() < 450) {
            $("#btnReportError").hide();
        } else {
            $("#btnReportError").show();
        }

        if ($(window).width() < 700) {
            $("#btnToggleView").addClass("phone");
        } else {
            $("#btnToggleView").removeClass("phone");
        }
    });

    $("#mobile-floating-ad").find("div[id^=div-gpt-ad]").css({
        margin: "0px auto"
    });
});