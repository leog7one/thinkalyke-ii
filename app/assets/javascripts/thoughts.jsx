document.addEventListener("turbolinks:load", function() {
  
  $("a.load_comments").on("click", function(e) {
    
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


  // JS Constructor - Comment
function Comment(comment) {
  this.username = comment.thinker.username
  this.comment = comment.body
}

// Prototype method
  Comment.prototype.formatComment = function() {
    commentHTML =  `<li><blockquote>${this.comment}<footer> by: ${this.username}</footer></blockquote></li>`
    return commentHTML
  }

  //Submit comment using JSON and RAILS API
    $(".new_comment").on("submit", function(e){
      $.post(this.action, $(this).serialize(), function(comment) {
          const $ol = $("div.thought-comments");
          const newComment = new Comment(comment);
          const commentHTML = newComment.formatComment();
            if($(".no-comments").text() != '') {
              $ol.html(commentHTML);
            } else {
              $ol.append(commentHTML)
            }        
        $("#comment_body").val("");
      });
      e.preventDefault();
      })

})

