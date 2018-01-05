document.addEventListener("turbolinks:load", function() {

  function loadThought(data) {
    history.pushState({}, "", "/thoughts/" + data.id)
    var thoughtsCommentPath = '/thoughts/' + data.id + '/comments/';
    $(".title").text(data["title"]);
    $(".thoughtThinkerName").text(data["thinker"]["username"]);
    $(".thoughtVenue").text(data["venue"]);
    $(".thoughtLocation").text(data["location"]);
    $(".thoughtDescription").text(data["description"]);
    $(".thoughtStartDate").text(data["start_date"]);
    $(".thoughtEndDate").text(data["end_date"]);
    $(".thoughtCategory").text(data["category"]);
    $(".next").attr("data-id", data["id"]);
    $(".previous").attr("data-id",data["id"]);     
}


$(".next").on("click", function(event) {
  var id = $(".next").attr("data-id")
  $.get("/thoughts/" + id + "/next", + function(data) {
    console.log(data)
    loadThought(data);
  });
  event.preventDefault();
});

$(".previous").on("click", function(event) {
  var id = $(".previous").attr("data-id")
  $.get("/thoughts/" + id + "/next", function(data) {
    console.log(data)
    loadThought(data);
  });
  event.preventDefault();
});


  // $("a.previous").on("click", function(e) {

  //   var addressValue = $(this).attr("href");
  //       alert(addressValue );

  //   $.getJSON(this.href).success(function(json) { 
  //     var title = $(json).attr('title')
  //     var $h1 = $("h1")
  //     $h1.html("")
  //     $h1.append("<h1>" + title + "</h1> ")
  //   });
  //   e.preventDefault();
  // })

  //LOAD COMMENTS
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

