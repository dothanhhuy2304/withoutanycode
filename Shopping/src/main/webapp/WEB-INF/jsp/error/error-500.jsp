<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 11/2/2020
  Time: 8:25 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<html><!DOCTYPE html>

<head>
    <base href="${pageContext.servletContext.contextPath}/">
    <meta charset="ISO-8859-1">
    <title>Page 404</title>
    <!-- Google font -->
    <link href="project/themes/error/css/font.css" rel="stylesheet">
    <!-- Custom stlylesheet -->
    <link type="text/css" rel="stylesheet" href="project/themes/error/css/style.css" />
</head>
<body>
<div id="notfound">
    <div class="notfound">
        <div class="notfound-404">
            <h1>${statusCode}</h1>
        </div>
        <p>${exception}</p>
        <a href="${pageContext.request.contextPath}/">Go Home</a>
    </div>
</div>
</body>
</html>