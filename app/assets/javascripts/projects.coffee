# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ -> 
  $('#pins').imagesLoaded ->
    $('#pins').masonry
      itemSelector: '.box'
      isFitWidth: true
  # $(".box").mouseenter (e)->
  #   $(e.currentTarget.children[0]).css({visibility: "visible"})

  # $(".box").mouseleave (e)->
  #   $(e.currentTarget.children[0]).css({visibility: "hidden"})

  $(".panel-heading").mouseenter (e)->
    $(e.currentTarget.children[0]).css({visibility: "visible"})

  $(".panel-heading").mouseleave (e)->
    $(e.currentTarget.children[0]).css({visibility: "hidden"})