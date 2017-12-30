document.addEventListener("turbolinks:load", function() {
  //LOAD COMMENTS VIA AJAX
  $("a.load_comments").on("click", function(e) {
    // $.ajax(({
    //   url: this.href,
    //   dataType: 'script'
    // }))
    $.get(this.href).success(function(json) {
     var $ol = $("div.thought-comments")
     $ol.html("")

     json.forEach(function(comment) {
       $ol.append("<li>" + "<blockquote>" + comment.body + "<footer>" + 'by: ' + comment.thinker.username + "</footer>" +
       "</blockquote>" + "</li>" )
     })

    })
    e.preventDefault();
  })

  


  //CREATE COMMENTS VIA AJAX
  $('#new_comment').unbind("submit").bind("submit", function(e) {
    $.ajax({
      type: "POST",
      url: this.action,
      data: $(this).serialize(),
      success: function(response) {
        $("#comment_body").val("");
        var $ol = $("div.thought-comments").html(response)
      }
    });
    e.preventDefault();
  })


})

