# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready ->
  $('.form_date').datetimepicker
    language:  'zh-CN'
    weekStart: 1
    todayBtn:  1
    autoclose: 1
    todayHighlight: 1
    startView: 2
    minView: 2
    forceParse: 0
