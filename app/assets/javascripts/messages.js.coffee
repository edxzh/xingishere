# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready ->
  $(".say").on 'click', () ->
    $(".msg_form").show()
    $(".say").hide()

  $(".msg_btn").on 'click', () ->
    content = $(".msg_text_area").val()
    if content != ""
      $.ajax
        url: '/messages'
        type: 'POST'
        data:
          content: content
        success: (data) ->
          # $("").html(data.message)
          if data.status != -1
            $(".alert").show()
            $(".msg_box").html(data)
            $(".msg_form").hide()
            $(".msg_text_area").val("")
            $(".say").show()
          else
            alert data.message
        error: (data) ->
          alert(data.message)
    else
      alert "请填写评论内容"

  window.paginate = () ->
    $(".pagi nav .pagination").on "click", "a", () ->
      $.ajax
        url: $(this).attr('href')
        type: 'GET'
        success: (data) ->
          $(".msg_box").html $(data).find('.msg_box').html()
          window.location.hash = "#tag"
          paginate()
      return false

  paginate()
