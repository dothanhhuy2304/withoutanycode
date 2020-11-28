<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 10/26/2020
  Time: 2:45 PM
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
        .controls{
            height: 3em;
        }
    </style>
</head>
<body>
<jsp:include page="header.jsp"/>
<jsp:include page="menu.jsp"/>
<div id="mainBody">
    <div class="container">
        <div class="row">
            <!--  -->
            <div class="span9">
                <ul class="breadcrumb">
                    <li><a href="Shopping.com/admin/home">Home</a>
                        <span class="divider">/</span>
                    </li>
                    <li class="active">Registration</li>
                </ul>
                <h3>Registration</h3>
                <h4 style="color: red;">${message}</h4>
                <form:form action="Shopping.com/admin/saveRegister" method="post" modelAttribute="admin" class="form-horizontal"
                           role="form" id="register">
                    <div class="control-group">
                        <label class="control-label">User Name:
                            <sup style="color: red">*</sup>
                        </label>
                        <div class="controls">
                            <form:input path="username" id="username" placeholder="Full Name" cssClass="form-control" />
                        </div>
                        <form:errors path="username" cssClass="text-danger"/>
                    </div>
                    <div class="control-group">
                        <label class="control-label">Full Name:
                            <sup style="color: red">*</sup></label>
                        <div class="controls">
                            <form:input path="fullName" id="fullName" placeholder="Full Name" cssClass="form-control" />
                        </div>
                        <form:errors path="fullName" cssClass="text-danger"/>
                    </div>
                    <div class="control-group">
                        <label class="control-label">Password:
                            <sup style="color: red">*</sup></label>
                        <div class="controls">
                            <form:password path="password" id="password" placeholder="Password" cssClass="form-control" />
                        </div>
                        <form:errors path="password" cssClass="text-danger"/>
                    </div>
                    <div>
                        <button type="submit" class="btn btn-secondary">Register</button>
                    </div>
                </form:form>
            </div>
            <!--  -->
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"/>
</body>
<script src="project/themes/js/jquery-1.7.1.min.js"></script>
<script src="project/themes/js/jquery.validate.min.js"></script>
<script src="project/themes/assets/jquery-ui/jquery-ui.min.js"></script>
<script>
    $(function() {
        $(".birthday").datepicker({
            dateFormat : 'dd/mm/yy'
        });
        $("input#birthday").datepicker({
            dateFormat : 'dd/mm/yy'
        });
    });
</script>
<script type="text/javascript">
    $(function() {
        $("#register").validate({
            rules : {
                username : {
                    required : true
                },
                fullName : {
                    required : true
                },
                password : {
                    required : true,
                    minlength : 6
                }
            },
            messages : {
                username : {
                    required : 'Vui lòng nhập tên đăng nhập !'
                },
                fullName : {
                    required : 'Vui lòng nhập tên đầy đủ !'
                },
                password : {
                    required : 'Vui lòng nhập mật khẩu',
                    minlength : 'Mật khẩu phải lớn hơn 6 ký tự !'
                }
            }
        });
    });
</script>
</html>