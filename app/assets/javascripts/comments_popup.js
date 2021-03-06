var CommentsPopup = {
    setup: function() {
        // add hidden 'div' to end of page to display popup:
        var popupDiv = $('<div id="comments"></div>');
        popupDiv.hide().appendTo($('body'));
        $(document).on('click', '#slide', CommentsPopup.getComments);
    }
    ,getComments: function() {
        $.ajax({type: 'GET',
            url: $(this).attr('href'),
            timeout: 5000,
            success: CommentsPopup.showComments,
            error: function(xhrObj, textStatus, exception) { alert('Error!'); }
        // 'success' and 'error' functions will be passed 3 args
        });
        return(false);
    }    
    ,showComments: function(data, requestStatus, xhrObject) {
        // center a floater 1/2 as wide and 1/4 as tall as screen
        var oneFourth = Math.ceil($(window).width() / 4);
        $('#comments').css({'left': oneFourth, 'width': 2*oneFourth, 'top': 250}).html(data).show();
            // make the Close link in the hidden element work
        $('#closeLink').click(CommentsPopup.hideComments);
        return(false); // prevent default link action
    }
    ,hideComments: function() {
        $('#comments').hide();
        return(false);
    }
};
$(CommentsPopup.setup);