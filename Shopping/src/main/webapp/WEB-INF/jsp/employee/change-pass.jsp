<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 10/23/2020
  Time: 2:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <base href="${pageContext.servletContext.contextPath }/">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Thêm mật khẩu</title>
    <style>
        #error{
            color: green;
        }
    </style>
</head>

<body>

<div id="main-wrapper">
    <jsp:include page="header.jsp"/>
    <jsp:include page="menu.jsp"/>
    <div class="page-wrapper">
        <!-- Container fluid  -->
        <div class="container-fluid">
            <!-- Bread crumb and right sidebar toggle -->
            <div class="row page-titles">
                <div class="col-md-5 col-8 align-self-center">
                    <h3 class="text-themecolor m-b-0 m-t-0">
                        Trang chủ
                    </h3>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="Shopping.com/employee/home">
                            Trang chủ </a></li>
                        <li class="breadcrumb-item active">
                            Thay đổi mật khẩu
                    </ol>
                </div>
            </div>
            <!-- End Bread crumb and right sidebar toggle -->
            <!-- Start Page Content -->
            <div class="row">
                <!-- column -->
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-block">
                            <h4 class="card-title">
                                Thay đổi mật khẩu
                            </h4>
                        </div>
                        <span id="error" class="pull-right span6">${message}</span>
                        <div class="span 6">
                        <form:form action="Shopping.com/employee/savechange-pass" method="POST" modelAttribute="employee" role="form" id="changePass">
                        <div class="row">
                            <div class="col-md-6">
                                <label>Mật Khẩu Cũ:
                                    (<span style="color: red;">*</span>)
                                </label>
                                <form:password id="password" path="password" placeholder="Nhập mật khẩu cũ"  cssClass="form-control form-control-line" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Mật Khẩu Mới: (<span style="color: red;">*</span>)
                                </label>
                                    <input type="password" id="password1" name="password1" placeholder="Nhập mật khẩu mới" size="30" maxlength="30" class="form-control form-control-line" >
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Xác Nhận Mật Khẩu: (<span style="color: red;">*</span>)
                                </label>
                                    <input type="password" id="password2" name="password2" placeholder="Xác nhận mật khẩu" size="30" maxlength="30" class="form-control form-control-line" >
                            </div>
                        </div>

                    </div>
                    <div class="row">
                        <div class="col-md-6 span6">
                            <button type="submit" class="btn btn-success">Change</button>
                        </div>
                    </div>
                    <br>
                    <form:hidden path="id"/>
                    <form:hidden path="username"/>
                    <form:hidden path="department.id"/>
                    <form:hidden path="employeeType"/>
                    <form:hidden path="email"/>
                    <form:hidden path="nameEmployee"/>
                    <form:hidden path="gender"/>
                    <form:hidden path="photo"/>
                    <form:hidden path="address"/>
                    <form:hidden path="numberPhone"/>
                    <form:hidden path="birthday"/>
                    <form:hidden path="access"/>
                    <form:hidden path="activated"/>
                    </form:form>
                    </div>
                </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End PAge Content -->
        </div>
        <!-- End Container fluid  -->
        <!-- footer -->
        <jsp:include page="footer.jsp"/>
</body>
<script src="project/themes/js/jquery-1.7.1.min.js"></script>
<script src="project/themes/js/jquery.validate.min.js"></script>
<script type="text/javascript">
    $(function() {
        $("#changePass").validate({
            rules : {
                password : {
                    required : true
                },
                password1 : {
                    required : true
                },
                password2 : {
                    required : true
                }
            },
            messages : {
                password : {
                    required : 'Vui lòng nhập mật khẩu cũ !'
                },
                password1 : {
                    required : 'Vui lòng nhập mật khẩu mới !'
                },
                password2 : {
                    required : 'Vui lòng xác nhận mật khẩu mới !'
                }
            }
        });
    });
</script>
</html>
