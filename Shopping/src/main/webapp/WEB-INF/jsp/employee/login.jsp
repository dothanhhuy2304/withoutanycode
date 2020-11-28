<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 10/16/2020
  Time: 2:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!doctype html>
<html lang="en">
<head>
    <base href="${pageContext.servletContext.contextPath }/">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width" />
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <link href="project/themes/login/css/bootstrap.css" rel="stylesheet" />
    <link href="project/themes/login/css/coming-sssoon.css" rel="stylesheet" />
    <!--     Fonts     -->
    <link href="project/themes/font/font.css" rel="stylesheet" type="text/css">
    <link rel="apple-touch-icon" sizes="76x76" href="project/themes/login/images/new_logo.png">
    <link rel="icon" type="login/image/png" sizes="96x96" href="project/themes/login/images/new_logo.png">
    <title>Login</title>
    <style>
        #text{
            margin-left: -6em;
        }
        .has-errors{
            color: red;
        }
        #message-error{
            font-family: Helvetica sans-serif;
            line-height: 2.345;
            color: #1fa80a;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-transparent navbar-fixed-top"
     role="navigation">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>
        <div class="collapse navbar-collapse"
             id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#"> <i class="fa fa-facebook-square"></i>
                    Facebook
                </a></li>
                <li><a href="#"> <i class="fa fa-google-plus-square"></i>
                    Plus
                </a></li>
                <li><a href="#"> <i class="fa fa-pinterest"></i> Pin
                </a></li>
            </ul>
        </div>
        <!-- navbar-collapse -->
    </div>
    <!-- container -->
</nav>

<div class="main">
    <video id="video_background" preload="auto" autoplay="true"
           loop="loop" muted="muted" volume="0">
        <source src="project/themes/login/video/life.mp4" type="video/mp4">
        Video not supported
    </video>
    <div class="cover black" data-color="black"></div>
    <div class="container">
        <div class="content">
            <h3 class="motto">
                Chào mừng đến với trang quản trị viên
                <br>
              Nếu bạn là nhân viên hãy đăng nhập
            </h3>
            <div class="subscribe">
                <h5  class="info-text" id="text">
                    Thông Tin Đăng Nhập
                </h5>
                <div class="row">
                    <div class="col-md-4 col-md-offset-4 col-sm6-6 col-sm-offset-3 ">
                        <form:form class="form-inline" action="Shopping.com/employee/checkLogin" method="post"
                                   modelAttribute="employee" id="login">
                            <div class="form-group">
                                <label class="sr-only">Username</label>
                                <label id="message-error">${message}</label>
                                <form:input path="username" id="id" placeholder="Please enter the username" value="dothanhhuy" class="form-control transparent" />
                            </div>
                            <br>
                            <form:errors path="username" cssClass="has-errors" />
                            <br>
                            <br>
                            <div class="form-group">
                                <label class="sr-only">Password</label>
                                <form:password path="password" id="password" placeholder="Please enter a password" value="dothanhhuy" class="form-control transparent" />
                            </div>
                            <br>
                            <form:errors path="password" cssClass="has-errors"/>
                            <div class="form-group">
                                <label class="sr-only">Password</label>
                                <input type="checkbox" name="remember" class="checkbox" value="1"/><span class="text-primary"> Remember</span>
                            </div>
                            <br>
                            <div class="form-group">
                                <button type="submit" class="btn btn-primary">
                                  Đăng Nhập
                                </button>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="footer">
        <div class="container">
            <i class="fa fa-heart heart"></i>
         Create by
             <a href="https://www.facebook.com/people/%C4%90%E1%BB%97-Huy/100010618027265">Đỗ Huy</a>
          Liên hệ
            <a href="https://www.facebook.com/people/%C4%90%E1%BB%97-Huy/100010618027265">
                Click here
            </a>
        </div>
    </div>
</div>
</body>
<script src="project/themes/login/js/jquery-1.10.2.js" type="text/javascript"></script>
<script src="project/themes/login/js/bootstrap.min.js" type="text/javascript"></script>
<script src="project/themes/js/jquery.validate.min.js"></script>
<script>
    $(function () {
        $("#login").validate({
            rules : {
                id : {
                    required : true
                },
                password : {
                    required: true
                }
            },
            messages : {
                id: {
                    required: 'Vui lòng nhập username',
                },
                password: {
                    required: 'Vui lòng nhập password',
                }
            }
        });
    });
</script>
</html>