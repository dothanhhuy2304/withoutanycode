<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 11/9/2020
  Time: 2:05 PM
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
    <title>Department Manager</title>
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
                        Quản Lý Phòng Ban
                    </h3>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="Shopping.com/admin/home">
                            Trang Chủ
                        </a></li>
                        <li class="breadcrumb-item active">
                            Danh Sách Phòng Ban
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
                            <h4 class="card-title">Danh Sách Phòng Ban</h4>
                            <h6 class="card-subtitle">Ở đây bạn có thể thực hiện các chức năng !</h6>
                            <!-- Search -->
                            <form action="Shopping.com/admin/department/filter.htm" method="POST">
                                <div class="row">
                                    <div class="col-md-3">
                                        <input type="text" name="key" placeholder="Tìm kiếm tên"
                                               class="form-control form-control-line" />
                                    </div>
                                    <div class="col-md-7">
                                        <button type="submit" class="btn btn-danger">Tìm Kiếm</button>
                                    </div>
                                    <div>
                                        <a type="submit" href="Shopping.com/admin/department/add-department.htm"
                                           class="btn waves-effect waves-light btn-primary pull-right hidden-sm-down">
                                            Thêm Phòng Ban</a>
                                    </div>
                                </div>
                            </form>
                            <br>
                            <!-- Show -->
                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <thead>
                                    <tr>
                                        <th scope="row">#</th>
                                        <th scope="row">Mã Phòng Ban</th>
                                        <th scope="row">Kí Hiệu</th>
                                        <th scope="row">Tên phòng ban</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${departmentList}" var="department"  varStatus="iterStat">
                                        <tr>
                                            <td>${iterStat.count}</td>
                                            <td>${department.id}</td>
                                            <td>${department.code}</td>
                                            <td>${department.nameDepartment }</td>
                                            <td width="180px"><a href="Shopping.com/admin/department/edit-department/${department.id}.htm" class="btn btn-info btn-simple btn-sm"> <i
                                                    class="fa fa-edit"></i> Sửa</a>
                                                <a readonly="true" class="btn btn-warning btn-simple btn-sm">
                                                    <i class="fa fa-times"></i> Xóa </a></td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                                <!-- Phân Trang -->
                                <div class="pagination">
                                    <!--Pagination  -->
                                    <form class="pager"
                                    <c:if test="${departmentList.size() > 0 }">
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
</body>
</html>