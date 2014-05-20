# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->

  window.addLink = () ->
    $value = $("#Cname").val()
    if $value != '' && notExist($value)
      $.ajax
        url: "/blogs/add_category"
        type: "POST"
        data:
          blog_category_name: $value
        success: (data) ->
          if data.status == 1
            addCategory(data.id, data.name)
            $('.bs-modal-sm').modal('hide')
            return false
          else
            alert("Ajax请求失败，请联系开发者")
        error: (XMLHttpRequest, textStatus, errorThrown) ->
          alert(XMLHttpRequest.readyState + XMLHttpRequest.status + XMLHttpRequest.responseText)
          return false
    else
      alert "新增的分类已存在"
      $('.bs-modal-sm').modal('hide')

  window.notExist = (value) ->
    flag = true
    $("#blog_blog_category_id option").each (index, item) ->
      if $(this).html() == value
        flag = false
    return flag

  window.addCategory = (id, name) ->
    $("#blog_blog_category_id option").each (index, item) ->
      $(this).attr("selected", false)
    $("#blog_blog_category_id").prepend("<option value=\""+id+"\" selected=\"selected\">"+name+"</option>")
