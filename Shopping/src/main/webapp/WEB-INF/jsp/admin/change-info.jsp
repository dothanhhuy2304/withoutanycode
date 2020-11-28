<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 10/27/2020
  Time: 10:04 AM
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
    Thay đổi thông tin
    <style>
        .errors{
            color: red;
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
                        <li class="breadcrumb-item"><a href="Shopping.com/admin/home">
                            Trang chủ </a></li>
                        <li class="breadcrumb-item active">
                            Thay đổi thông tin
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
                                Thay đổi thông tin
                            </h4>
                            <span class="errors">${message}</span>
                            <form:form action="Shopping.com/admin/save-change" method="POST" modelAttribute="admin" enctype="multipart/form-data" id="change">
                                <div class="row">
                                    <div class="col-md-6">
                                        <label>Tên:
                                            (<span style="color: red;">*</span>)
                                            <form:errors path="fullName" /></label>
                                        <form:input path="fullName" id="fullName" placeholder="Hãy nhập tên của bạn" size="30" maxlength="30"
                                                    class="form-control form-control-line" />
                                    </div>
                                    <div class="col-md-6">
                                        <label>Địa chỉ: (<span style="color: red;">*</span>)
                                            <form:errors path="username" /></label>
                                        <form:input path="username" id="username" placeholder="Nhập username của bạn" size="30" maxlength="30"
                                                    class="form-control form-control-line" />
                                    </div>
                                </div>
                                <br>
                                <div class="row">
                                <br>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div style="text-align: center;">
                                            <button class="btn btn-primary">Thay đổi thông tin</button>
                                        </div>
                                    </div>

                                </div>
                                <br>
                                    <form:hidden path="password"/>
                                <form:hidden path="access" />
                            </form:form>

                        </div>
                    </div>
                </div>
            </div>
            <!-- End PAge Content -->
        </div>
        <!-- End Container fluid  -->
        <!-- footer -->
        <jsp:include page="footer.jsp"/>
    </div>
</div>
<script type="text/javascript">
   $(function () {
        $("#change").validate({
            rules : {
                fullName : {
                    required : true
                },
                username : {
                    required : true
                },
                password : {
                    required : true
                }
            },
            messages : {
                fullName: {
                    required : 'Vui lòng nhập tên của bạn'
                },
                username : {
                    required : 'Vui lòng nhập tên tài khoản'
                },
                password : {
                    required : 'Vui lòng nhập password'
                }
            }
        });
   });
</script>
</body>
</html>