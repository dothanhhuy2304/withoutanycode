<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 10/20/2020
  Time: 3:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <meta charset="utf-8">
    <base href="${pageContext.servletContext.contextPath }/">
    <title>Customer Manager</title>
    <style>
        #container-sm {
            margin-left: 15em;
        }
        thead th {
            color: royalblue;
            padding: initial;
            line-height: 1.678;
        }
        #image-customer {
            width: 8em !important;
            height: 7em !important;
            border-radius: 50%;
        }
        tbody td {
            font-size: 1.3ch;
            color: black;
        }
    </style>
</head>
<body>
<div class="mainBody">
    <jsp:include page="header.jsp"/>
    <jsp:include page="menu.jsp"/>
    <div class="container-fluid" id="container-sm">
        <div class="row page-titles">
            <div class="col-md-5 col-8 align-self-center">
                <h3 class="text-themecolor m-b-0 m-t-0">
                    Trang chủ
                </h3>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="Shopping.com/employee/home">
                        Trang chủ </a></li>
                    <li class="breadcrumb-item active">
                        Thông Tin Khách Hàng
                </ol>
            </div>
        </div>
            <h3>Thông Tin Khách Hàng</h3>
        <h3>
            <small class="pull-right">  ${totalElements} tài khoản có sẵn </small>
        </h3>
        <span class="pull-right">${message}</span>
        <div class="col-md-6 row-fluid">
        <form action="Shopping.com/employee/customer/customer-search" method="post" >
            <div class="row">
                <div class="col-md-3">
                    <input type="text" name="key" placeholder="Tìm kiếm" class="form-control form-control-line" />
                </div>
                <div class="col-md-3">
                    <button type="submit" class="btn btn-primary">Tìm Kiếm</button>
                </div>
            </div>
        </form>
        </div>
        <div class="row page-titles">
        <c:choose>
        <c:when test="${not empty customerList}">
        <div class="col-md-12">
            <div class="row">
                <table class="table">
                    <thead class="-align-justify">
                    <tr>
                        <th scope="row">#</th>
                        <th scope="col">User name</th>
                        <th scope="col">Email</th>
                        <th scope="col">Full name</th>
                        <th scope="col">Images</th>
                        <th scope="col">Address</th>
                        <th scope="col">Gender</th>
                        <th scope="col">Kích Hoạt</th>
                    </tr>
                    </thead>
                    <c:forEach var="c" items="${customerList}" varStatus="iterStat">
                        <tbody>
                        <tr>
                            <div class="col-lg-2 col-md-3 m-t-20">
                                <td>${iterStat.count}</td>
                            </div>
                            <div class="col-lg-2 col-md-3 m-t-20">
                                <td>${c.id}</td>
                            </div>
                            <div class="col-lg-2 col-md-3 m-t-20">
                                <td>${c.email}</td>
                            </div>
                            <div class="col-lg-2 col-md-3 m-t-20">
                                <td>${c.fullName}</td>
                            </div>
                            <!-- Images -->
                            <div class="col-lg-2 col-md-3 m-t-20">
                                <td><img id="image-customer" class="mdi-image-area" src="project/customers/${c.photo}">
                                </td>
                            </div>
                            <div class="col-lg-2 col-md-3 m-t-20">
                                <td>${c.address}</td>
                            </div>
                            <div class="col-lg-2 col-md-3 m-t-20">
                                <td>
                                    <c:choose>
                                        <c:when test="${c.gender lt 2}">
                                            Nam
                                        </c:when>
                                        <c:when test="${c.gender >= 2}">
                                            Nữ
                                        </c:when>
                                    </c:choose>
                                </td>
                            </div>
                            <div class="col-lg-2 col-md-3 m-t-20">
                                <td>
                                    <a href="Shopping.com/employee/customer/editCustomer/${c.id}.htm">
                                        <button type="submit" class="btn btn-warning">Edit</button>
                                    </a>
                                    <a href="Shopping.com/employee/customer/detailCustomer/${c.id}.htm">
                                        <button type="submit" class="btn btn-success">Detail</button>
                                    </a>
                                    <c:choose>
                                        <c:when test="${c.access != -1}">
                                    <a href="Shopping.com/employee/customer/block/${c.id}.htm">
                                        <button type="submit" class="btn btn-danger">Block</button>
                                    </a>
                                        </c:when>
                                        <c:otherwise>
                                        <a href="Shopping.com/employee/customer/restore/${c.id}.htm">
                                            <button type="submit" class="btn btn-primary">Restore</button>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                            </div>
                        </tr>
                        </tbody>
                    </c:forEach>
                </table>
            </div>
            </c:when>
            <c:otherwise>No Customer</c:otherwise>
            </c:choose>
        </div>
            <!-- Phân Trang -->
                <div class="pagination">
                    <!--Pagination  -->
                    <form class="pager"
                    <c:if test="${customerList.size() > 0 }">
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
<jsp:include page="footer.jsp"/>
</body>
</html>