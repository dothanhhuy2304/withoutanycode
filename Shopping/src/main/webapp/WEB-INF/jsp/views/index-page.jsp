<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 10/13/2020
  Time: 10:36 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <base href="${pageContext.servletContext.contextPath }/"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta charset="utf-8">
    <link rel="stylesheet" href="project/themes/css/normalize.min.css">
    <title><spring:message code="label.title"/> </title>
    <style>
        .hd-draw{
            margin-top: -0.7em;
        }
        .thumbnail{
            width: auto !important;
            height: 30em !important;
        }
        .thumbnail a .ing-product {
            width: 200px;
            height: 150px !important;
            padding: 5px;
        }
        .pager input {
            background-color: #C6C6C6;
            border-radius: 100%;
        }
        .pager input[disabled] {
            background-color: #F9F9F9;
        }
        .box > ul img[id]:hover {
            opacity: 0.6;
        }
        .box > ul:hover {
            box-shadow: 0 0 5px red;
        }
        #message_error{
            color: royalblue;
        }
        #cart-price{
            text-decoration-line: line-through;
        }
        /**
        */
        .sale {
            position: relative;
            display: inline-block;
            background: #3d9400;
            color: white;
            height: 2rem;
            width: 2rem;
            text-align: center;
            vertical-align: middle;
            margin-left: 0.5rem;
            margin-top: -11em;
            line-height: 2.5rem;
            -webkit-transform: rotate(-20deg);
            transform: rotate(-20deg);
            -webkit-animation: beat 1s ease infinite alternate;
            animation: beat 1s ease infinite alternate;
        }
        .sale:before, .sale:after {
            content: "";
            position: absolute;
            background: inherit;
            height: inherit;
            width: inherit;
            top: 0;
            left: 0;
            z-index: -1;
            -webkit-transform: rotate(30deg);
            transform: rotate(30deg);
        }
        .sale:after {
            -webkit-transform: rotate(60deg);
            transform: rotate(60deg);
        }

        @-webkit-keyframes beat {
            from {
                -webkit-transform: rotate(-20deg) scale(1);
                transform: rotate(-20deg) scale(1);
            }
            to {
                -webkit-transform: rotate(-20deg) scale(1.1);
                transform: rotate(-20deg) scale(1.1);
            }
        }

        @keyframes beat {
            from {
                -webkit-transform: rotate(-20deg) scale(1);
                transform: rotate(-20deg) scale(1);
            }
            to {
                -webkit-transform: rotate(-20deg) scale(1.1);
                transform: rotate(-20deg) scale(1.1);
            }
        }

        #cart-price,#view,#discounts{
            opacity: 100%;
        }
    </style>
</head>
<div class="hd-draw">
<jsp:include page="header.jsp"/>
</div>
<body>
<jsp:include page="slidershow.jsp"/>
<div class="col-md-2">
<jsp:include page="menu.jsp"/>
</div>
<%--<!--New-->--%>
<%--<!--------------------------------------------------------->--%>
<%--<div class="pull-right">--%>
<%--    <jsp:include page="menu.jsp"/>--%>
<%--</div>--%>
<%--<!--------------------------------------------------------->--%>
<div id="mainBody">
    <div class="container">
        <div class="col-md-6">
        <div class="row">
            <!--  -->
            <div class="span12">
                <ul class="breadcrumb">
                    <li><a href="Shopping.com/user/product"><spring:message code="label.nav1"/></a> <span class="divider">/</span></li>
                    <li class="active"><spring:message code="label.nav2"/></li>
                </ul>
                <h3>
                    <spring:message code="label.title.title-page" /> <small class="pull-right">  ${totalElements} <spring:message code="label.product.available" /> </small>
                </h3>
                <hr class="soft">
                <p>
				<spring:message code="label.slogan"/>
                </p>
                <hr class="soft">
                <div id="myTab" class="pull-right">
                </div>
                <br class="clr">
                <div class="tab-content">
                    <div class="tab-pane  active" id="blockView">
                        <hr class="soft">
                        <ul class="thumbnails">
                            <c:choose>
                                <c:when test="${products.size() > 0 }">
                                    <c:forEach var="product" items="${products}">
                                        <li class="span3">
                                            <div class="thumbnail">
                                                <div class="img-content">
                                                <a href="Shopping.com/user/product/detail/${product.id}.htm">
                                                    <img class="ing-product" src="${pageContext.request.contextPath}/project/products/${product.photo}">
                                                    <c:choose>
                                                        <c:when test="${product.discount == null}">
                                                        </c:when>
                                                        <c:when test="${product.discount == 0}">
                                                        </c:when>
                                                        <c:otherwise>
                                                        <span class="sale">
                                                            <fmt:formatNumber type = "percent" maxIntegerDigits = "3" value = "${product.discount}" />
                                                            </span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </a>
                                                </div>
                                                <div class="card h-100">
                                                    <h5>${product.nameProduct }</h5>
                                                    <h5><spring:message code="label.number"/>: ${product.quantity }</h5>
                                                    <h4 class="card-header" style="text-align: center">
                                                        <a class="btn" href="Shopping.com/user/product/detail/${product.id }.htm">
                                                            <i class="icon-zoom-in"></i><spring:message code="label.detail-product"/>
                                                        </a>
                                                        <a class="btn" title='<spring:message code="label.addToCart1" />' href="Shopping.com/shopping-cart/add/${product.id}"><spring:message code="label.addToCart2" />
                                                            <i class="icon-shopping-cart"></i>
                                                        </a>
                                                        <br>
                                                        <a class="btn btn-success disabled" id="cart-price">
                                                        <fmt:formatNumber value="${product.unitPrice }" pattern="###,###"/> VNĐ </a>
                                                             	<a id="view" class="btn btn-danger disabled"><spring:message code="label.view"/> ${product.views }</a>
                                                        <a id="discounts" class="btn btn-warning disabled"><spring:message code="label.discount" />

                                                            <c:if test="${product.discount <= 0}">
                                                                <fmt:formatNumber value="${product.unitPrice}" pattern="###,###"/>VNĐ
                                                                        </c:if>
                                                            <c:if test="${product.discount >0}">
                                                            <fmt:formatNumber value="${product.unitPrice*(1-product.discount)}" pattern="###,###" />VNĐ
                                                        </c:if>
                                                        </a>
                                                    </h4>
                                                </div>
                                            </div>
                                        </li>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                <li class="col-md-9">
                                    <tr align="center" class="col-md-4">
                                        <td colspan="5"><h3 class="span24 pull-right" id="message_error"><spring:message code="label.notFound"/></h3></td>
                                    </tr>
                                </li>
                                </c:otherwise>
                            </c:choose>
                        </ul>
                    </div>
                    <div class="pagination">
                        <!--Pagination  -->
                        <form class="pager"
                        <c:if test="${products.size() > 0 }">
                        <div class="panel-footer">
                            Showing ${number} of ${size} of ${totalElements}
                            <ul class="pagination">
                                <c:forEach begin="0" end="${totalPages-1}" var="page">
                                    <li class="page-item">
                                        <a href="${pageContext.response.getHeader("list")}/?page=${page}&size=${size}" class="page-link">${page+1}</a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"/>
</body>
<!--End Pagination  -->
</html>

