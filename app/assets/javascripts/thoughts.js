$(document).ready(function() {
  $("a.load_comments").on("click", function(e) {
    //FIRE SOME AJAX
    $.ajax({
      method: "GET",
      url: this.href 
    }).done(function(data) {
     //GET THE RESPONSE(VARIABLE DATA)
        console.log(data);

        //WANT TO LOAD DATA INTO DOM
      });

    e.preventDefault();
  })

})

