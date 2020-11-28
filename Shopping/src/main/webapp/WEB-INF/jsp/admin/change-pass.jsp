<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 10/28/2020
  Time: 10:32 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <base href="${pageContext.servletContext.contextPath }/" />
    <meta charset="utf-8">
    <title>Website Bán Hàng Online</title>
    <link href="project/themes/assets/jquery-ui/jquery-ui.min.css" rel="stylesheet" />
    <style>
        #a{
            width: 100% !important;
        }
        .controls{
            height: 3em;
        }
    </style>
</head>
<body>
<jsp:include page="header.jsp"/>
<jsp:include page="menu.jsp"/>
<div class="page-wrapper">
<div id="mainBody">
    <div class="container">
        <div class="row">
            <!--  -->
            <div class="span9" id="a">
                <ul class="breadcrumb">
                    <li><a href="Shopping.com/admin/home">Trang Chủ</a>
                        <span class="divider">/</span>
                    </li>
                    <li class="active">Thay Đổi Mật Khẩu</li>
                </ul>
                <h3>Thay Đổi Mật Khẩu</h3>
                <h4 style="color: red;">${message}</h4>
                <form:form action="Shopping.com/admin/save-pass" method="post" modelAttribute="admin" class="form-horizontal"
                           role="form" id="change-pass">
                    <div class="control-group">
                        <label class="control-label">Old Password:
                            <sup style="color: red">*</sup>
                        </label>
                        <div class="controls">
                            <input type="password" name="password" id="password" placeholder="Nhập mật khẩu cũ của bạn" class="form-control" />
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">New Password:
                            <sup style="color: red">*</sup></label>
                        <div class="controls">
                            <input type="password" name="password1" id="password1" placeholder="Nhập mật khẩu mới" class="form-control" />
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">Confirm Password:
                            <sup style="color: red">*</sup></label>
                        <div class="controls">
                            <input type="password" name="password2" id="password2" placeholder="Xác nhận mật khẩu" class="form-control" />
                        </div>
                    </div>
                    <div>
                        <button type="submit" class="btn btn-secondary">Change</button>
                    </div>
                    <form:hidden path="username"/>
                    <form:hidden path="fullName"/>
                    <form:hidden path="access"/>
                </form:form>
            </div>
            <!--  -->
        </div>
    </div>
</div>
</div>
<jsp:include page="footer.jsp"/>
</body>
<script src="project/themes/assets/jquery-ui/jquery-ui.min.js"></script>
<script src="project/themes/js/jquery-1.7.1.min.js"></script>
<script src="project/themes/js/jquery.validate.min.js"></script>
<script type="text/javascript">
    $(function() {
        $("#change-pass").validate({
            rules : {
                password : {
                    required : true,
                    minlength : 6
                },
                password1 : {
                    required : true,
                    minlength : 6
                },
                password2 : {
                    required : true,
                    minlength : 6
                }
            },
            messages : {
                password : {
                    required : 'Vui lòng nhập tên đăng nhập !',
                    minlength : 'Mật khẩu phải lớn hơn 6 kỹ tự'
                },
                password1 : {
                    required : 'Vui lòng nhập tên đầy đủ !',
                    minlength : 'Mật khẩu phải lơn hơn 6 ký tự'
                },
                password2 : {
                    required : 'Vui lòng xác nhận mật khẩu',
                    minlength : 'Mật khẩu phải lớn hơn 6 ký tự !'
                }
            }
        });
    });
</script>
</html>