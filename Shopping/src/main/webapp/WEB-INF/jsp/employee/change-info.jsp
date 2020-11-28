<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 10/19/2020
  Time: 4:17 PM
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
    <title>Thay đổi thông tin</title>
    <style>
        .message{
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
                            <span class="message">${status_note_login}</span>
                            <form:form action="Shopping.com/employee/save-change" method="POST" modelAttribute="employee" enctype="multipart/form-data" id="changeInfo">
                                <div class="row">
                                    <div class="col-md-6">
                                        <label>Tên:
                                            (<span style="color: red;">*</span>)
                                            <form:errors path="nameEmployee" /></label>
                                        <form:input path="nameEmployee" id="nameEmployee" placeholder="Hãy nhập tên của bạn" size="30" maxlength="30"
                                                    class="form-control form-control-line" />
                                    </div>
                                    <div class="col-md-6">
                                        <label>Địa chỉ: (<span style="color: red;">*</span>)
                                            <form:errors path="address" /></label>
                                        <form:input path="address" id="address" placeholder="Địa chỉ của bạn" size="30" maxlength="30"
                                                    class="form-control form-control-line" />
                                    </div>
                                </div>
                                <br>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label><i class="fa fa-calendar bigger-110"> </i>
                                            Ngày sinh:
                                            (<span style="color: red;">*</span>)
                                            <form:errors path="birthday" /></label>
                                        <form:input path="birthday" id="birthday" placeholder="Ngày/Tháng/Năm" size="30"
                                                    maxlength="30" class="form-control form-control-line" />
                                    </div>
                                    <div class="col-md-6">
                                        <label> Điện thoại:
                                            (<span style="color: red;">*</span>)
                                            <form:errors path="numberPhone" /></label>
                                        <form:input path="numberPhone" id="numberPhone" placeholder="Nhập số điện thoại của bạn" size="30"
                                                    maxlength="30" class="form-control form-control-line" />
                                    </div>
                                </div>
                                <br>

                                <div class="row">

                                    <div class="col-md-6">
                                        <label>Giới tính:
                                            (<span style="color: red;">*</span>)
                                            <form:errors path="gender" />
                                        </label>
                                        <form:select path="gender" id="gender" class="form-control form-control-line">
                                            <form:option value="">
                                                --Lựa Chọn--
                                            </form:option>
                                            <form:option value="1">
                                                Nam
                                            </form:option>
                                            <form:option value="2">
                                                Nữ
                                            </form:option>

                                        </form:select>
                                    </div>

                                    <div class="col-md-6">
                                        <label>Ảnh đại điện:
                                            (<span style="color: red;">*</span>)
                                            <form:errors path="photo" /></label>
                                        <input id="photo" type="file" name="file_image" class="form-control form-control-line" />
                                    </div>
                                </div>
                                <br>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div style="text-align: center;">
                                            <button class="btn btn-primary">Thay đổi thông tin</button>
                                        </div>
                                    </div>

                                </div>
                                <br>
                                <form:hidden path="id" />
                                <form:hidden path="username"/>
                                <form:hidden path="email" />
                                <form:hidden path="password" />
                                <form:hidden path="access" />
                                <form:hidden path="activated" />
                                <form:hidden path="employeeType.id" />
                                <form:hidden path="department.id" />
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
<script src="project/themes/assets/js/jquery-3.1.1.min.js"></script>
<script src="project/themes/js/jquery-1.7.1.min.js"></script>
<script src="project/themes/js/jquery.validate.min.js"></script>
<script>
    $(function () {
        $("#changeInfo").validate({
            rules : {
                nameEmployee : {
                    required : true
                },
                address : {
                    required : true
                },
                birthday : {
                    required : true
                },
                numberPhone : {
                    required : true
                },
                gender : {
                    required : true
                },
                photo : {
                    required : true
                }
            },
            messages : {
                nameEmployee : {
                    required : 'Vui lòng nhập tên'
                },
                address : {
                    required : 'Vui lòng nhập địa chỉ'
                },
                birthday : {
                    required : 'Vui lòng nhập ngày sinh'
                },
                numberPhone : {
                    required : 'Vui lòng nhập số điện thoại'
                },
                gender: {
                    required : 'Vui lòng nhập giới tính'
                },
                photo : {
                    required : 'Vui lòng chọn ảnh'
                }
            }
        });
    });
</script>
</body>
</html>