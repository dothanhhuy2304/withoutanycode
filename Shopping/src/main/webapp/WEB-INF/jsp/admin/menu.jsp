<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 10/26/2020
  Time: 2:35 PM
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
                    <a class="waves-effect waves-dark"  href="Shopping.com/admin/home" aria-expanded="false">
                    <i class="mdi mdi-gauge"></i>
                    <span class="hide-menu">Trang chủ</span>
                    </a>
                </li>
                <li class="active">
                    <a class="waves-effect waves-dark" href="Shopping.com/admin/department" aria-expanded="false">
                        <i class="mdi mdi-account-check"></i><span class="hide-menu">Quản Lý Phòng Ban </span>
                    </a>
                </li>
                <li class="active">
                    <a class="waves-effect waves-dark" href="Shopping.com/admin/account" aria-expanded="false">
                        <i class="mdi mdi-account-check"></i><span class="hide-menu">Quản Lý Tài Khoản </span>
                    </a>
                </li>
                <li class="active">
                    <a class="waves-effect waves-dark" href="Shopping.com/admin/contract" aria-expanded="false">
                        <i class="mdi mdi-account-check"></i><span class="hide-menu">Quản Lý Hợp Đồng </span>
                    </a>
                </li>
                <li class="active">
                    <a class="waves-effect waves-dark" href="Shopping.com/admin/product" aria-expanded="false">
                        <i class="mdi mdi-table"></i><span class="hide-menu">Sản Phẩm Đang Chờ</span></a></li>
                <li class="active">
                    <a class="waves-effect waves-dark" href="Shopping.com/admin/orderDetail" aria-expanded="false">
                        <i class="mdi mdi-emoticon"></i>
                        <span class="hide-menu">Quản Lý Đơn Hàng</span>
                    </a>
                </li>
                <li class="active">
                    <a class="waves-effect waves-dark" href="Shopping.com/admin/inventory" aria-expanded="false">
                        <i class="mdi mdi-earth"></i>
                        <span class="hide-menu">Quản Lý Kho Hàng</span>
                    </a>
                </li>
                <li class="active">
                    <a class="waves-effect waves-dark" href="Shopping.com/admin/revenue/by-category.htm" aria-expanded="false">
                    <i class="mdi mdi-book-open-variant"></i>
                    <span class="hide-menu">Doanh Thu</span>
                    </a>
                </li>
            </ul>
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
        <a href="Shopping.com/admin/logout" class="link" data-toggle="tooltip" title="Đăng xuất"
           onclick="return confirm('Bạn chắc chắn muốn đăng xuất ?')">
            <i class="mdi mdi-power"></i>
        </a>
    </div>
    <!-- End Bottom points-->
</aside>
<script src="project/themes/js/jquery.validate.min.js"></script>

