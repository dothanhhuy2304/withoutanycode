<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 10/17/2020
  Time: 9:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <base href="${pageContext.servletContext.contextPath }/" />
    <meta charset="utf-8">
    <title><spring:message code="label.title"/></title>
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
                    <li class="active"><spring:message code="label.oslogan"/></li>
                </ul>
                <h3><spring:message code="label.oslogan"/></h3>
                <label class="error">
                    <h5><spring:message code="label.osuccess1"/> ${status_order}
                        <spring:message code="label.osuccess1.1"/>${od}
                        <spring:message code="label.osuccess2"/>

                    </h5>
                    <h4 style="color: green">-<spring:message code="label.ototaloder"/>
<%--                        <fmt:formatNumber value="${totally}" pattern="###,###" />VNĐ--%>
                        <fmt:formatNumber value="${order.amount}" pattern="###,###" />VNĐ
                    </h4>
                </label>

                <div class="well">
                    <form:form modelAttribute="order">
                        <div class="control-group">
                            <label class="control-label"><spring:message code="label.oreceiver"/></label>
                            <div class="controls">
                                <form:input path="receiver" class="form-control valid" placeholder="Require Date" readonly="true" />
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label"><spring:message code="label.onumberphone"/> </label>
                            <div class="controls">
                                <form:input path="numberPhone" class="form-control valid" placeholder="Number Phone" readonly="true" />
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label"><spring:message code="label.odate"/></label>
                            <div class="controls">
                                <form:input path="orderDate" class="form-control valid" placeholder="Order Date" readonly="true" />
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label"><spring:message code="label.odaterequire"/> </label>
                            <div class="controls">
                                <form:input path="requireDate" class="form-control valid" placeholder="Require Date" readonly="true" />
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label"><spring:message code="label.oprice"/> </label>
                            <div class="controls">
<%--                                <form:input style="width:300px" path="amount" class="form-control valid" placeholder="Amount" readonly="true" pattern="###,###,###" />--%>
                                <span style="color:red;font-size: 3ch"> <fmt:formatNumber value="${order.amount}" type="number"/>VNĐ</span>
                            </div>
                        </div>
                    </form:form>
                </div>

                <div class="btn btn-warning pull-right">

                    <h4 style="text-align: right">
                        <span id="cart-count"><spring:message code="label.opay"/></span>
                        <h3>
                    <%--    <fmt:formatNumber value="${totally}" pattern="###,###" />VNĐ--%>
                            <fmt:formatNumber value="${order.amount}" pattern="###,###" />VNĐ
                        </h3>
                    </h4>

                </div>
                <hr class="soft">
                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th><spring:message code="label.ocode"/></th>
                        <th><spring:message code="label.oname"/></th>
                        <th><spring:message code="label.ophoto"/></th>
                        <th><spring:message code="label.oprice1"/></th>
                        <th><spring:message code="label.odiscount"/></th>
                        <th><spring:message code="label.oqty"/></th>
                        <th><spring:message code="label.ototal"/></th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="d" items="${details}">
                        <tr>
                            <td>${d.product.id}</td>
                            <td>${d.product.nameProduct}</td>
                            <td><img src="project/products/${d.product.photo }" style="border-radius: 20px" width="120px" height="100px" /></td>
                            <td><fmt:formatNumber value="${d.amount }" pattern="###,###" />VNĐ</td>
                            <td><c:choose>
                                <c:when test="${d.discount == null}">0%</c:when>
                                <c:when test="${d.discount == 0}">0%</c:when>
                                <c:otherwise>
                                    <fmt:formatNumber value="${d.discount }" type="percent" />
                                </c:otherwise>
                            </c:choose></td>
                            <td>${d.quantity}</td>
                            <td>
                                        <fmt:formatNumber value="${d.order.amount}" pattern="###,###" />
                                    <%--<fmt:formatNumber value="${d.amount * d.quantity * (1-d.discount)}" pattern="###,###" /> --%>
                                        VNĐ</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>