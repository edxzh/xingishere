# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
window.addLink = () ->
  $value = $("#Cname").val()
  if $value != '' && notExist($value)
    $.ajax
      url: "/link_category"
      data: 
        link_category_name: $value
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

$(document).ready ->
  $(".list-inline li a").tooltip()
