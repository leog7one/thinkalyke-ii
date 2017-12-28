$(document).ready(function() {
  $("a.load_comments").on("click", function(e) {
    //REQUEST USING JSON
    $.ajax(({
      url: this.href,
      dataType: 'script'
    }))
    e.preventDefault();
  })

  $('#new_comment').on("submit", function(e) {
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

