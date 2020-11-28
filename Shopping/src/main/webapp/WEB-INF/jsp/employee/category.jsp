<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 10/22/2020
  Time: 9:07 PM
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
    <title>Category Manager</title>
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
                        Quản lý Thể Loại
                    </h3>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="Shopping.com/employee/home">
                            Trang Chủ
                        </a></li>
                        <li class="breadcrumb-item active">
                            Danh Sách Thể Loại
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
                            <h3>
                                <small class="pull-right">  ${totalElements} danh mục có sẵn </small>
                            </h3>
                            <h4 class="card-title">Danh Sách Danh Mục</h4>
                            <h6 class="card-subtitle">Ở đây bạn có thể thực hiện các chức năng !</h6>
                            <!-- Tìm Kiếm -->

                            <form action="Shopping.com/employee/category/search-category.htm" method="POST">
                                <div class="row">
                                    <div class="col-md-3">
                                        <input type="text" name="key" placeholder="Tìm kiếm tên"
                                               class="form-control form-control-line" />
                                    </div>

                                    <div class="col-md-7">
                                        <button type="submit" class="btn btn-danger">Tìm Kiếm</button>
                                    </div>
                                    <div>
                                        <a type="submit" href="Shopping.com/employee/category/add-category.htm"
                                           class="btn waves-effect waves-light btn-primary pull-right hidden-sm-down">
                                            Thêm Thể Loại</a>
                                    </div>
                                </div>
                            </form>
                            <br>
                            <!-- Show -->
                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Danh Mục Tiếng Việt</th>
                                        <th>Danh Mục Tiếng Anh</th>
                                        <th>Chức năng</th>
                                    </tr>
                                    </thead>

                                    <tbody>
                                    <c:forEach items="${categorys}" var="category"  varStatus="interStat">
                                        <tr>
<%--                                            <c:set var="count" value="${count+1 }" />--%>
                                            <td>${interStat.count}</td>
                                            <td>${category.nameCategory }</td>
                                            <td>${category.nameCategoryEN }</td>
                                            <td width="180px">
                                                <a href="Shopping.com/employee/category/edit-category/${category.id}.htm" class="btn btn-info btn-simple btn-sm">
                                                    <i class="fa fa-edit"></i>
                                                    Sửa</a>
                                                <a href="Shopping.com/employee/category/delete-category/${category.id}.htm" onclick="return confirm('Bạn chắc chắn chứ ?')"
                                                    class="btn btn-warning btn-simple btn-sm">
                                                    <i class="fa fa-times"></i> Xóa </a>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                                <!-- Phân Trang -->
                                <div class="pagination">
                                    <!--Pagination  -->
                                    <form class="pager"
                                    <c:if test="${categorys.size() > 0 }">
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
            </div>
            <!-- End PAge Content -->
        </div>
        <!-- End Container fluid  -->
        <!-- footer -->
        <jsp:include page="footer.jsp"/>
    </div>
</div>
<script src="project/themes/assets/js/jquery-3.1.1.min.js"></script>
</body>
</html>