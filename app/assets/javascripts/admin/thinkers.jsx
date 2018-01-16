document.addEventListener("turbolinks:load", function() { 
  
   function loadThinker(data) {
    $(".js-next").attr("data-id", data["id"]);
    $(".js-previous").attr("data-id",data["id"]);
    const $username = $(".thinkerUsername").html('');
    $username.append("<h1>" + data.username + "<h1>");
    const $email = $(".thinkerEmail").html('');
    $email.append(`<h4>Email: ${data.email} <h4>`);
    const $thoughts = $(".thinkerThoughts").html('');
    data['thoughts'].forEach(function(thought) {
      title = thought.title
      $thoughts.append(`<tr><td>${title}</td></tr>`);
    })
    const $comments = $(".comment-list").html('');
    data['comments'].forEach(function(comment) {
      body = comment.body
      thought_title = comment.thought.title
      $comments.append(`<tr><td>${body}</td><td>${thought_title}</td></tr>`);
    })

 }

  $(".js-next").on("click", function(event) {
    const id = $(".js-next").attr("data-id")
    $.get("/admin/thinkers/" + id + "/next", function(data) {
      //  console.log(data['thoughts'])
       loadThinker(data);
    });
    event.preventDefault();
  });

  $(".js-previous").on("click", function(event) {
    const id = $(".js-previous").attr("data-id")
    $.get("/admin/thinkers/" + id + "/previous", function(data) {
     // console.log(data)
      loadThinker(data);
    });
    event.preventDefault();
  });


})