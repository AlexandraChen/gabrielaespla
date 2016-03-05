$(document).ready(function () {
  
  setTimeout(function() {
    $("#flash-notice").fadeOut().empty();
  }, 5000);
  
  $("#flash-notice").on("click",function(){
    $(this).fadeOut();
   })

  }
)