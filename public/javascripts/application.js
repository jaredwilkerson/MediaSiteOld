// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
jQuery.ajaxSetup({
    'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
})

$(document).ready(function(){
    $("form[class='edit_movie'").submit(function(){
        $.post($(this).attr('action'), $(this).serialize(), null, 'script');
        return false;
    })
})