# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  $("#sub_submit").on 'click', () ->
    email = $("#subscribe_email").val()
    $.ajax
      url: "/subscribes/"
      type: 'POST'
      data:
        email: email
      success: (data) ->
        $("#sub_message").html(data.message)
        $("#sub_message").show()
