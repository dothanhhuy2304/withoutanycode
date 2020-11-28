<%@page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<style>
    #cart-count{
        background: royalblue;
    }
</style>
<div id="sidebar" class="span3">
    <div class="well well-small">
        <a id="myCart" href="Shopping.com/shopping-cart/index">
            <img src="project/themes/images/ico-cart.png" alt="cart">
            <spring:message code="label.seeCart"/>
            </a><br> <br>
        <span id="cart-amount" class="btn btn-warning pull-right">
        <fmt:formatNumber value="${cart.amount}" pattern="###,###" /> VNĐ</span>
        <span id="cart-count" class="btn btn-warning pull-left">${cart.count}&nbsp;
            <spring:message code="label.countCart"/></span> <br> <br>
    </div>
    <c:choose>
        <c:when test="${sessionScope.user.fullName != null}">
            <div class="well well-small">
                <a id="myCart" href="Shopping.com/order/checkout">
                    <img src="project/themes/images/ico-cart.png" alt="cart">
                    <spring:message code="label.orderList"/></a><br>
                <a id="myCart" href="Shopping.com/order/list"><img
                        src="project/themes/images/ico-cart.png" alt="cart">
                    <spring:message code="label.info-order"/></a>
            </div>
        </c:when>
    </c:choose>
    <br>
    <ul class="nav nav-tabs nav-stacked">
        <li class="subMenu open"><a><spring:message code="label.category"/></a>
            <ul>
                <!-- Show Danh Mục -->
                <c:forEach var="category" items="${category}">
                    <spring:message code="label.category" var="flag"/>
                    <li><a href="Shopping.com/user/product/list-by-category/${category.id}.htm">
                        <i class="icon-chevron-right"></i>
                        <c:if test="${flag == 'CHỦNG LOẠI'}">
                            ${category.nameCategory }
                        </c:if>
                        <c:if test="${flag != 'CHỦNG LOẠI'}">
                            ${category.nameCategoryEN}
                        </c:if>
                    </a></li>
                </c:forEach>
            </ul></li>
    </ul>
    <br>
    <ul class="nav nav-tabs nav-stacked">
        <li class="subMenu open"><a><spring:message code="label.producer"/></a>
            <ul>
                <!-- Show Nhà Sản Xuất -->
                <c:forEach var="producer" items="${producer}">
                    <li><a href="Shopping.com/user/product/list-by-producer/${producer.id}.htm">
                        <i class="icon-chevron-right"></i>${producer.nameProducer } </a></li>
                </c:forEach>
            </ul></li>
    </ul>
    <br>
    <ul class="nav nav-tabs nav-stacked">
        <li class="subMenu open"><a><spring:message code="label.product-special"/></a>
            <ul>
                <li><a href="Shopping.com/user/product/type/buy.htm">
                    <i class="icon-chevron-right"></i><spring:message code="label.mbuy"/></a></li>
                <li><a href="Shopping.com/user/product/type/news.htm">
                    <i class="icon-chevron-right"></i><spring:message code="label.new"/></a></li>
                <li><a href="Shopping.com/user/product/type/sales.htm">
                    <i class="icon-chevron-right"></i><spring:message code="label.msale"/> </a></li>
                <li><a href="Shopping.com/user/product/type/views.htm">
                    <i class="icon-chevron-right"></i><spring:message code="label.vmiew"/></a></li>
                <li><a href="Shopping.com/user/product/type/special.htm">
                    <i class="icon-chevron-right"></i><spring:message code="label.mspecial"/></a></li>
                <li><a href="Shopping.com/user/product/type/salesnew.htm">
                    <i class="icon-chevron-right"></i><spring:message code="label.salenew"/></a></li>
            </ul></li>
    </ul>
    <br>
</div>
