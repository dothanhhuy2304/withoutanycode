<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 10/13/2020
  Time: 2:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<base href="${pageContext.servletContext.contextPath}/">
<!-- Bootstrap style -->
<link href="project/themes/assets/css/bootstrap.min.css" rel="stylesheet" media="screen"/>
<link id="callCss" rel="stylesheet" href="project/themes/bootshop/bootstrap.min.css" media="screen" />
<link href="project/themes/css/base.css" rel="stylesheet" media="screen" />
<!-- Bootstrap style responsive -->
<link href="project/themes/css/bootstrap-responsive.min.css" rel="stylesheet" />
<link href="project/themes/css/font-awesome.css" rel="stylesheet" type="text/css">
<!-- Google-code-prettify -->
<link href="project/themes/js/google-code-prettify/prettify.css" rel="stylesheet" />
<style>
    .span6{
        margin-right: -5em;
    }
    #cart-count{
    background: #3d9400;
    }
    #nav-header{
        background: #4da6ff;
    }
</style>
<div id="header">
    <div class="container">
        <div id="welcomeLine" class="row">
            <div class="span6">
                <c:choose>
                    <c:when test="${ sessionScope.user.fullName == null }">
                        <%-- <a href="user/forgot"><span class="btn btn-sm btn-success">Quên
                                mật khẩu</span></a> --%>
                    </c:when>
                    <c:when test="${ sessionScope.user.fullName != null}">
						<span>Xin chào: <strong>
                                ${sessionScope.user.fullName }</strong></span>
                        <a href="user/logout"
                           onclick="return confirm ('Bạn chắc chắn muốn đăng xuất ?')"><span
                                class="btn btn-mini btn-danger">Đăng xuất</span></a>
                    </c:when>
                </c:choose>
            </div>
            <div class="span6">
                <div class="pull-right">
                   <span id="cart-amount" class="btn btn-default btn-sm">$<fmt:formatNumber value="${cart.amount}" pattern="###,###" /> VNĐ</span>
                    <a href="shopping-cart/index">
                    <span id="cart-count" class="btn btn-sm btn-primary">
                        <i class="icon-shopping-cart icon-white"></i> ${cart.count } Sản Phẩm Trong Giỏ Hàng</span> </a>
                </div>
            </div>
        </div>
        <!-- Navbar-->
        <div id="logoArea" class="navbar">
            <a id="smallScreen" data-target="#topMenu" data-toggle="collapse" class="btn btn-navbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </a>
            <div class="navbar-inner" id="nav-header">
                <form action="user/product/search-product.htm" class="form-inline navbar-search" method="GET">
                    <input id="" name="key" type="text">
                    <button type="submit" id="submitButton" class="btn btn-danger">Tìm kiếm</button>
                </form>
                <ul id="topMenu" class="nav pull-right">
                    <li class="">
                        <a href="user/product/">Trang chủ</a>
                    </li>
                    <li class="">
                        <a href="user/about">Giới thiệu</a>
                    </li>
                    <li class="">
                        <a href="user/feedback">Góp ý</a>
                    </li>
                    <li class="">
                        <a href="user/contact">Liên hệ</a>
                    </li>
                    <c:choose>
                        <c:when test="${empty sessionScope.user.fullName}">
                            <li class=""><a href="user/register">
                                <span class="btn-xs btn-warning">Đăng ký</span></a>
                            </li>
                            <li class=""><a href="user/login"><span
                                    class="btn-xs btn-success">Đăng nhập</span></a></li>
                        </c:when>
                        <c:when test="${sessionScope.user.fullName != null}">
                            <li class=""><a
                                    href="user/change-info/${sessionScope.user.id}.htm"><span
                                    class="btn btn-lg btn-info">Cập nhật</span></a></li>
                            <li class=""><a
                                    href="user/change-pass/${sessionScope.user.id }.htm"><span
                                    class="btn btn-lg btn-success">Đổi mật khẩu</span></a></li>
                        </c:when>
                    </c:choose>
                </ul>
            </div>
        </div>
    </div>
</div>
