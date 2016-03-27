$ ->
  setTimeout ( ->
    $("#flash-notice").fadeOut().empty() 
  ), 5000

  $("#flash-notice").on "click", ->
    $(this).fadeOut()

  $(window).scroll ->
    if $(this).scrollTop() > 100
      $('.scrollup').fadeIn()
    else
      $('.scrollup').fadeOut()
    return
    
  $('.scrollup').click ->
    $('html, body').animate { scrollTop: 0 }, 900
    false

  $(".tiles").mouseenter (e)->
    $(e.currentTarget.children[0]).css({visibility: "visible"})

  $(".tiles").mouseleave (e)->
    $(e.currentTarget.children[0]).css({visibility: "hidden"})


  $('a[href^="#contact-me"], a[href^="#who-am-i"]').on 'click', (e) ->
    e.preventDefault()

    target = @hash
    $target = $(target)

    $('html, body').stop().animate {
      'scrollTop': $target.offset().top
    }, 500, 'swing', ->
      window.location.hash = target