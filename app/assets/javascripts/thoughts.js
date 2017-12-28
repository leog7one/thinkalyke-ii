$(document).ready(function() {
  $("a.load_comments").on("click", function(e) {
    //REGULAR AJAX GET REQUEST
    // $.ajax({
    //   method: "GET",
    //   url: this.href 
    // }).success(function(response) {
    //     $("div.thought-comments").html(response);
    //   });

    //REQUEST USING $.get

    // $.get(this.href).success(function(response) {
    //   $("div.thought-comments").html(response)
    // })

    //REQUEST USING JSON
    $.ajax(({
      url: this.href,
      dataType: 'script'
    }))
    e.preventDefault();
  })

})

