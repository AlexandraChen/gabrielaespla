$ ->
  setTimeout ( ->
    $("#flash-notice").fadeOut().empty() 
  ), 5000

  $("#flash-notice").on "click", ->
    $(this).fadeOut()