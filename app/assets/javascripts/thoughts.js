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
  // $('#new_comment').unbind("submit").bind("submit", function(e) {
  //   $.ajax({
  //     type: "POST",
  //     url: this.action,
  //     data: $(this).serialize(),
  //     success: function(response) {
  //       $("#comment_body").val("");
  //       var $ol = $("div.thought-comments").html(response)
  //     }
  //   });
  //   e.preventDefault();
  // })

  // JS Constructor - Comment
function Comment(comment) {
  this.id = comment.id
  this.username = comment.thinker.username
  this.comment = comment.body
}

// Prototype method
  Comment.prototype.formatComment = function() {
    commentHTML = `<li data-id=${this.id}><b>On ${this.username}:</b> ${this.comment} </li>`
    return commentHTML
  }

  //Submit comment using JSON and RAILS API

    $(".new_comment").on("submit", function(e){
      $.post(this.action, $(this).serialize(), function(comment) {
        if (Array.isArray(comment)) {
          var message = "";
          comment.forEach(function(error) {
            message += `${error}\n`
          })
          alert(message);
        } else {
          const $ol = $("div.thought-comments");
          const newComment = new Comment(comment);
          const commentHTML = newComment.formatComment();
          $ol.append(commentHTML);
        }
        $("div.thought-comments").val("");
      });
      e.preventDefault();
      })

})

