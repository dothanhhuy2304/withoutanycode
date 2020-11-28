<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 10/19/2020
  Time: 11:29 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <base href="${pageContext.servletContext.contextPath }/">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Trang chủ</title>
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
                        <li class="breadcrumb-item"><a href="Shopping.com/employee/home">Trang chủ</a></li>
                        <li class="breadcrumb-item active">Thông Tin Cá Nhân</li>
                    </ol>
                </div>
            </div>
            <!--  -->
            <!-- End Bread crumb and right sidebar toggle -->
            <c:if test="${sessionScope.employee.nameEmployee != null}">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <img class="card-img-top" src="project/themes/lite/images/background/backgound-infor.jpg" alt="Card image cap">
                            <div class="card-block little-profile text-center">
                                <div class="pro-img">
                                    <a href="project/employees/${sessionScope.employee.photo}">
                                        <img src="project/employees/${sessionScope.employee.photo }" alt="user"></a>
                                </div>
                                <h3 class="m-b-0">
                                    Thông tin chi tiết
                                </h3>
                                <p>${sessionScope.employee.nameEmployee }</p>
                                <!--  -->
                                <a href="Shopping.com/employee/change-pass/${sessionScope.employee.id}.htm"
                                   class=" btn btn-primary btn-md btn-rounded">Thay đổi mật khẩu</a> <a
                                    href="Shopping.com/employee/change-info/${sessionScope.employee.id}.htm"
                                    class=" btn btn-primary btn-md btn-rounded">Thay đổi thông tin</a>
                                <!--  -->
                                <hr>
                                <div class="row text-center m-t-20">
                                    <div class="col-lg-2 col-md-3 m-t-20">
                                        <h3 class="m-b-0 font-light">
                                            Địa chỉ
                                        </h3>
                                        <small>${sessionScope.employee.address }</small>
                                    </div>
                                    <div class="col-lg-2 col-md-3 m-t-20">
                                        <h3 class="m-b-0 font-light">
                                           Ngày sinh
                                        </h3>
                                        <small>
                                            <fmt:formatDate value="${sessionScope.employee.birthday}" pattern="dd/MM/yyyy" /></small>
                                    </div>
                                    <div class="col-lg-2 col-md-3 m-t-20">
                                        <h3 class="m-b-0 font-light">
                                          Giới tính
                                        </h3>
                                        <small><c:choose>
                                            <c:when test="${sessionScope.employee.gender < 2 }"> Nam </c:when>
                                            <c:when test="${sessionScope.employee.gender >= 2}"> Nữ </c:when>
                                        </c:choose></small>
                                    </div>
                                    <div class="col-lg-2 col-md-3 m-t-20">
                                        <h3 class="m-b-0 font-light">
                                           Điện thoại
                                        </h3>
                                        <small>${sessionScope.employee.numberPhone}</small>
                                    </div>
                                    <div class="col-lg-2 col-md-3 m-t-20">
                                        <h3 class="m-b-0 font-light">
                                             Phòng ban
                                        </h3>
                                        <small>${sessionScope.employee.department.nameDepartment }</small>
                                    </div>
                                    <div class="col-lg-2 col-md-3 m-t-20">
                                        <h3 class="m-b-0 font-light">
                                            Loại nhân viên
                                        </h3>
                                        <small>${sessionScope.employee.employeeType.nameEmployeeType }</small>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:if>
            <div class="row">
                <!-- column -->
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-block">
                            <h4 class="card-title">
                                <br><br><br>
                            </h4>
                        </div>
                    </div>
                </div>

            <!-- End PAge Content -->
        </div>
    </div>
    <jsp:include page="footer.jsp"/>
</div>
</body>
</html>