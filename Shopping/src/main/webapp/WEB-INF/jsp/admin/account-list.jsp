<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 11/1/2020
  Time: 1:04 PM
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
    <meta name="viewport" content="width=device-width" />
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>Inventory Manager</title>
    <style>
        .producer{
            margin-top: -12em;
        }
        .total{
            margin-top: -15em;
        }
        #page-link{
            margin-top: -1.5em;
        }
        #img{
            width: 6em !important;
            height: 5em !important;
            border-radius: 50%;
            -moz-border-radius: 50%;
            -webkit-border-radius: 50%;
        }
    </style>
</head>
<body>
<div id="main-wrapper">
    <jsp:include page="header.jsp"/>
    <jsp:include page="menu.jsp"/>
    <div class="container-fluid">
    <div class="page-wrapper">
        <!-- Container fluid  -->
        <div class="container-fluid">
            <!-- Bread crumb and right sidebar toggle -->
            <div class="row page-titles">
                <div class="col-md-5 col-8 align-self-center">
                    <h3 class="text-themecolor m-b-0 m-t-0">
                        Quản Lý Tài Khoản
                    </h3>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="Shopping.com/admin/home">Trang chủ</a></li>
                        <li class="breadcrumb-item active">Quản Lý Tài Khoản</li>
                        <li class="breadcrumb-item active"><a href="Shopping.com/admin/register">Thêm Tài Khoản</a> </li>
                    </ol>
                </div>
            </div>
            <!--Show-->
            <div class="row">
                <!-- column -->
                <div class="col-lg-12">
                    <div class="card">
                        <br>
                        ${message}
                        <br>
                        <div class="card-block">
                            <h4 class="card-title">Danh Sách Admin</h4>
                            <h6 class="card-subtitle">Ở đây bạn có thể thực hiện các chức năng !</h6>
                            <!-- Search -->
                            <form action="Shopping.com/admin/account/search-by-admin.htm" method="POST">
                                <div class="row">
                                    <div class="col-md-3">
                                        <input type="text" name="key" placeholder="Tìm kiếm tên"
                                               class="form-control form-control-line" />
                                    </div>
                                    <div class="col-md-7">
                                        <button type="submit" class="btn btn-danger">Tìm Kiếm</button>
                                    </div>
                                </div>
                            </form>
                            <br>
                            <h3>
                                <small class="pull-right">  ${totalElements} admins are available </small>
                            </h3>
                            <h5>Danh Sách Tài Khoản Admin</h5>
                            <br>
                            <!-- Show -->
                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <thead>
                                    <tr>
                                        <th scope="row">#</th>
                                        <th scope="row">Tên Admin</th>
                                        <th scope="row">Tên Tài Khoản</th>
                                        <th scope="row">Quyền Truy Cập</th>
                                        <th scope="row">Action</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${adminList}" var="admins" varStatus="iterStat">
                                        <tr>
                                            <td>${iterStat.count}</td>
                                            <td>${admins.fullName}</td>
                                            <td>${admins.username}</td>
                                            <td>
                                            <c:choose>
                                                <c:when test="${admins.access >=1}">
                                                    Quản Trị Viên
                                                </c:when>
                                               <c:when test="${admins.access ==0}">
                                                   Tài Khoản Chưa Được Kích Hoạt
                                               </c:when>
                                                <c:when test="${admins.access == -1}">
                                                    Tài Khoản Đã Bị Khóa
                                                </c:when>
                                            </c:choose>
                                            </td>
                                            <td>
                                                <c:choose>
                                                <c:when test="${admins.access <= -1}">
                                                    <a href="Shopping.com/admin/account/restoreAdmin/${admins.username}.htm">
                                                        <i class="fa fa-toggle-off fa-2x"></i>
                                                    </a>
                                                </c:when>
                                                <c:when test="${admins.access >=1}">
                                                    <a href="Shopping.com/admin/account/blockAdmin/${admins.username}.htm">
                                                        <i class="fa fa-toggle-on fa-2x"></i>
                                                    </a>
                                                </c:when>
                                                    <c:when test="${admins.access ==0}">
                                                        <a href="Shopping.com/admin/account/restoreAdmin/${admins.username}.htm">
                                                            <i class="fa fa-toggle-off fa-2x"></i>
                                                        </a>
                                                    </c:when>
                                                </c:choose>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                                <!-- Phân Trang -->
                                <div class="pagination">
<%--                                    <!--Pagination  -->--%>
                                    <c:if test="${adminList.size() > 0 }">
                                        <div class="panel-footer">
                                            Showing ${number} of ${size} of ${totalElements}
                                            <ul class="pagination">
                                                <c:forEach begin="0" end="${totalPages-1}" var="page">
                                                    <li class="page-item">
                                                        <a href="${pageContext.response.getHeader("admins")}?page=${page}&size=${size}"
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
    </div>
    </div>
    <div class="container-fluid">
        <!--Customer-->
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
                                        <h4 class="card-title">Danh Sách Nhân Viên</h4>
                                        <h6 class="card-subtitle">Ở đây bạn có thể thực hiện các chức năng !</h6>
                                        <!-- Search -->
                                        <form action="Shopping.com/admin/account/search-by-employee.htm" method="POST">
                                            <div class="row">
                                                <div class="col-md-3">
                                                    <input type="text" name="key" placeholder="Tìm kiếm tên"
                                                           class="form-control form-control-line" />
                                                </div>
                                                <div class="col-md-7">
                                                    <button type="submit" class="btn btn-danger">Tìm Kiếm</button>
                                                </div>
                                            </div>
                                        </form>
                                        <br>

                                        <h3>
                                            <small class="pull-right">  ${totalElements1} employees are available </small>
                                        </h3>
                                        <h5>Danh Sách Tài Khoản Nhân Viên</h5>
                                        <br>
                                        <!-- Show -->
                                        <div class="table-responsive">
                                            <table class="table table-striped">
                                                <thead>
                                                <tr>
                                                    <th scope="row">#</th>
                                                    <th scope="row">Tên Nhân Viên</th>
                                                    <th scope="row">Tên Tài Khoản</th>
                                                    <th scope="row">Đia Chỉ Email</th>
                                                    <th scope="row">Ngày Sinh</th>
                                                    <th scope="row">Điện Thoại</th>
                                                    <th scope="row">Địa Chỉ</th>
                                                    <th scope="row">Hình Ảnh</th>
                                                    <th scope="row">Phòng Ban</th>
                                                    <th scope="row">Loại Nhân Viên</th>
                                                    <th scope="row">Giới Tính</th>
                                                    <th scope="row">Truy Cập</th>
                                                    <th scope="row">Trạng Thái</th>
                                                    <th scope="row">Action</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach items="${employeeList}" var="employees" varStatus="iterStat">
                                                    <tr>
                                                        <td>${iterStat.count}</td>
                                                        <td>${employees.nameEmployee}</td>
                                                        <td>${employees.id}</td>
                                                        <td>${employees.email}</td>
                                                        <td><fmt:formatDate value="${employees.birthday}" pattern="dd/MM/yyy"/> </td>
                                                        <td>${employees.numberPhone}</td>
                                                        <td>${employees.address}</td>
                                                        <td><img src="project/employees/${employees.photo}" alt="Employee" id="img"></td>
                                                        <td>${employees.department.nameDepartment}</td>
                                                        <td>${employees.employeeType.nameEmployeeType}</td>
                                                        <td>
                                                        <c:choose>
                                                            <c:when test="${employees.gender <=1}">
                                                                Nam
                                                            </c:when>
                                                            <c:when test="${employees.gender >= 2}">
                                                                Nữ
                                                            </c:when>
                                                            <c:otherwise>
                                                                Khác
                                                            </c:otherwise>
                                                        </c:choose>
                                                        </td>
                                                        <td><c:choose>
                                                            <c:when test="${employees.access == -1}">
                                                                <span class="btn btn-danger">Đã Khóa</span>
                                                            </c:when>
                                                            <c:when test="${employees.access == 1}">
                                                                <span class="btn btn-primary">Nhân Viên</span>
                                                            </c:when>
                                                        </c:choose>
                                                        </td>
                                                        <td>
                                                            <c:choose>
                                                                <c:when test="${employees.activated == false}">
                                                                    <span class="btn btn-warning">Chưa Kích Hoạt</span>
                                                                </c:when>
                                                                <c:when test="${employees.activated == true}">
                                                                    <span class="btn btn-success"> Đã Kích Hoạt</span>
                                                                </c:when>
                                                            </c:choose>
                                                        </td>
                                                        <td>
                                                            <c:choose>
                                                            <c:when test="${employees.access <= -1}">
                                                                <a href="Shopping.com/admin/account/restoreEmployee/${employees.id}.htm">
<%--                                                                    <button type="submit" class="btn btn-primary">Restore</button>--%>
                                                                    <i class="fa fa-toggle-off fa-2x"></i>
                                                                </a>
                                                            </c:when>
                                                            <c:when test="${employees.access >=1}">
                                                                <a href="Shopping.com/admin/account/blockEmployee/${employees.id}.htm">
<%--                                                                    <button type="submit" class="btn btn-danger">Block</button>--%>
                                                                    <i class="fa fa-toggle-on fa-2x"></i>
                                                                </a>
                                                            </c:when>
                                                            </c:choose>

                                                            <c:choose>
                                                                <c:when test="${employees.activated == false}">
                                                                    <a href="Shopping.com/admin/account/active-account/${employees.id}.htm">
                                                                      <button class="btn btn-primary">Kích Hoạt</button>
                                                                    </a>
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
                                                <c:if test="${employeeList.size() > 0 }">
                                                    <div class="panel-footer">
                                                        Showing ${number1} of ${size1} of ${totalElements1}
                                                        <ul class="pagination">
                                                            <c:forEach begin="0" end="${totalPages1-1}" var="page">
                                                                <li class="page-item">
                                                                    <a href="${pageContext.response.getHeader("employees")}?page=${page}&size=${size1}"
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
    </div>
        <!--Total2-->
    <div class="container-fluid">
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
                                    <!---->
                                    <div class="card-block">
                                        <h4 class="card-title">Danh Sách Khách Hàng</h4>
                                        <h6 class="card-subtitle">Ở đây bạn có thể thực hiện các chức năng !</h6>
                                        <!-- Search -->
                                        <form action="Shopping.com/admin/account/search-by-customer.htm" method="POST">
                                            <div class="row">
                                                <div class="col-md-3">
                                                    <input type="text" name="key" placeholder="Tìm kiếm tên"
                                                           class="form-control form-control-line" />
                                                </div>
                                                <div class="col-md-7">
                                                    <button type="submit" class="btn btn-danger">Tìm Kiếm</button>
                                                </div>
                                            </div>
                                        </form>
                                        <br>
                                        <!---->
                                        <h3>
                                            <small class="pull-right">  ${totalElements2} customer are available </small>
                                        </h3>
                                        <h5>Danh Sách Tài Khoản Khách Hàng</h5>
                                        <br>
                                        <!-- Show -->
                                        <div class="table-responsive">
                                            <table class="table table-striped">
                                                <thead>
                                                <tr>
                                                    <th scope="row">#</th>
                                                    <th scope="row">Tên Khách Hàng</th>
                                                    <th scope="row">Tên Tài Khoản</th>
                                                    <th scope="row">Địa Chỉ Email</th>
                                                    <th scope="row">Địa Chỉ</th>
                                                    <th scope="row">Số Điện Thoại</th>
                                                    <th scope="row">Ngày Sinh</th>
                                                    <th scope="row">Hình Ảnh</th>
                                                    <th scope="row">Giới Tính</th>
                                                    <th scope="row">Truy Cập</th>
                                                    <th scope="row">Trạng Thái</th>
                                                    <th scope="row">Action</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach items="${customerList}" var="customers" varStatus="iterStat">
                                                    <tr>
                                                        <td>${iterStat.count}</td>
                                                        <td>${customers.fullName}</td>
                                                        <td>${customers.id}</td>
                                                        <td>${customers.email}</td>
                                                        <td>${customers.address}</td>
                                                        <td>${customers.numberPhone}</td>
                                                        <td><fmt:formatDate value="${customers.birthday}" pattern="dd/MM/yyyy"/> </td>
                                                        <td>
                                                            <img src="project/customers/${customers.photo}" alt="customer" id="img"></td>
                                                        <td>
                                                            <c:choose>
                                                                <c:when test="${customers.gender <= 1}">
                                                                    Nam
                                                                </c:when>
                                                                <c:when test="${customers.gender >= 2}">
                                                                    Nữ
                                                                </c:when>
                                                            </c:choose>
                                                        </td>
                                                        <td>
                                                            <c:choose>
                                                              <c:when test="${customers.access <= -1}">
                                                                  <span class="btn btn-danger"> Đã Khóa</span>
                                                              </c:when>
                                                                <c:when test="${customers.access >=1}">
                                                                    <span class="btn btn-primary"> Bình Thường</span>
                                                                </c:when>
                                                            </c:choose>
                                                        </td>
                                                        <td>
                                                            <c:choose>
                                                            <c:when test="${customers.activated == false}">
                                                                <span class="btn btn-warning"> Chưa Kích Hoạt</span>
                                                                </c:when>
                                                                <c:when test="${customers.activated == true}">
                                                                    <span class="btn btn-success"> Đã Kích Hoạt</span>
                                                                </c:when>
                                                            </c:choose>
                                                        </td>
                                                        <td><c:choose>
                                                            <c:when test="${customers.access <= -1}">
                                                                <a href="Shopping.com/admin/account/restoreCustomer/${customers.id}.htm">
<%--                                                                    <button type="submit" class="btn btn-primary">Restore</button>--%>
                                                                    <i class="fa fa-toggle-off fa-2x"></i>
                                                                </a>
                                                            </c:when>
                                                            <c:when test="${customers.access >= 1}">
                                                                <a href="Shopping.com/admin/account/blockCustomer/${customers.id}.htm">
<%--                                                                    <button type="submit" class="btn btn-danger">Block</button>--%>
                                                                    <i class="fa fa-toggle-on fa-2x" ></i>
                                                                </a>
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
                                                <c:if test="${customerList.size() > 0 }">
                                                    <div class="panel-footer">
                                                        Showing ${number2} of ${size2} of ${totalElements2}
                                                        <ul class="pagination">
                                                            <c:forEach begin="0" end="${totalPages2-1}" var="page">
                                                                <li class="page-item">
                                                                    <a href="${pageContext.response.getHeader("customers")}?page=${page}&size=${size2}"
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
    </div>
        <jsp:include page="footer.jsp"/>
    </div>
</body>
</html>
