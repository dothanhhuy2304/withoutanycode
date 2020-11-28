<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 10/31/2020
  Time: 10:58 AM
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
    <style type="text/css">
        #a{
            background-color: #80bfff;
            color: white;
        }
        #b{
            background-color: #66b3ff;
            color: white;
        }
        #c{
            background-color: #4da6ff;
            color: white;
        }
        #d{
            background-color: #3399ff;
            color: white;
        }
        #a:hover,#b:hover,#c:hover,#d:hover{
            background-color: red;
        }
    </style>
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
                            <li class="breadcrumb-item">
                                <a href="Shopping.com/admin/home">Trang chủ</a></li>
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
                            <span class="span9">
                                <!--Dropdown-->
                                    <div class="dropdown">
                                        <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            Lọc Đơn Hàng Theo
                                        </button>
                                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                            <a class="dropdown-item" id="a" href="Shopping.com/admin/orderDetail/excel-orderDetail">Xuất Tất Cả Đơn Hàng</a>
                                            <a class="dropdown-item" id="b" href="Shopping.com/admin/orderDetail/excel-orderDetail-byDay">Đơn Hàng Theo Ngày</a>
                                            <a class="dropdown-item" id="c" href="Shopping.com/admin/orderDetail/excel-orderDetail-byMonth">Đơn Hàng Theo Tháng</a>
                                            <a class="dropdown-item" id="d" href="Shopping.com/admin/orderDetail/excel-orderDetail-byYear">Đơn Hàng Theo Năm</a>
                                        </div>
                                    </div>
                                </span>
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
                                <div class="pull-right">
                                    <small>${totalElements} order are available</small>
                                </div>
                                <table class="table table-striped">
                                    <thead>
                                    <tr>
                                        <td>#</td>
                                        <td>Mã Đơn Hàng</td>
                                        <td>Tên Khách Hàng</td>
                                        <td>Tên Sản Phẩm</td>
                                        <td>Ngày Đặt Hàng</td>
                                        <td>Ngày Nhận Hàng</td>
                                        <td>Đơn Giá</td>
                                        <td>Số Lượng</td>
                                        <td>Giảm Giá</td>
                                        <td>Số Tiền</td>
                                        <td>Địa Chỉ</td>
                                        <td>Người Nhận</td>
                                        <td>Trạng Thái</td>
                                        <td>Chức Năng</td>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${orderDetailList}" var="orderDetail" varStatus="iterStat">
                                        <tr>
                                            <td>${iterStat.count }</td>
                                            <td>${orderDetail.order.id }</td>
                                            <td>${orderDetail.order.customer.fullName}</td>
                                            <td>${orderDetail.product.nameProduct }</td>
                                            <td><f:formatDate value="${orderDetail.order.orderDate }" pattern="dd/MM/yyyy" /></td>
                                            <td><f:formatDate value="${orderDetail.order.requireDate }" pattern="dd/MM/yyyy" /></td>
                                            <td><f:formatNumber type="currency" value="${orderDetail.product.unitPrice }" pattern="###,###,###" /> VNĐ</td>
                                            <td>${orderDetail.quantity }</td>
                                            <td><f:formatNumber value="${orderDetail.discount }" type="percent" /></td>
                                            <td><f:formatNumber type="currency" value="${orderDetail.amount }" pattern="###,###,###" />
                                                VNĐ</td>
                                            <td>${orderDetail.order.address }</td>
                                            <td>${orderDetail.order.receiver }</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${orderDetail.order.status == 1}">
                                                        <button type="button" class="btn btn-warning">Mới Đăt Hàng</button>
                                                    </c:when>
                                                    <c:when test="${orderDetail.order.status == 2}">
                                                        <button type="button" class="btn btn-danger">Đã Hủy</button>
                                                    </c:when>
                                                    <c:when test="${orderDetail.order.status == 3}">
                                                        <button type="button" class="btn btn-primary">Đã Xác Nhận</button>
                                                    </c:when>
                                                    <c:when test="${orderDetail.order.status == 4}">
                                                        <button type="button" class="btn btn-primary">Đã Giao Hàng</button>
                                                    </c:when>
                                                </c:choose>
                                            </td>
                                            <td>
                                                <a href="Shopping.com/admin/orderDetail/delete-orderDetail/${orderDetail.id}.htm" onclick="return confirm('Bạn chắc chắn chứ ?')"
                                                    type="button" class="btn btn-success btn-fill btn-sm">Xóa</a>
                                                <c:choose>
                                                    <c:when test="${orderDetail.order.status==1}">
                                                        <a href="Shopping.com/admin/orderDetail/handling-order/${orderDetail.order.id}.htm"
                                                           onclick="return confirm('Bạn có chắc chắn muốn xác nhận đơn hàng ?')" class="btn btn-primary btn-file btn-sm">
                                                            Xử Lý Đơn Hàng
                                                        </a>
                                                    </c:when>
                                                    <c:when test="${orderDetail.order.status==3}">
                                                        <a href="Shopping.com/admin/orderDetail/confirm-order/${orderDetail.order.id}.htm" class="btn btn-success btn-facebook btn-sm"
                                                        onclick="return confirm('Bạn có chắc chắn đơn đã được giao ?')">
                                                            Xác Nhận
                                                        </a>
                                                    </c:when>
                                                    <c:when test="${orderDetail.order.status == 2}">
                                                        <br>
                                                        <button type="button" class="btn btn-danger btn-fill btn-sm">
                                                            Đã Hủy
                                                        </button>
                                                    </c:when>
                                                    <c:when test="${orderDetail.order.status == 4}">
                                                        <button type="button" class="btn btn-success btn-fill btn-sm">
                                                            Đã Giao Hàng
                                                        </button>
                                                    </c:when>
                                                </c:choose>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>

                                <!-- Phân Trang -->
                                <div class="pagination">
                                    <!--Pagination  -->
                                    <c:if test="${orderDetailList.size() > 0 }">
                                        <div class="panel-footer">
                                            Showing ${number} of ${size} of ${totalElements}
                                            <ul class="pagination">
                                                <c:forEach begin="0" end="${totalPages-1}" var="page">
                                                    <li class="page-item">
                                                        <a href="${pageContext.response.getHeader("list")}?page=${page}&size=${size}"
                                                           class="page-link" id="page-link">${page+1}</a>
                                                    </li>
                                                </c:forEach>
                                            </ul>
                                        </div>
                                    </c:if>
                                </div>
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