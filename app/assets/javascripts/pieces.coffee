$ ->
  $(".piece-tiles").mouseenter (e)->
    $(e.currentTarget.children[0]).stop(true, true).fadeOut()

  $(".piece-tiles").mouseleave (e)->
    $(e.currentTarget.children[0]).stop(true, true).fadeIn();