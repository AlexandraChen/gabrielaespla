# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ -> 
  $('#pins').imagesLoaded ->
    $('#pins').masonry
      itemSelector: '.box'
      isFitWidth: true

  $(".panel-heading#rounded-img-wrapper").mouseenter (e)->
    $(e.currentTarget.children[0]).css({visibility: "visible"})

  $(".panel-heading#rounded-img-wrapper").mouseleave (e)->
    $(e.currentTarget.children[0]).css({visibility: "hidden"})


  $(".panel-heading#img-wrapper").mouseenter (e)->
    $(e.currentTarget.children[0]).css({visibility: "visible"})

  $(".panel-heading#img-wrapper").mouseleave (e)->
    $(e.currentTarget.children[0]).css({visibility: "hidden"})
