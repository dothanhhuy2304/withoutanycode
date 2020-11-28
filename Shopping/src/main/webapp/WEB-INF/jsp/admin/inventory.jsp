<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 10/31/2020
  Time: 7:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <base href="${pageContext.servletContext.contextPath }/">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Inventory Manager</title>
    <style>
        .producer{
            margin-top: -15em;
        }
        .total{
            margin-top: -11em;
        }
        #page-link{
            margin-top: -1.5em;
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
                        Kiểm Kê Hàng Hóa
                    </h3>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="Shopping.com/admin/home">Trang chủ</a></li>
                        <li class="breadcrumb-item active">Thông Tin Hàng Tồn Kho</li>
                    </ol>
                </div>
            </div>
            <!--Show-->
            <div class="row">
                <!-- column -->
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-block">
                            <h3>
                                <small class="pull-right">  ${totalElements} products are available </small>
                            </h3>
                            <h5>Kiểm Kê Hàng Tồn Kho Theo Danh Mục</h5>
                            <br>
                            <!-- Show -->
                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Danh Mục</th>
                                        <th>Số Lượng</th>
                                        <th>Tổng Số Tiền</th>
                                        <th>Giá Thấp Nhất</th>
                                        <th>Giá Cao Nhất</th>
                                        <th>Giá Trung Bình</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${totalProduct}" var="product" varStatus="iterStat">
                                        <tr>
                                            <td>${iterStat.count}</td>
                                            <td>${product[0]}</td>
                                            <td>${product[1]}</td>
                                            <td><fmt:formatNumber value="${product[2]}" type="number"/> VNĐ</td>
                                            <td><fmt:formatNumber value="${product[3]}" type="number"/> VNĐ</td>
                                            <td><fmt:formatNumber value="${product[4]}" type="number"/> VNĐ</td>
                                            <td><fmt:formatNumber value="${product[5]}" type="number"/> VNĐ</td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                                <!-- Phân Trang -->
                                <div class="pagination">
                                    <!--Pagination  -->
                                    <form class="pager"
                                    <c:if test="${totalProduct.size() > 0 }">
                                        <div class="panel-footer">
                                            Showing ${number} of ${size} of ${totalElements}
                                            <ul class="pagination">
                                                <c:forEach begin="0" end="${totalPages-1}" var="page">
                                                    <li class="page-item">
                                                        <a href="${pageContext.response.getHeader("listProduct")}?page=${page}&size=${size}"
                                                           class="page-link">${page+1}</a>
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
        <!--producer-->
        <div class="producer">
            <div id="main-wrapper">
                <div class="page-wrapper">
                    <div class="container-fluid">
                        <!-- Bread crumb and right sidebar toggle -->
                        <!--Show-->
                        <div class="row">
                            <!-- column -->
                            <div class="col-lg-12">
                                <div class="card">
                                    <div class="card-block">
                                        <h3>
                                            <small class="pull-right">  ${totalElements} products are available </small>
                                        </h3>
                                        <h5>Kiểm Kê Hàng Tồn Kho Theo Hãng Sản Xuất</h5>
                                        <br>
                                        <!-- Show -->
                                        <div class="table-responsive">
                                            <table class="table table-striped">
                                                <thead>
                                                <tr>
                                                    <th>#</th>
                                                    <th>Nhà Cung Cấp</th>
                                                    <th>Số Lượng</th>
                                                    <th>Tổng Số Tiền</th>
                                                    <th>Giá Nhỏ Nhất</th>
                                                    <th>Giá Cao Nhất</th>
                                                    <th>Giá Trung Bình</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach items="${totalProducer}" var="producer" varStatus="iterStat">
                                                    <tr>
                                                        <td>${iterStat.count}</td>
                                                        <td>${producer[0]}</td>
                                                        <td>${producer[1]}</td>
                                                        <td><fmt:formatNumber value="${producer[2]}" type="number"/> VNĐ</td>
                                                        <td><fmt:formatNumber value="${producer[3]}" type="number"/> VNĐ </td>
                                                        <td><fmt:formatNumber value="${producer[4]}" type="number"/> VNĐ</td>
                                                        <td><fmt:formatNumber value="${producer[5]}" type="number"/> VNĐ</td>
                                                    </tr>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                            <!-- Phân Trang -->
                                            <div class="pagination">
                                                <!--Pagination  -->
                                                <form class="pager"
                                                <c:if test="${totalProducer.size() > 0 }">
                                                    <div class="panel-footer">
                                                        Showing ${number} of ${size} of ${totalElements}
                                                        <ul class="pagination">
                                                            <c:forEach begin="0" end="${totalPages-1}" var="page">
                                                                <li class="page-item">
                                                                    <a href="${pageContext.response.getHeader("listProducer")}?page=${page}&size=${size}"
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
                </div>
            </div>
        </div>
        <!--Total2-->
        <div class="total">
            <div id="main-wrapper">
                <div class="page-wrapper">
                    <div class="container-fluid">
                        <!-- Bread crumb and right sidebar toggle -->
                        <!--Show-->
                        <div class="row">
                            <!-- column -->
                            <div class="col-lg-12">
                                <div class="card">
                                    <div class="card-block">
                                        <h3>
                                            <small class="pull-right">  ${totalElements} products are available </small>
                                        </h3>
                                        <h5>Kiểm Kê Hàng Tồn Kho Theo Danh Mục Và Hãng Sản Xuất</h5>
                                        <br>
                                        <!-- Show -->
                                        <div class="table-responsive">
                                            <table class="table table-striped">
                                                <thead>
                                                <tr>
                                                    <th>#</th>
                                                    <th>Nhà Cung Cấp</th>
                                                    <th>Danh Mục</th>
                                                    <th>Số Lượng</th>
                                                    <th>Tổng Số Tiền</th>
                                                    <th>Giá Nhỏ Nhất</th>
                                                    <th>Giá Cao Nhất</th>
                                                    <th>Giá Trung Bình</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach items="${total2}" var="arrays" varStatus="iterStat">
                                                    <tr>
                                                        <td>${iterStat.count}</td>
                                                        <td>${arrays[0]}</td>
                                                        <td>${arrays[1]}</td>
                                                        <td><fmt:formatNumber value="${arrays[2]}" type="number"/> </td>
                                                        <td><fmt:formatNumber value="${arrays[3]}" type="number"/> VNĐ</td>
                                                        <td><fmt:formatNumber value="${arrays[4]}" type="number"/> VNĐ</td>
                                                        <td><fmt:formatNumber value="${arrays[5]}" type="number"/> VNĐ</td>
                                                        <td><fmt:formatNumber value="${arrays[6]}" type="number"/> VNĐ</td>
                                                    </tr>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                            <!-- Phân Trang -->
                                            <div class="pagination">
                                                <!--Pagination  -->
                                                <form class="pager"
                                                <c:if test="${total2.size() > 0 }">
                                                    <div class="panel-footer">
                                                        Showing ${number} of ${size} of ${totalElements}
                                                        <ul class="pagination">
                                                            <c:forEach begin="0" end="${totalPages-1}" var="page">
                                                                <li class="page-item">
                                                                    <a href="${pageContext.response.getHeader("listProducer")}?page=${page}&size=${size}"
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
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp"/>
    </div>
</body>
</html>
