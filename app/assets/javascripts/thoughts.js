document.addEventListener("turbolinks:load", function() {

  $("a.previous").on("click", function(e) {

    $.getJSON(this.href).success(function(json) {
      var title = $(json).attr('title')
      var $h1 = $("h1")
      $h1.html("")
      $h1.append("<h1>" + title + "</h1> ")
    });
    e.preventDefault();
  })

  
  $("a.load_comments").on("click", function(e) {
    
    //LOAD COMMENTS VIA AJAX
    // $.ajax(({
    //   url: this.href,
    //   dataType: 'script'
    // }))

    $.get(this.href).success(function(comments) {
     var $ol = $("div.thought-comments")
     $ol.html("")

     comments.forEach(function(comment) {
      const oneComment = new Comment(comment)
      const commentHTML = oneComment.formatComment()
      $ol.append(commentHTML)
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
  this.username = comment.thinker.username
  this.comment = comment.body
}

// Prototype method
  Comment.prototype.formatComment = function() {
    commentHTML = `<li><blockquote>${this.comment}<footer> by: ${this.username}</footer></blockquote></li>`
    return commentHTML
  }

  //Submit comment using JSON and RAILS API
    $(".new_comment").on("submit", function(e){
      $.post(this.action, $(this).serialize(), function(comment) {
          const $ol = $("div.thought-comments");
          const newComment = new Comment(comment);
          const commentHTML = newComment.formatComment();
            if($(".no-thoughts").text() != '') {
              $ol.html(commentHTML);
            } else {
              $ol.append(commentHTML)
            }        
        $("#comment_body").val("");
      });
      e.preventDefault();
      })

})

