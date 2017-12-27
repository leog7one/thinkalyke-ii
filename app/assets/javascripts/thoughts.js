$(document).ready(function() {
  $("a.load_comments").on("click", function(e) {
    $.ajax({
      method: "GET",
      url: this.href 
    }).done(function(response) {
        $("div.thought-comments").html(response);
      });
    e.preventDefault();
  })

})

