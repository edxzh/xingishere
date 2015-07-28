// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require kindeditor
if (window.console) {
  var cons = console;
  if (cons) {
    cons.log("喜欢看星哥的代码，星哥欢迎和您一起讨论学习! 请邮件至Edward_mjz@hotmail.com");
    cons.log("请在邮件中注明%c来自:console,星哥愿意请您吃饭！","color:red;font-weight:bold;");
  }
}

$(function(){
  $("#sub_submit").click(function(){
    email = $("#subscribe_email").val();
    $.ajax({
      url: "/subscribes/",
      type: 'POST',
      data: {
        email: email
      },
      success: function(data, status){
        if(data.status == -1) {
          swal('sorry', data.message, "error");
        } else {
          swal('success!', data.message, "success")
        }
        $("#sub_message").html(data.message);
        $("#sub_message").show();
      }
    })
  })
})
