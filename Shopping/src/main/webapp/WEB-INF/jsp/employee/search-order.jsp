<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 10/26/2020
  Time: 11:21 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <base href="${pageContext.servletContext.contextPath }/">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Quản lý đơn hàng</title>
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
                        Thông Tin Đơn Hàng
                    </h3>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="Shopping.com/employee/home">
                            Trang chủ</a></li>
                        <li class="breadcrumb-item active">
                            Danh Sách Đơn Hàng</li>
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
                                Dang Sách Đơn Hàng
                            </h4>
                            <h6 class="card-subtitle">
                                Ở đây bạn có thể thực hiện các chức năng
                            </h6>
                            <!-- Tìm Kiếm -->

                            <form:form action="Shopping.com/employee/order/search.htm" method="POST">
                                <div class="row">
                                    <div class="col-md-3">
                                        <input type="text" name="key" placeholder="Tìm kiếm" class="form-control form-control-line" />
                                    </div>
                                    <div class="col-md-3">
                                        <button type="submit" class="btn btn-danger">Tìm Kiếm</button>
                                    </div>
                                </div>

                            </form:form>
                            <!-- Lọc -->
                            <br>
                            <form:form action="Shopping.com/employee/order/filter.htm" method="POST">
                                <div class="row">
                                    <div class="col-md-2">
                                        <select name="key" class="form-control form-control-line">
                                            <option selected="selected" value="">
                                                --Lựa Chọn--</option>
                                            <option value="1">
                                                Đang Chờ
                                            </option>
                                            <option value="2">
                                                Đã Hủy
                                            </option>
                                            <option value="3">
                                                Đã Xử Lý
                                            </option>
                                            <option value="4">
                                                Đã Nhận
                                            </option>
                                        </select>
                                    </div>

                                    <div class="col-md-3">
                                        <button type="submit" class="btn btn-warning">
                                            Lọc
                                        </button>
                                    </div>
                                </div>
                            </form:form>
                            <br>
                            <!-- Show -->
                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Mã</th>
                                        <th>Tên Tài Khoản</th>
                                        <th>Ngày Đặt Hàng</th>
                                        <th>Ngày Nhận Hàng</th>
                                        <th>Số Tiền</th>
                                        <th>Người Nhận</th>
                                        <th>Địa Chỉ</th>
                                        <th>Số Điện Thoại</th>
                                        <th>Mô Tả</th>
                                        <th>Trạng Thái</th>
                                        <th>Chức Năng</th>
                                    </tr>
                                    </thead>

                                    <tbody>
                                    <br>
                                    <div class="pull-left">
                                        <span style="color: red">${message}</span>
                                    </div>
                                    <c:forEach items="${orderList}" var="order" varStatus="IterStat">
                                        <tr>
                                            <td>${IterStat.count }</td>
                                            <td>${order.id }</td>
                                            <td>${order.customer.id }</td>
                                            <td><fmt:formatDate value="${order.orderDate }" pattern="dd/MM/yyy" /></td>
                                            <td><fmt:formatDate value="${order.requireDate }" pattern="dd/MM/yyy" /></td>
                                            <td><fmt:formatNumber value="${order.amount }" pattern="###,###" /> VNĐ</td>
                                            <td>${order.receiver }</td>
                                            <td>${order.address }</td>
                                            <td>${order.numberPhone }</td>
                                            <td>${order.description }</td>
                                            <td><c:choose>
                                                <c:when test="${order.status == 1 }">
                                                    <span class="btn btn-warning btn-sm">
                                                        Đang Chờ
                                                    </span>
                                                </c:when>
                                                <c:when test="${order.status == 2}">
                                                    <span class="btn btn-danger btn-sm">
                                                        Đã Hủy
                                                    </span>
                                                </c:when>
                                                <c:when test="${order.status == 3}">
                                                    <span class="btn btn-success btn-sm">
                                                        Đã Xử Lý
                                                    </span>
                                                </c:when>
                                                <c:when test="${order.status == 4}">
                                                    <span class="btn btn-success btn-sm">
                                                        Đã Nhận
                                                    </span>
                                                </c:when>
                                            </c:choose></td>
                                            <td><c:choose>
                                                <c:when test="${order.status == 1 }">
                                                    <a href="Shopping.com/employee/order/handling-order/${order.id }.htm" class="btn btn-primary btn-simple btn-sm"
                                                       onclick="return confirm ('Bạn đồng ý xử lý đơn hàng ?')">
                                                        <i class="fa fa-save"></i>
                                                        Xử Lý Đơn Hàng
                                                    </a>
                                                    <br>
                                                    <a href="Shopping.com/employee/order/edit-order/${order.id }.htm" class="btn btn-success btn-simple btn-sm">
                                                        <i class="fa fa-edit"></i>
                                                        Sửa</a>
                                                    <br>
                                                    <a href="Shopping.com/employee/order/detail-order/${order.id }.htm" class="btn btn-danger btn-simple btn-sm"> <i
                                                            class="fa fa-edit"></i>
                                                        Xem Chi Tiết</a>
                                                    <br>
                                                    <a href="Shopping.com/employee/order/cancel-order/${order.id }.htm" class="btn btn-warning btn-simple btn-sm"
                                                       onclick="return confirm ('Bạn đồng ý hủy đơn hàng ?')">
                                                        <i class="fa fa-save"></i>
                                                        Hủy Đơn Hàng
                                                    </a>

                                                </c:when>
                                                <c:when test="${order.status == 3 }">
                                                    <a href="Shopping.com/employee/order/confirm-order/${order.id }.htm" class="btn btn-primary btn-simple btn-sm"
                                                       onclick="return confirm ('Bạn chắc chắn rằng đơn hàng đã được gửi thành công ?')">
                                                        <i class="fa fa-edit"></i>
                                                        Xác Nhận
                                                    </a>
                                                    <br>
                                                    <a href="Shopping.com/employee/order/detail-order/${order.id }.htm"
                                                       class="btn btn-danger btn-simple btn-sm">
                                                        <i class="fa fa-edit"></i>
                                                        Xem Chi Tiết
                                                    </a>
                                                </c:when>
                                                <c:otherwise>
                                                    <a href="Shopping.com/employee/order/detail-order/${order.id }.htm"
                                                       class="btn btn-warning btn-simple btn-sm">
                                                        <i class="fa fa-edit"></i>
                                                        Chi Tiết Đơn Hàng</a>
                                                </c:otherwise>
                                            </c:choose></td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
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
    </div>
</div>
</body>
</html>