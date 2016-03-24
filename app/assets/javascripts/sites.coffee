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


  $('a[href^="#contact-me"]').on 'click', (e) ->
    e.preventDefault()

    target = @hash
    $target = $(target)

    $('html, body').stop().animate {
      'scrollTop': $target.offset().top
    }, 500, 'swing', ->
      window.location.hash = target