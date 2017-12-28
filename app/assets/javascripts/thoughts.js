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
    alert("You clicked submit")
    
    e.preventDefault();
  })


})

