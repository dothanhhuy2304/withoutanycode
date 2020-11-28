<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 10/25/2020
  Time: 4:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <base href="${pageContext.servletContext.contextPath }/">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width" />
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <title>Quản Lý Đơn Hàng</title>
    <style>
        i{
            color: black;
        }
        label{
            color: #1a67e2;
        }
        .content{
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
                        Quản Lý Đơn Hàng
                    </h3>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="Shopping.com/employee/home">Trang Chủ</a></li>
                        <li class="breadcrumb-item active">
                            Chi Tiết Đơn Hàng</li>
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
                                Thêm Sản Phẩm
                            </h4>
                            <table>
                                <div class="row">
                                    <div class="col-md-6">
                                        <i class="mdi mdi-account-box"></i>
                                        <label> Mã Đơn Hàng :
                                            <span class="content">
                                                ${order.id}
                                            </span>
                                        </label>
                                    </div>
                                    <div class="col-md-6">
                                        <i class="mdi mdi-account"></i>
                                        <label>Tên Tài Khoản:
                                            <span class="content">${order.customer.id}</span>
                                        </label>
                                    </div>
                                </div>
                                <br>
                                <div class="row">
                                    <div class="col-md-6">
                                        <i class="mdi mdi-account"></i>
                                        <label>Người Nhận:
                                            <span class="content">
                                                ${order.receiver}
                                            </span>
                                        </label>
                                    </div>
                                    <div class="col-md-6">
                                        <i class="mdi mdi-email-variant"></i>
                                        <label>Địa Chỉ Email:
                                            <span class="content">${order.customer.email}</span>
                                        </label>
                                    </div>
                                </div>
                                <br>
                                <div class="row">
                                    <div class="col-md-6">
                                        <i class="mdi mdi-account-location"></i>
                                        <label>Địa Chỉ </label>
                                        <span class="content">${order.address}</span>
                                    </div>
                                    <div class="col-md-6">
                                        <i class="fa fa-calendar bigger-110"> </i>
                                        <label>Ngày Đặt Hàng:
                                        </label>
                                        <span class="content"><fmt:formatDate value="${order.orderDate}" pattern="dd-MM-yyyy"/></span>
                                    </div>
                                </div>
                                <br>
                                <div class="row">
                                    <div class="col-md-6">
                                        <i class="mdi mdi-sale"></i>
                                        <label>Đơn Giá : </label>
                                       <span class="content"><fmt:formatNumber value="${order.amount}" type="number"/> VNĐ</span>
                                    </div>
                                    <div class="col-md-6">
                                        <i class="fa fa-calendar bigger-110"> </i>
                                        <label>Ngày Giao Hàng:
                                        </label>
                                        <span class="content"><fmt:formatDate value="${order.requireDate}" pattern="dd-MM-yyyy"/></span>
                                    </div>
                                </div>
                                <br>
                                <div class="row">
                                    <div class="col-md-6">
                                        <i class="mdi mdi-phone"></i>
                                        <label>
                                            Số Điện Thoại:
                                        </label>
                                        <span class="content">${order.numberPhone}</span>
                                    </div>
                                    <div class="col-md-6">
                                        <i class="mdi mdi-android"></i>
                                        <label>Trạng Thái Đơn Hàng:
                                        </label>
                                        <span class="content">
                                        <c:choose>
                                            <c:when test="${order.status == 1}">
                                                Đang Chờ
                                            </c:when>
                                            <c:when test="${order.status == 2}">
                                                Đã Hủy
                                            </c:when>
                                            <c:when test="${order.status == 3}">
                                                Đã Xác Nhận
                                            </c:when>
                                            <c:when test="${order.status == 4}">
                                                Đã Giao Hàng
                                            </c:when>
                                            <c:otherwise>
                                                Đã Giao Hàng
                                            </c:otherwise>
                                        </c:choose>

                                        </span>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <i class="mdi mdi-pencil"></i>
                                        <label>Mô Tả:
                                        </label>
                                        <span class="content">${order.description}</span>
                                    </div>
                                </div>
                                <br>
                            </table>
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
</html>
