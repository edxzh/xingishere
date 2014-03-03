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

  window.addLink = () ->
    $value = $("#Cname").val()
    if $value != '' && notExist($value)
      $.ajax
        url: "/blogs/add_category"
        data: 
          blog_category_name: $value
        type: "POST"
        success: (data) ->
          if data.status == 1
            addCategory(data.id, data.name)
            $('.bs-modal-sm').modal('hide')
          else
            alert("Ajax请求失败，请联系开发者")
        error: () ->
          alert("ajax请求不成功，请联系开发者")
    else
      alert "新增的分类已存在"
      $('.bs-modal-sm').modal('hide')

  window.notExist = (value) ->
    flag = true
    $("#category option").each (index, item) ->
      if $(this).html() == value
        flag = false
    return flag

  window.addCategory = (id, name) ->
    $("#category option").each (index, item) ->
      $(this).attr("selected", false)
    $("#category").prepend("<option value=\""+id+"\" selected=\"selected\">"+name+"</option>")
