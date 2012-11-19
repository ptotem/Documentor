/**
 * Created by JetBrains RubyMine.
 * User: arijit
 * Date: 10/3/12
 * Time: 2:13 PM
 * To change this template use File | Settings | File Templates.
 */


function togglemode() {

    if ($('#edit_on').val() == "true") {
        $('#edit_on').val("false");
        $('#edit_on').prev('a').text("Activate Design Mode");
        $('#edit_on').prev('a').removeClass('btn-danger').addClass('btn-success');
        $('.design_buttons').hide();
        $('.non_design_buttons').show().css("display", "block");
        $('.no_pcontents').hide();
        $('.colored_div').css("border", "none");
    }
    else {
        $('#edit_on').val("true");
        $('#edit_on').prev('a').text("Activate View Mode");
        $('#edit_on').prev('a').removeClass('btn-success').addClass('btn-danger');
        $('.no_pcontents').show();
        $('.non_design_buttons').hide();
        $('.design_buttons').show().css("display", "block");
        $('.colored_div').css("border", "1px solid black");

    }
    $("#save_button").show();
}

function snap_to_grid(this_selection) {

    if (grid) {
        var left_stop = $(this_selection).position().left - $('#pslide').position().left;
        var top_stop = $(this_selection).position().top - $('#pslide').position().top;
        var new_left = 20 * Math.round(left_stop / 20) + $('#pslide').position().left;
        var new_top = 20 * Math.round(top_stop / 20) + $('#pslide').position().top;
        $(this_selection).animate({
            left:new_left,
            top:new_top
        }, 800);
    }
}

function resize_snap_to_grid(this_selection) {
    if (grid) {
        var new_width = $(this_selection).width();
        var new_height = $(this_selection).height();
        var n_width = 20 * Math.floor(new_width / 20) + 12;
        var n_height = 20 * Math.floor(new_height / 20) + 12;

        $(this_selection).animate({
            width:n_width,
            height:n_height
        }, 800);
    }
}

function showGrid() {
    grid = true;
    $('#gridding').css("visibility", "visible");
    $('#hide_the_grid').show();
    $('#show_the_grid').hide();
}

function hideGrid() {
    grid = false;
    $('#gridding').css("visibility", "hidden");
    $('#hide_the_grid').hide();
    $('#show_the_grid').show();
}

function removeNL(s) {
    return s.replace(/[\n\r\t]/g, ""); //replaces NewLine or CarriageReturn or Tab with empty string.
}

jQuery.fn.htmlClean = function () {
    this.contents().filter(
        function () {
            if (this.nodeType != 3) {
                $(this).htmlClean();
                return false;
            }
            else {
                return !/\S/.test(this.nodeValue);
            }
        }).remove();
}



;
