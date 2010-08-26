// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
jQuery.ajaxSetup({
    'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
})

$(document).ready(function(){

    /*
     *Delegates the submit button on the edit forms to this so they go away as
     *you update the the movies/shows/songs. 
     **/
    $(document).delegate('form[id^="edit_movie_"]', 'submit',(function(){
        var form = $(this);
        $.post(form.attr('action'), form.serialize(), null, 'script');
        form.remove();
        return false;
    }))
    $(document).delegate('form[id^="edit_show_"]', 'submit',(function(){
        var form = $(this);
        $.post(form.attr('action'), form.serialize(), null, 'script');
        form.remove();
        return false;
    }))
    $(document).delegate('form[id^="edit_song_"]', 'submit',(function(){
        var form = $(this);
        $.post(form.attr('action'), form.serialize(), null, 'script');
        form.remove();
        return false;
    }))
})

