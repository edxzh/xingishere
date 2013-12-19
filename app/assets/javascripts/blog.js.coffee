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
        else
          $("#like_icon").attr("class", "glyphicon glyphicon-heart-empty")
          updateLike(data.count)
      error: () ->
        alert("ajax请求不成功？！")

  window.updateLike = (count) ->
    str = ''
    str = '' + count
    $("#count").html(str)