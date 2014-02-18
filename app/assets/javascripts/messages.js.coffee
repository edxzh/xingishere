# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready ->
  $(".say").on 'click', () ->
    $(".msg_form").show()
    $(".say").hide()
  $(".msg_btn").on 'click', () ->
    content = $(".msg_text_area").val()
    $.ajax
      url: '/messages'
      type: 'POST'
      data:
        content: content
      success: (data) ->
        # $("").html(data.message)
        $(".msg_box").html(data)
      error: (data) ->
        alert(data.message)

