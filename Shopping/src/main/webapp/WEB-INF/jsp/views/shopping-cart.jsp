<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 10/17/2020
  Time: 7:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <base href="${pageContext.servletContext.contextPath }/" />
    <meta charset="utf-8">
    <title><spring:message code="label.title"/></title>
    <style>
        .d{
            font-size: 3ch;
            text-decoration: none;
            color: red;
        }
        .i{
            font-size: 3ch;
            text-decoration: none;
            color: red;
        }
        .d:hover{
            text-decoration: none;
        }
        .i:hover{
            text-decoration: none;
        }
        .span1{
            text-align: center;
        }
    </style>
</head>
<body>
<jsp:include page="header.jsp"/>
<jsp:include page="menu.jsp"/>
<div id="mainBody">
    <div class="container">
        <div class="row">
            <div class="span9">
                <ul class="breadcrumb">
                    <li><a href="Shopping.com/user/product"><spring:message code="label.home"/></a> <span class="divider">/</span></li>
                    <li class="active"><spring:message code="label.cart-slogan"/></li>
                </ul>
                <h3><spring:message code="label.cart-slogan"/></h3>
                <c:if test="${cart.count >=1 }">
                    <h4 class="hiden">
                        [ <span id="cart-count">${cart.count} <spring:message code="label.cart-product"/> </span> -
                        <span id="cart-amount">
                        <fmt:formatNumber value="${cart.amount}" pattern="###,###" /> VNĐ
                        </span>]
                    </h4>
                </c:if>

                <hr class="soft">
                <form action="Shopping.com/shopping-cart/update" method="post">
                    <table class="table table-bordered">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th><spring:message code="label.cart-photo"/></th>
                            <th><spring:message code="label.cart-name-pd"/></th>
                            <th><spring:message code="label.cart-qty"/></th>
                            <th><spring:message code="label.cart-discount"/></th>
                            <th><spring:message code="label.cart-count"/></th>
                            <th><spring:message code="label.cart-total"/></th>
                            <th><spring:message code="label.cart-action"/></th>
                        </tr>
                        </thead>
                        <c:forEach var="product" items="${cart.items}" varStatus="iterStat">
                            <tbody>
                            <tr>
                                <td>${iterStat.count }</td>
                                <td><img width="80" src="project/products/${product.photo }" alt=""></td>
                                <td>${product.nameProduct }
                                    <br>
                                    <spring:message code="label.cart-unitBrief"/>${product.unitBrief }
                                </td>
                                <td class="span2">
<%--                                    <form:form action="Shopping.com/shopping-cart/update" method="POST">--%>
<%--                                    <div class="input-append">--%>
<%--                                        <input class="span1" style="max-width: 34px" placeholder="1"--%>
<%--                                               id="appendedInputButtons" name="key"--%>
<%--                                               value="${product.quantity }" size="16" type="text">--%>
<%--                                    <button type="submit" class="btn btn-success">Update</button>--%>
<%--                                    </div>--%>
<%--                                    </form:form>--%>
                                    <span id="a">
                                <a class="dupdate-form-cart" id="d" data-url-update-d="Shopping.com/shopping-cart/dUpdate/${product.id}"><span class="d"><</span> </a>
                                    </span>
                                    <input class="span1" id="quantity" name="quantity" placeholder="1" value="${product.quantity}" id="appendedInputButtons" size="16" type="text"/>
                                <a class="iupdate-form-cart" id="i" data-url-update-i="Shopping.com/shopping-cart/iUpdate/${product.id}"><span class="i"> > </span> </a>
                                </td>
                                <td><fmt:formatNumber value="${product.discount }" type="percent" /></td>
                                <td><fmt:formatNumber value="${product.unitPrice }" pattern="###,###" /> VNĐ</td>
                                <td class="atm">
                                    <fmt:formatNumber value="${product.unitPrice*product.quantity*(1-product.discount)}" pattern="###,###" />VNĐ</td>
                                <td><a class="remove-from-cart btn btn-danger" type="button" data-url="Shopping.com/shopping-cart/remove-ajax/${product.id}"><spring:message code="label.cart-del"/>
                                </a>
                                </td>
                            </tr>
                            </tbody>
                        </c:forEach>
                    </table>
                    <div style="text-align: center;">
                        <hr>
                        <c:choose>
                            <c:when test="${cart.count >=1 }">
                                <a href="Shopping.com/user/product" class="btn btn-large btn-success">
                                    <spring:message code="label.cart-continue-buy"/> </a>
                                <a href="Shopping.com/shopping-cart/clear" class="btn btn-large btn-success">
                                    <spring:message code="label.cart-delall"/></a>
                                <c:choose>
                                    <c:when test="${!empty sessionScope.user && cart.count > 0}">
                                        <a href="Shopping.com/order/checkout" class="btn btn-large btn-success">
                                            <img style="height: 1em" src="project/shopping_cart.png">
                                            <spring:message code="label.cart-checkout"/></a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="Shopping.com/user/login" id="buy" class="btn btn-large btn-success">
                                            <img style="height: 1em" src="project/shopping_cart.png"> <spring:message code="label.cart-checkout"/></a>
                                    </c:otherwise>
                                </c:choose>
                            </c:when>
                            <c:otherwise>
                                <a href="Shopping.com/user/product" class="btn btn-large btn-success"><spring:message code="label.cart-continue-buy"/></a>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"/>
</body>
<script>
    $(function() {
        $("a.remove-from-cart").click(function() {
            tr = $(this).parents("tr");
            dataUrl = $(this).attr("data-url");
            $.ajax({
                url : dataUrl,
                type:"GET",
                data : {},
                dataType : "json",
                success : function(response) {
                    $("span#cart-count").html(response.count + " <spring:message code="label.cart-product"/>");
                    $("span#cart-amount").html(response.amount + " VNĐ");
                    $("span#cart-count-header").html("<i class='icon-shopping-cart icon-white fa-2x' id='cart-counts'></i>"+response.count+"</span> </a>");
                    $("span.cart-count-header").html(response.count);
                    $(".hiden").hide(500);
                    tr.hide(500);
                    if(response.quantity<1) {
                        $("#buy").hide();
                    }
                }
            });
            return false;
        });
    });
    $(function () {
       $("a.iupdate-form-cart").click(function () {
           tr=$(this).parents("tr");
           dataUrl=$(this).attr("data-url-update-i");
           $.ajax({
               type:"GET",
               url: dataUrl,
               data: {},
               contentType: "application/json;",
               success: function (response) {
                   $("span#cart-count").html(response.count + " <spring:message code="label.cart-product"/> ");
                   $("span#cart-amount").html(response.amount + " VNĐ");
                   $("span.cart-count-header").html(response.count);
                   $(".atm").html(response.amount + " VNĐ");
                   location.reload();
               }
           });
           return false;
       });
    });
</script>
<script>
    $(function () {
        $("a.dupdate-form-cart").click(function () {
            tr=$(this).parents("tr");
            dataUrl=$(this).attr("data-url-update-d");
            $.ajax({
                type:"GET",
                url:dataUrl,
                data:{},
                contentType: "application/json;",
                success: function (response) {
                    if(response.quantity<=1){
                        $("#a").hide();
                        // response.quantity===1;
                        $("span#cart-count").html(response.count + " <spring:message code="label.cart-product"/>");
                        $("span#cart-amount").html(response.amount + " VNĐ");
                        $("span.cart-count-header").html(response.count);
                        $("input.span1").val(response.quantity);
                        $(".atm").html(response.amount + " VNĐ");
                    }else{
                        $("span#cart-count").html(response.count + " <spring:message code="label.cart-product"/>");
                        $("span#cart-amount").html(response.amount + " VNĐ");
                        $("span.cart-count-header").html(response.count);
                        $(".atm").html(response.amount + " VNĐ");
                        location.reload();
                    }
                }
            });
            return false;
        });
    });
</script>
</html>