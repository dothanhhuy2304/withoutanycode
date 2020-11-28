<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 10/19/2020
  Time: 11:29 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<style>
    #dialog-link span {
        margin: 0 5px 0 0;
        position: absolute;
        left: .2em;
        top: 50%;
        margin-top: -8px;
    }

    #icons li {
        margin: 2px;
        position: relative;
        padding: 4px 0;
        cursor: pointer;
        float: left;
        list-style: none;
    }

    #icons span {
        float: left;
        margin: 0 4px;
    }

    select {
        width: 200px;
    }
</style>
<aside class="left-sidebar">
    <!-- Sidebar scroll-->
    <div class="scroll-sidebar">
        <br>
        <nav class="sidebar-nav">
            <ul id="sidebarnav">
                <li class="active">
                    <a class="waves-effect waves-dark" href="Shopping.com/employee/home" aria-expanded="false">
                    <i class="mdi mdi-gauge"></i>
                    <span class="hide-menu">Trang chủ</span>
                    </a>
                </li>
                <li class="active">
                    <a class="waves-effect waves-dark" href="Shopping.com/employee/customer" aria-expanded="false">
                        <i class="mdi mdi-account-check"></i>
                        <span class="hide-menu">Quản lý khách hàng</span>
                    </a>
                </li>
                <li class="active">
                    <a class="waves-effect waves-dark" href="Shopping.com/employee/category" aria-expanded="false">
                    <i class="mdi mdi-table"></i>
                        <span class="hide-menu">Quản lý danh mục</span>
                    </a>
                </li>
                <li class="active">
                    <a class="waves-effect waves-dark" href="Shopping.com/employee/producer" aria-expanded="false">
                        <i class="mdi mdi-emoticon"></i>
                        <span class="hide-menu">Quản lý Thương hiệu</span>
                    </a>
                </li>
                <li class="active">
                    <a class="waves-effect waves-dark" href="Shopping.com/employee/product" aria-expanded="false">
                        <i class="mdi mdi-earth"></i>
                        <span class="hide-menu">Quản lý sản phẩm</span>
                    </a>
                </li>
                <li class="active">
                    <a class="waves-effect waves-dark" href="Shopping.com/employee/order" aria-expanded="false">
                    <i class="mdi mdi-book-open-variant"></i>
                        <span class="hide-menu">Thông tin đơn hàng</span>
                    </a>
                </li>
                <li class="active">
                    <a class="waves-effect waves-dark" href="Shopping.com/employee/inventory" aria-expanded="false">
                        <i class="mdi mdi-barcode-scan"></i>
                        <span class="hide-menu">Kiểm kê hàng hóa</span>
                    </a>
                </li>
                 <li class="active"><a class="waves-effect waves-dark" href="Shopping.com/employee/revenue/by-category.htm" aria-expanded="false">
                     <i class="mdi mdi-help-circle"></i>
                     <span class="hide-menu">Doanh thu</span>
                 </a>
                 </li>
            </ul>
            <div class="text-center m-t-30">
                <a href="Shopping.com/user/product" class="btn waves-effect wa	ves-light btn-warning hidden-md-down">
                    Quyền truy cập nhân viên
                </a>
            </div>
        </nav>
    </div>
    <!-- End Sidebar scroll-->
    <!-- Bottom points-->

    <!-- Bottom points-->
    <div class="sidebar-footer">
        <!-- item-->
        <a href="" class="link" data-toggle="tooltip" title="Tài khoản">
            <i class="ti-settings"></i></a>
        <!-- item-->
        <a href="" class="link" data-toggle="tooltip" title="Email">
            <i class="mdi mdi-gmail"></i></a>
        <!-- item-->
        <a href="Shopping.com/employee/logout" class="link" data-toggle="tooltip" title="Đăng xuất"
           onclick="return confirm('Bạn chắc chắn muốn đăng xuất ?')">
            <i class="mdi mdi-power"></i></a>
    </div>
    <!-- End Bottom points-->
</aside>
<script src="project/themes/js/jquery.validate.min.js"></script>