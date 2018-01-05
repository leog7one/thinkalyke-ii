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
      $thoughts.append(`<tr><td>${title}</td></tr>`);
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