// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
jQuery.ajaxSetup({
    'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
})

function updateAndFade(form){
     $.post(form.attr('action'), form.serialize(), function(data){
            alert("Post is done. Do some slidy thing. Also, what you got returned was: " + data);
            form.fadeOut("slow");
        }, 'script');
}

$(document).ready(function(){

    /*
     *Delegates the submit button on the edit forms to this so they go away as
     *you update the the movies/shows/songs. 
     **/
    $(document).delegate('form[id^="edit_movie_"]', 'submit',(function(){
        var form = $(this);
        updateAndFade(form);
        return false;
    }))
    $(document).delegate('form[id^="edit_show_"]', 'submit',(function(){
        var form = $(this);
        updateAndFade(form);
        return false;
    }))
    $(document).delegate('form[id^="edit_song_"]', 'submit',(function(){
        var form = $(this);
        updateAndFade(form);
        return false;
    }))
})

