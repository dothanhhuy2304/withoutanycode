<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 11/1/2020
  Time: 11:19 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <base href="${pageContext.servletContext.contextPath }/">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>OrderDetail Manager</title>
</head>
<body>
<div class="main-wrapper">
    <jsp:include page="header.jsp"/>
    <jsp:include page="menu.jsp"/>
    <div class="page-wrapper">
        <div class="content">
            <div class="container-fluid">
                <div class="row page-titles">
                    <div class="col-md-5 col-8 align-self-center">
                        <h3 class="text-themecolor m-b-0 m-t-0">
                            Danh Sách Đơn Hàng
                        </h3>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="Shopping.com/admin/home">Trang chủ</a></li>
                            <li class="breadcrumb-item active">Thông Tin Đơn Hàng</li>
                        </ol>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-block">
                                <h4 class="title">
                                    Thông Tin Đơn Hàng
                                </h4>
                                <p class="category">
                                    Ở đây bạn có thể thực hiện các chức năng
                                </p>
                            </div>
                            <div style="clear: both; width: 98%; margin: 10px auto;">
                                <!-- Tìm Kiếm -->
                                <form action="Shopping.com/admin/orderDetail/search.htm" method="get">
                                    <div class="row">
                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <input type="text" name="key" placeholder="Tìm kiếm..."
                                                       class="form-control border-input" />
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <button type="submit" class="btn btn-danger btn-fill">Tìm Kiếm</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="content table-responsive table-full-width">
                                <table class="table table-striped">
                                    <thead>
                                    <tr>
                                        <td scope="row">#</td>
                                        <td scope="row">Mã Đơn Hàng</td>
                                        <td scope="row">Tên Khách Hàng</td>
                                        <td scope="row">Tên Sản Phẩm</td>
                                        <td scope="row">Ngày Đặt Hàng</td>
                                        <td scope="row">Ngày Nhận Hàng</td>
                                        <td scope="row">Đơn Giá</td>
                                        <td scope="row">Số Lượng</td>
                                        <td scope="row">Giảm Giá</td>
                                        <td scope="row">Số Tiền</td>
                                        <td scope="row">Địa Chỉ</td>
                                        <td scope="row">Người Nhận</td>
                                        <td scope="row">Chức Năng</td>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${orderDetailList}" var="orderDetail" varStatus="iterStat">
                                        <tr>
                                            <td scope="row">${iterStat.count }</td>
                                            <td scope="row">${orderDetail.order.id }</td>
                                            <td scope="row">${orderDetail.order.customer.fullName}</td>
                                            <td scope="row">${orderDetail.product.nameProduct }</td>
                                            <td scope="row"><f:formatDate value="${orderDetail.order.orderDate }" pattern="dd/MM/yyyy" /></td>
                                            <td scope="row"><f:formatDate value="${orderDetail.order.requireDate }" pattern="dd/MM/yyyy" /></td>
                                            <td scope="row"><f:formatNumber type="currency" value="${orderDetail.product.unitPrice }" pattern="###,###,###" /> VNĐ</td>
                                            <td scope="row">${orderDetail.quantity }</td>
                                            <td scope="row"><f:formatNumber value="${orderDetail.discount }" type="percent" /></td>
                                            <td scope="row"><f:formatNumber type="currency" value="${orderDetail.amount }" pattern="###,###,###" />VNĐ</td>
                                            <td scope="row">${orderDetail.order.address }</td>
                                            <td scope="row">${orderDetail.order.receiver }</td>
                                            <td scope="row">
                                                <a href="Shopping.com/admin/orderDetail/delete-orderDetail/${orderDetail.id}.htm" onclick="return confirm('Bạn chắc chắn chứ ?')"
                                                   type="button" class="btn btn-success btn-fill btn-sm">
                                                    Xóa </a></td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp"/>
    </div>
</div>
</body>
</html>