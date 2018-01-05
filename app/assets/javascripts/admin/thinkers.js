document.addEventListener("turbolinks:load", function() { 
  
   function loadThinker(data) {
    var $username = $(".thinkerUsername").html('');
    $username.append("<h1>" + data.username + "<h1>");
    var $email = $(".thinkerEmail").html('');
    $email.append(`<h4>Email: ${data.email} <h4>`);
    var $joined = $(".thinkerJoin").html('');
    $joined.append(`<h4>Member Since: ${data.created_at} <h4>`);
    var $thoughts = $(".thinkerThoughts").html('');
    data['thoughts'].forEach(function(thought) {
      title = thought.title
      created_at = thought.created_at
      $thoughts.append(`<tr><td>${title}</td><td>${created_at}</td></tr>`);
    })
    var $comments = $(".comment-list").html('');
    data['comments'].forEach(function(comment) {
      body = comment.body
      thought_title = comment.thought.title
      comment_created = comment.created_at
      $comments.append(`<tr><td>${body}</td><td>${comment_created}</td><td>${thought_title}</td></tr>`);
    })

 }

  $(".js-next").on("click", function(event) {
    var id = $(".js-next").attr("data-id")
    $.get("/admin/thinkers/" + id + "/next", function(data) {
      //  console.log(data['thoughts'])
       loadThinker(data);
    });
    event.preventDefault();
  });

  $(".js-previous").on("click", function(event) {
    var id = $(".js-previous").attr("data-id")
    $.get("/admin/thinkers/" + id + "/previous", function(data) {
      console.log(data)
      loadThinker(data);
    });
    event.preventDefault();

  });


})