<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 10/24/2020
  Time: 2:00 PM
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
    <title>Product Manager</title>
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
                        Quản Lý Sản Phẩm
                    </h3>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="Shopping.com/employee/home">Trang Chủ</a>
                        </li>
                        <li class="breadcrumb-item active">
                            Danh sách sản phẩm
                        </li>
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
                                Danh Sách Sản Phẩm
                            </h4>
                            <h6 class="card-subtitle">
                               Ở đây bạn có thể thực hiện các chức năng !
                            </h6>
                            <!-- Tìm Kiếm -->
                            <form:form action="Shopping.com/employee/product/filter.htm" method="POST">
                                <div class="row">
                                    <div class="col-md-3">
                                        <input type="text" name="key" placeholder="Tìm kiếm tên"
                                               class="form-control form-control-line" />
                                    </div>
                                    <div class="col-md-2">
                                        <select name="DM" class="form-control form-control-line">
                                            <option selected="selected" value="">Category</option>
                                            <c:forEach var="category" items="${category}">
                                                <option value="${category.id}">${category.nameCategory}</option>
                                            </c:forEach>
                                        </select>
                                    </div>

                                    <div class="col-md-2">
                                        <select name="HSX" class="form-control form-control-line">
                                            <option selected="selected" value="">Producer</option>
                                            <c:forEach var="producer" items="${producer}">
                                                <option value="${producer.id }">${producer.nameProducer}</option>
                                            </c:forEach>
                                        </select>
                                    </div>

                                    <div class="col-md-3">
                                        <button type="submit" class="btn btn-danger">
                                          Tìm kiếm
                                        </button>
                                    </div>
                                    <div>
                                        <a type="submit" href="Shopping.com/employee/product/add-product.htm"
                                           class="btn waves-effect waves-light btn-primary pull-right hidden-sm-down">
                                            Thêm sản phẩm
                                        </a>
                                    </div>
                                </div>
                            </form:form>
                            <br>
                            <form:form action="Shopping.com/employee/product/filterStatus.htm"
                                       method="GET">
                                <div class="row">
                                    <div class="col-md-2">
                                        <select name="key" class="form-control border-input">
                                            <option selected="selected" value="">
                                                --Trạng Thái--
                                            </option>
                                            <option value="0">Đang Chờ</option>
                                            <option value="1">Đã Duyệt</option>
                                        </select>
                                    </div>
                                    <div class="col-md-3">
                                        <button type="submit" class="btn btn-warning">
                                           Lọc
                                        </button>
                                    </div>
                                </div>
                            </form:form>
                            <!-- Show -->
                            <div class="pull-right">
                                <h3>
                                    <small class="pull-right">  ${totalElements} products are available </small>
                                </h3>
                            </div>
                            <br>
                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Mã</th>
                                        <th>Tên Sản Phẩm</th>
                                        <th>Hãng Sản Xuất</th>
                                        <th>Danh Mục</th>
                                        <th>Hình Ảnh</th>
                                        <th>Số Lượng</th>
                                        <th>Ngày Sản Xuất</th>
                                        <th>Đơn Giá</th>
                                        <th>Giảm giá</th>
                                        <th>Trạng thái</th>
                                        <th>Chức năng</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${productList }" var="product">
                                        <tr>
                                            <c:set var="count" value="${count+1 }" />
                                            <td>${count }</td>
                                            <td>${product.id }</td>
                                            <td width="200px"><a href="Shopping.com/employee/product/detail/${product.id }.htm">${product.nameProduct }</a></td>
                                            <td>${product.category.nameCategory }</td>
                                            <td>${product.producer.nameProducer }</td>
                                            <td><a href="project/products/${product.photo}">
                                                <img src="project/products/${product.photo}" height="100px" width="120px" style="border-radius: 20px">
                                                 </a>
                                            </td>
                                            <td>${product.quantity }</td>
                                            <td><fmt:formatDate value="${product.productDate}" pattern="dd/MM/yyy" /></td>
                                            <td><fmt:formatNumber value="${product.unitPrice}" pattern="000,000" /> VNĐ</td>
                                            <td><c:choose>
                                                <c:when test="${product.discount == null}">
                                                    0%
                                                </c:when>
                                                <c:when test="${product.discount == 0}">
                                                    0%
                                                </c:when>
                                                <c:otherwise>
                                                    <fmt:formatNumber value="${product.discount }" type="percent" />
                                                </c:otherwise>
                                            </c:choose></td>
                                            <td><c:choose>
                                                <c:when test="${product.status == false }">
																<span class="btn btn-warning btn-sm">Đang Chờ</span>
                                                </c:when>
                                                <c:when test="${product.status == true}">
																<span class="btn btn-primary btn-sm">Đã Duyệt</span>
                                                </c:when>
                                            </c:choose></td>
                                            <td>
                                                <a href="Shopping.com/employee/product/edit-product/${product.id }.htm"
                                                    class="btn btn-info btn-simple btn-sm">
                                                    <i class="fa fa-edit"></i> Sửa</a>
                                                <br> <a href="Shopping.com/employee/product/detail/${product.id }.htm" class="btn btn-success btn-simple btn-sm">
                                                <i class="fa fa-video-camera"></i> Xem Chi Tiết
                                                </a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <div class="pagination">
                                <!--Pagination  -->
                                <c:if test="${productList.size() > 0 }">
                                    <div class="panel-footer">
                                        Showing ${number} of ${size} of ${totalElements}
                                        <ul class="pagination">
                                            <c:forEach begin="0" end="${totalPages-1}" var="page">
                                                <li class="page-item">
                                                    <a href="${pageContext.response.getHeader("list")}?page=${page}&size=${size}" class="page-link">${page+1}</a>
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
            <!-- End PAge Content -->
        </div>
        <!-- End Container fluid  -->
        <!-- footer -->
        <jsp:include page="footer.jsp"/>
    </div>
</div>
</body>
</html>