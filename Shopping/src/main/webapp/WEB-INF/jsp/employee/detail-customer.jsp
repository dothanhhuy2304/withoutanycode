<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 10/23/2020
  Time: 10:19 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <base href="${pageContext.servletContext.contextPath }/" />
    <meta charset="utf-8">
    <title>Website Bán Hàng Online</title>
    <link href="project/themes/assets/jquery-ui/jquery-ui.min.css" rel="stylesheet" />
    <script src="project/themes/js/jquery-1.7.1.min.js"></script>
    <script src="project/themes/js/jquery.validate.min.js"></script>
    <style>
        #table-detail{
            padding: 3em 3em 3em 3em;
        }
        .img{
            border-radius: 50%;
            -moz-border-radius: 50%;
            -webkit-border-radius: 50%;
        }
    </style>
</head>
<body>
<jsp:include page="header.jsp"/>
<jsp:include page="menu.jsp"/>
<div id="mainBody">
    <div class="container">
        <div class="row">
            <!--  -->
            <div class="span9">
                <ul class="breadcrumb">
                    <li><a href="Shopping.com/employee/home">Home</a> <span class="divider">/</span></li>
                    <li class="active">Chi tiết khách hàng</li>
                </ul>
                <h3>Chi tiết khách hàng</h3>
                <h4 style="color: red;">${status_note_login}</h4>
                <!--Start-->
                <c:choose>
                    <c:when test="${! empty customers}">
                <table class="table" id="table-detail">
                    <thead class="-align-justify">
                            <tr>
                                <th scope="row">User Name</th>
                                <th scope="row">Code</th>
                                <th scope="row">Email Address</th>
                                <th scope="row">Full Name</th>
                                <th scope="row">Number Phone</th>
                                <th scope="row">Address</th>
                                <th scope="row">Birthday</th>
                                <th scope="row">Gender</th>
                                <th scope="row">Status</th>
                                <th scope="row">Avatar</th>
                            </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <div class="col-lg-2 col-md-3 m-t-20">
                        <td>${customers.id}</td>
                        </div>
                        <div class="col-lg-2 col-md-3 m-t-20">
                            <td>${customers.code}</td>
                        </div>
                        <div class="col-lg-2 col-md-3 m-t-20">
                        <td>${customers.email}</td>
                        </div>
                        <div class="col-lg-2 col-md-3 m-t-20">
                        <td>${customers.fullName}</td>
                        </div>
                        <div class="col-lg-2 col-md-3 m-t-20">
                        <td>${customers.numberPhone}</td>
                        </div>
                        <div class="col-lg-2 col-md-3 m-t-20">
                        <td>${customers.address}</td>
                        </div>
                        <div class="col-lg-2 col-md-3 m-t-20">
                        <td>
                            <fmt:formatDate value='${customers.birthday}' pattern="dd-MM-yyyy"/>
                        </td>
                        </div>
                        <div class="col-lg-2 col-md-3 m-t-20">
                            <td>
                        <c:choose>
                        <c:when test="${customers.gender < 2}">Nam</c:when>
                            <c:when test="${customers.gender >=2}">Nữ</c:when>
                        </c:choose>
                            </td>
                        </div>
                        <div class="col-lg-2 col-md-3 m-t-20">
                        <td>
                        <c:choose>
                            <c:when test="${customers.activated == false}">
                                Chưa kích hoạt
                            </c:when>
                            <c:when test="${customers.activated == true}">
                                Đã kích hoạt
                            </c:when>
                        </c:choose>
                        </td>
                        </div>
                        <div class="col-lg-2 col-md-3 m-t-20">
                        <td><img class="img" src="project/customers/${customers.photo}"></td>
                        </div>
                    </tr>
                    </tbody>
                </table>
                    </c:when>
                    <c:otherwise>
                        <center>Sorry this customer does not exist</center>
                    </c:otherwise>
                </c:choose>
            </div>
            <!--  -->
        </div>
    </div>
    <br><br><br><br><br>       <br><br><br><br><br>
</div>
<jsp:include page="footer.jsp"/>
<script src="project/themes/assets/jquery-ui/jquery-ui.min.js"></script>
</body>
</html>