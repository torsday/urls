$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them
  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
  $('.shortener').on('submit',function(e){
    e.preventDefault();

    $.ajax({
      type:$(this).attr('method'),
      url:$(this).attr('action'),
      data:$(this).serialize()
    }).done(function(data){
      var full_html = "<a href='/" + data +  "'>Shortened URL</a>"
      $('#short').html(full_html)
    }).fail(function(){
      $('#short').html("Invalid URL")
    });
  });

  $('.login').on('submit',function(e){
    e.preventDefault();

    $.ajax({
      type:$(this).attr('method'),
      url:$(this).attr('action'),
      data:$(this).serialize()
    }).done(function(data){
      $('.container').prepend("<a href='/users/" + data +  "'>User Page</a>")
    });
  });

    $('.logout').on('submit',function(e){
    e.preventDefault();

    $.ajax({
      type:$(this).attr('method'),
      url:$(this).attr('action'),
    }).done(function(data){
    });
  });
});
