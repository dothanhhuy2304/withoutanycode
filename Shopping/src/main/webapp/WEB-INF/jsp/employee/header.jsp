<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 10/19/2020
  Time: 11:29 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Bootstrap style -->
<link id="callCss" rel="stylesheet" href="project/themes/bootshop/bootstrap.min.css" media="screen" />
<link href="project/themes/css/base.css" rel="stylesheet" media="screen" />
<!-- Bootstrap style responsive -->
<link href="project/themes/css/bootstrap-responsive.min.css" rel="stylesheet" />
<link href="project/themes/css/font-awesome.css" rel="stylesheet" type="text/css">
<!-- Google-code-prettify -->
<link href="project/themes/js/google-code-prettify/prettify.css" rel="stylesheet" />
<!--Jquery CSS-->
<link href="project/themes/assets/jquery-ui/jquery-ui.css" rel="stylesheet">
<link href="project/themes/assets/jquery-ui/jquery-ui.min.css" rel="stylesheet" />
<!-- Bootstrap Core CSS -->
<link href="project/themes/lite/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- chartist CSS -->
<link href="project/themes/lite/plugins/chartist-js/dist/chartist.min.css" rel="stylesheet">
<link href="project/themes/lite/plugins/chartist-js/dist/chartist-init.css" rel="stylesheet">
<link href="project/themes/lite/plugins/chartist-plugin-tooltip-master/dist/chartist-plugin-tooltip.css" rel="stylesheet">
<!--This page css - Morris CSS -->
<link href="project/themes/lite/plugins/c3-master/c3.min.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="project/themes/lite/css/style.css" rel="stylesheet">
<!-- You can change the theme colors from here -->
<link href="project/themes/lite/css/colors/blue.css" id="theme" rel="stylesheet">
<!--JS Jquery-->
<script src="project/themes/assets/js/jquery-3.1.1.min.js"></script>
<header class="topbar">
    <nav class="navbar top-navbar navbar-toggleable-sm navbar-light navbar-fixed-top">
        <!-- Logo -->
        <div class="navbar-header">
            <a class="navbar-brand" href="https://www.facebook.com/profile.php?id=100010618027265" target="blank">
                <!-- Logo icon -->
                <b>
                    <i class="fa fa-paw"></i>
            </b>
                </span alt="homepage">Employee Home</span>
            </a>
        </div>
        <!-- End Logo -->
        <div class="navbar-collapse">
            <ul class="navbar-nav mr-auto mt-md-0">
                <li class="nav-item dropdown" id=""></li>
            </ul>
            <!--begin  -->
            <!--Test-->
             	<c:if test="${sessionScope.employee.nameEmployee != null}">
                        <li class="dropdown"><a href="#" class="dropdown-toggle" id="dropdown" data-toggle="dropdown"> <i class="ti-settings"></i> <span>
                            Tài khoản</span> <b class="caret"></b>
                        </a>
                            <ul class="dropdown-menu">
                                <li><a href="Shopping.com/employee/change-info/${sessionScope.employee.id}.htm">Cập nhật thông tin</a></li>
                                <li> <a id="img-dropdown" class="nav-link dropdown-toggle text-muted waves-effect waves-dark"
                                       href="" data-toggle="dropdown" aria-haspopup="true"
                            aria-expanded="false">
                                    <img src="project/employees/${sessionScope.employee.photo}" alt="user"
                                width="80px" class="profile-pic m-r-10">${sessionScope.employee.nameEmployee}</a></li>
                                <li><a href="Shopping.com/employee/logout"
                                    onclick="return confirm('Bạn chắc chắn muốn đăng xuất ?')">Đăng xuất</a></li>
                            </ul>
                        </li>
                        </c:if>
            <!-- User profile and search -->
            <ul class="navbar-nav my-lg-0">
                <!-- Profile -->
                <!-- Info -->
                <!-- Bottom points-->
                <li class="nav-item dropdown" id="contact">
                    <a href="https://www.facebook.com/profile.php?id=100010618027265" target="blank"
                   class="nav-link dropdown-toggle text-muted waves-effect waves-dark">Liên Hệ
                </a>
                </li>
                <c:if test="${sessionScope.employee.nameEmployee == null}">
                <li class="nav-item dropdown">
<%--                    <div class="pull-right">--%>
                        <a class="nav-link dropdown-toggle text-muted waves-effect waves-dark" href="Shopping.com/employee/register">Register</a>
<%--                    </div>--%>
                </li>
                </c:if>
                <c:if test="${sessionScope.employee.nameEmployee == null}">
                    <li class="nav-item dropdown">
                        <a href="Shopping.com/employee/login" class="nav-link dropdown-toggle text-muted waves-effect waves-dark">Login</a></li>
                </c:if>
                <c:if test="${sessionScope.employee.nameEmployee != null}">
                    <li class="nav-item dropdown"><a
                            class="nav-link dropdown-toggle text-muted waves-effect waves-dark"
                            href="" data-toggle="dropdown" aria-haspopup="true"
                            aria-expanded="false">Xin Chào</a>
                    </li>
                    <li class="nav-item dropdown"><a
                            class="nav-link dropdown-toggle text-muted waves-effect waves-dark"
                            href="" data-toggle="dropdown" aria-haspopup="true"
                            aria-expanded="false">
                        <img src="project/employees/${sessionScope.employee.photo}" alt="user"
                            width="80px" class="profile-pic m-r-10">${sessionScope.employee.nameEmployee}</a></li>
                </c:if>
            </ul>
        </div>
    </nav>
</header>