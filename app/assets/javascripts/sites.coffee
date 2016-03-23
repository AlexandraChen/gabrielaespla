$ ->
  setTimeout ( ->
    $("#flash-notice").fadeOut().empty() 
  ), 5000

  $("#flash-notice").on "click", ->
    $(this).fadeOut()


  $(".tiles").mouseenter (e)->
    $(e.currentTarget.children[0]).css({visibility: "visible"})

  $(".tiles").mouseleave (e)->
    $(e.currentTarget.children[0]).css({visibility: "hidden"})
