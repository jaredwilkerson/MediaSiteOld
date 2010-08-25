// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
jQuery.ajaxSetup({
    'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
})

$(document).ready(function(){
/*    $("#new_movie").submit(function(){
        $.post($(this).attr('action'), $(this).serialize(), null, 'script');
        return false;
    })
*/

    $(document).delegate('form[id^="edit_mov"]', 'submit',(function(){
        var form = $(this);
        $.post(form.attr('action'), form.serialize(), null, 'script');
        return false;
    }))
})

