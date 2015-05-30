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
        swal("哎呀妈呀!", "ajax请求不成功，联系开发者有饭吃哦！", "error")

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
    content   = $(".cmt_text_area").val()
    blog_id   = $("#blog_id").val()
    nickname  = $(".cmt_user_name").val()
    email     = $(".cmt_user_email").val()
    if validate_input() == true
      $.ajax
        url: '/comments'
        type: 'POST'
        data:
          blog_id: blog_id
          content: content
          nickname: nickname
          email:  email
        success: (data) ->
          if data.status != -1
            $(".cmt_box").html(data)
            $(".cmt_text_area").val("")
          else
            swal("哎呀妈呀!", data.message, "error")
        error: (data) ->
          swal("哎呀妈呀!", data.message, "error")

  window.validate_input = () ->
    if $(".cmt_user_name").length > 0 && $(".cmt_user_name").val() == ""
      swal("哎呀妈呀!", "昵称都没有还想评论？想的美!", "error")
      return false
    if $(".cmt_user_email").length > 0 && $(".cmt_user_email").val() == ""
      swal("哎呀妈呀!", "没填电子邮箱我们咋联系你捏？", "error")
      return false
    if $(".cmt_user_email").length > 0 && validate_email_regexp($(".cmt_user_email").val()) == false
      swal("哎呀妈呀!", "真尼玛的亮瞎了，你填的是电子邮件？", "error")
      return false
    if $(".cmt_text_area").val() == ""
      swal("哎呀妈呀!", "伸伸小手，填写评论内容好吗？", "error")
      return false
    return true

  window.validate_email_regexp = (email) ->
    regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/
    return regex.test email


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
