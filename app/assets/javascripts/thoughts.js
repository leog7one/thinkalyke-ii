$(document).ready(function() {
  $("a.load_comments").on("click", function(e) {
    //REQUEST USING JSON
    $.ajax(({
      url: this.href,
      dataType: 'script'
    }))
    e.preventDefault();
  })



})

