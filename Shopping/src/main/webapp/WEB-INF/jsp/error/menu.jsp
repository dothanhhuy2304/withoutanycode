<%@page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<style>
    #cart-count{
        background: royalblue;
    }
</style>
<div id="sidebar" class="span3">
    <div class="well well-small">
        <a id="myCart" href="shopping-cart/index"><img
                src="project/themes/images/ico-cart.png" alt="cart">Xem sản phẩm giỏ
            hàng </a><br> <br> <span id="cart-amount"
                                     class="btn btn-warning pull-right">
        <fmt:formatNumber value="${cart.amount}" pattern="###,###" /> VNĐ</span> <span
            id="cart-count" class="btn btn-warning pull-left">${cart.count}
			Sản phẩm</span> <br> <br>
    </div>
    <c:choose>
        <c:when test="${sessionScope.user.fullName != null}">
            <div class="well well-small">
                <a id="myCart" href="order/checkout"><img
                        src="project/themes/images/ico-cart.png" alt="cart">Đơn đặt hàng </a><br>
                <a id="myCart" href="order/list"><img
                        src="project/themes/images/ico-cart.png" alt="cart">Thông tin đơn hàng </a>
            </div>
        </c:when>
    </c:choose>
    <br>
    <ul class="nav nav-tabs nav-stacked">
        <li class="subMenu open"><a> CHỦNG LOẠI</a>
            <ul>
                <!-- Show Danh Mục -->
                <c:forEach var="category" items="${category}">
                    <li><a href="user/product/list-by-category/${category.id}.htm">
                        <i class="icon-chevron-right"></i>${category.nameCategory }
                    </a></li>
                </c:forEach>
            </ul></li>
    </ul>
    <br>
    <ul class="nav nav-tabs nav-stacked">
        <li class="subMenu open"><a> NHÀ CUNG CẤP </a>
            <ul>
                <!-- Show Nhà Sản Xuất -->
                <c:forEach var="producer" items="${producer}">
                    <li><a href="user/product/list-by-producer/${producer.id}.htm">
                        <i class="icon-chevron-right"></i>${producer.nameProducer } </a></li>
                </c:forEach>
            </ul></li>
    </ul>
    <br>
    <ul class="nav nav-tabs nav-stacked">
        <li class="subMenu open"><a>HÀNG ĐẶC BIỆT</a>
            <ul>
                <li><a href="user/product/type/best.htm"><i
                        class="icon-chevron-right"></i>Hàng bán chạy</a></li>
                <li><a href="user/product/type/news.htm"><i
                        class="icon-chevron-right"></i>Hàng mới</a></li>
                <li><a href="user/product/type/sales.htm"><i
                        class="icon-chevron-right"></i>Hàng giảm giá</a></li>
                <li><a href="user/product/type/views.htm"><i
                        class="icon-chevron-right"></i>Hàng xem nhiều</a></li>
                <li><a href="user/product/type/special.htm"><i
                        class="icon-chevron-right"></i>Hàng đặc biệt</a></li>
                <li><a href="user/product/type/salesnew.htm"><i
                        class="icon-chevron-right"></i>Hàng giảm giá mới nhất</a></li>
            </ul></li>
    </ul>
    <br>
</div>
