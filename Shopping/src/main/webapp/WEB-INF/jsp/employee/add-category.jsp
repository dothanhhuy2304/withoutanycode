<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 10/23/2020
  Time: 2:15 PM
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
    <title>Thêm thể loại</title>
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
                                Thêm thể loại
                            </h4>
                            <span class="pull-right">${message}</span>
                            <form:form action="Shopping.com/employee/category/saveCategory" method="POST" modelAttribute="category" id="category">
                                <%--                                    commandName="employee"--%>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label>Tên thể loại tiếng việt:
                                            (<span style="color: red;">*</span>)
                                            <form:errors path="nameCategory" /></label>
                                        <form:input path="nameCategory" id="nameCategory" placeholder="Hãy nhập thể loại" size="30" maxlength="30" class="form-control form-control-line" />
                                    </div>
                                    <div class="col-md-6">
                                        <label>Tên thể loại tiếng anh: (<span style="color: red;">*</span>)
                                            <form:errors path="nameCategoryEN" /></label>
                                        <form:input path="nameCategoryEN" id="nameCategoryEN" placeholder="Thể loại tiếng anh" size="30" maxlength="30" class="form-control form-control-line" />
                                    </div>
                                </div>
                                <div class="row">
                                <div class="col-md-6">
                                <button type="submit" class="btn btn-success">Thêm</button>
                                </div>
                                </div>
                                <br>
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
</body>
<script src="project/themes/js/jquery-1.7.1.min.js"></script>
<script src="project/themes/js/jquery.validate.min.js"></script>
<script type="text/javascript">
    $(function () {
        $("#category").validate({
            rules : {
                nameCategory : {
                    required : true
                },
                nameCategoryEN : {
                    required : true
                }
            },
            messages : {
                nameCategory : {
                    required : 'Vui lòng nhập thể loại tiếng việt'
                },
                nameCategoryEN : {
                    required : 'Vui lòng nhập thể loại tiếng anh'
                }
            }
        });
    });
</script>
</html>