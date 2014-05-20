# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  window.user_like = (blogId) ->
    $.ajax
      url: "/blogs/user_like"
      data:
        blog_id: blogId
      dataType: 'json'
      success: (data) ->
        if data.type == 1
          $("#like_icon").attr("class", "glyphicon glyphicon-heart")
          updateLike(data.count)
        else if data.type == 0
          $("#like_icon").attr("class", "glyphicon glyphicon-heart-empty")
          updateLike(data.count)
        else
          toggle()
      error: () ->
        alert("ajax请求不成功，请联系开发者")

  window.updateLike = (count) ->
    str = ''
    str = '' + count
    $("#count").html(str)

  window.toggle = () ->
    count = $("#count").html()
    if $("#like_icon").hasClass("glyphicon-heart-empty")
      $("#like_icon").attr("class", "glyphicon glyphicon-heart")
      count -= -1
      updateLike(count)
    else
      $("#like_icon").attr("class", "glyphicon glyphicon-heart-empty")
      count -= 1
      updateLike(count)

  $(".cmt_btn").on 'click', () ->
    content = $(".cmt_text_area").val()
    blog_id = $("#blog_id").val()
    if content != ""
      $.ajax
        url: '/comments'
        type: 'POST'
        data:
          blog_id: blog_id
          content: content
        success: (data) ->
          if data.status != -1
            $(".cmt_box").html(data)
            $(".cmt_text_area").val("")
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
          $(".cmt_box").html $(data).find('.cmt_box').html()
          window.location.hash = "#tag"
          paginate()
      return false

  paginate()
