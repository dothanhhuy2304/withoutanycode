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
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
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
<!----->
<style>
    *{
        box-sizing: border-box;
        -moz-box-sizing: border-box;
        -webkit-box-sizing: border-box;
    }
    body{
        font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
    }
    .span6{
        margin-right: -5em;
    }
    .badge {
        padding-left: 9px;
        padding-right: 9px;
        -webkit-border-radius: 9px;
        -moz-border-radius: 9px;
        border-radius: 9px;
    }
    #lblCartCount {
        font-size: 12px;
        background: #ff0000;
        color: #fff;
        padding: 0 5px;
        vertical-align: top;
        margin-left: -10px;
    }
    #headers{
        margin-top: -0.7em;
    }
    #container {
        width: 100%;
        box-shadow: none;
        -webkit-box-shadow: none;
        -moz-box-shadow: none;
        background: white;
    }
    .frag-lang{
    padding-left: 2em;
    margin-top: 0.7em;
    margin-left: -0.1em;
    }
    #fr{
        width: 1.5em;
        height: 1.2em;

    }
    #en,#vi,#frs{
        color: white;text-decoration: none;padding: 0.5em;
    }
</style>
<div id="headers" class="navbar navbar-expand-lg navbar-dark bg-dark navbar-fixed-top">
    <div id="container">
        <div id="welcomeLine" class="row">
            <div class="span6">
                <c:choose>
                    <c:when test="${ sessionScope.user.fullName != null}">
						<span><spring:message code="label.welcome"/> <strong>
                                ${sessionScope.user.fullName }</strong></span>
                        <a href="Shopping.com/user/logout"
                           onclick="return confirm ('Bạn chắc chắn muốn đăng xuất ?')"><span
                                class="btn btn-mini btn-danger"><spring:message code="label.logout"/></span></a>
                    </c:when>
                </c:choose>
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
                <div class="span6">
                <form action="Shopping.com/user/product/search-product.htm" class="form-inline navbar-search" method="GET">
                    <input name="key" type="text">
                    <button type="submit" id="submitButton" class="btn btn-success"><spring:message code="label.search-product"/></button>
                </form>
                <div id="bg" class="frag-lang">
                            <a id="en" href="Shopping.com/user/product?lang=en" class="nav-link dropdown-toggle text-muted waves-effect waves-dark">
                            <img src="project/themes/lite/images/users/US.png" alt="user" class="profile-pic m-r-10">EN</a>
                            <a id="vi" href="Shopping.com/user/product?lang=vi" class="nav-link dropdown-toggle text-muted waves-effect waves-dark">
                            <img src="project/themes/lite/images/users/VN.png" alt="user" class="profile-pic m-r-10">VN</a>
                            <a id="frs" href="Shopping.com/user/product?lang=fr" class="nav-link dropdown-toggle text-muted waves-effect waves-dark">
                            <img src="project/themes/lite/images/users/fr.jpg" alt="user" id="fr" class="profile-pic m-r-10">FR</a>
                </div>
                </div>
                <ul id="topMenu" class="nav pull-right">
                    <li class="">
                        <a href="Shopping.com/user/product"><spring:message code="label.home"/></a>
                    </li>
                    <li class="">
                        <a href="Shopping.com/user/about"><spring:message code="label.introduce"/></a>
                    </li>
                    <li class="">
                        <a href="Shopping.com/user/feedback"><spring:message code="label.feedback" /></a>
                    </li>
                    <li class="">
                        <a href="Shopping.com/user/contact"><spring:message code="label.contact"/></a>
                    </li>
                    <c:choose>
                        <c:when test="${empty sessionScope.user.fullName}">
                            <li class=""><a href="Shopping.com/user/register">
                                <span class="btn btn-success"><spring:message code="label.register"/></span></a>
                            </li>
                            <li class=""><a href="Shopping.com/user/login"><span
                                    class="btn btn-primary"><spring:message code="label.login"/></span></a></li>
                        </c:when>
                        <c:when test="${sessionScope.user.fullName != null}">
                            <li class="">
                                <a href="Shopping.com/user/change-info/${sessionScope.user.id}.htm"><span
                                    class="btn btn-lg btn-info"><spring:message code="label.update-info"/></span></a></li>
                            <li class=""><a href="Shopping.com/user/change-pass/${sessionScope.user.id }.htm"><span
                                    class="btn btn-lg btn-success"><spring:message code="label.change-pass"/></span></a></li>
                        </c:when>
                    </c:choose>
                    <li>
                        <a href="Shopping.com/shopping-cart/index">
                        <i class="icon-shopping-cart" style="font-size:24px"></i>
                        <span class="badge badge-warning cart-count-header" id="lblCartCount"> ${cart.count} </span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
<br>
<br>
<br>
<br>
<br>
<br>