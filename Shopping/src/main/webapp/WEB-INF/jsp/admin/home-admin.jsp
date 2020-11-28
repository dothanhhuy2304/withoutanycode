<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 10/13/2020
  Time: 3:55 PM
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
                        <li class="breadcrumb-item"><a href="Shopping.com/admin/home">Trang chủ</a></li>
                        <li class="breadcrumb-item active">Thông Tin Cá Nhân</li>
                    </ol>
                </div>
            </div>
            <!--  -->
            <!-- End Bread crumb and right sidebar toggle -->
            <c:if test="${sessionScope.admin.fullName != null}">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <img class="card-img-top" src="project/admin/admin3.jpg" alt="Card image cap">
                            <div class="card-block little-profile text-center">
                                <h3 class="m-b-0">
                                    Thông tin chi tiết
                                </h3>
                                <p>${sessionScope.admin.fullName }</p>
                                <!--  -->
                                <a href="Shopping.com/admin/change-pass/${sessionScope.admin.username}.htm"
                                   class=" btn btn-primary btn-md btn-rounded">Thay đổi mật khẩu</a>
                                <a href="Shopping.com/admin/change-info/${sessionScope.admin.username}.htm"
                                    class=" btn btn-primary btn-md btn-rounded">Thay đổi thông tin</a>
                                <!--  -->
                                <hr>
                                <div class="row text-center m-t-20">

                                    <div class="col-lg-3 col-md-4 m-t-20">
                                        <h3 class="m-b-0 font-light">
                                        </h3>

                                    </div>
                                    <div class="col-lg-2 col-md-3 m-t-20">
                                        <h3 class="m-b-0 font-light">
                                            Tên Tài Khoản
                                        </h3>
                                        <small>${sessionScope.admin.username }</small>
                                    </div>
                                    <div class="col-lg-2 col-md-3 m-t-20">
                                        <h3 class="m-b-0 font-light">
                                            Tên Admin
                                        </h3>
                                        <small>
                                            ${sessionScope.admin.fullName}</small>
                                    </div>
                                    <div class="col-lg-2 col-md-3 m-t-20">
                                        <h3 class="m-b-0 font-light">
                                            Chức Vụ
                                        </h3>
                                        <small><c:choose>
                                            <c:when test="${sessionScope.admin.access >= 1 }"> Quản Trị Viên  </c:when>
                                        </c:choose></small>
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