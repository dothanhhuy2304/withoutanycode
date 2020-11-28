<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 10/18/2020
  Time: 2:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <base href="${pageContext.servletContext.contextPath }/" />
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<%--    <link rel="stylesheet" href="project/themes/css/style.css">--%>
<%--    <link rel="stylesheet" href="project/themes/css/pagination.css">--%>
    <title><spring:message code="label.title"/></title>
    <style>
        body{
            border: none;
            max-width: 100%;
            width: 100%;
        }
        #content-ept{
            font-family: Helvetica sans-serif;
            text-align: center;
            margin-left: 3em;
        }
        tr td{
            padding: 4em 4em 4em 4em;
        }
        #order{line-height: 3.456;
            border: none;
            padding: 4em !important;
            margin-left: -3.5em;
        }
    </style>
</head>
<body>
<jsp:include page="header.jsp"/>
<jsp:include page="menu.jsp"/>
<div id="mainBody">
    <div class="container-fluid">
        <div class="row">
            <div class="span9">
                <ul class="breadcrumb">
                    <li><a href="Shopping.com/user/product"><spring:message code="label.home"/></a> <span class="divider">/</span></li>
                    <li class="active"><spring:message code="label.olslogan1"/></li>
                </ul>
                <h3><spring:message code="label.olslogan2"/></h3>
                <br>
                <hr class="soft">
                <div class="span6">
                <table id="order" class="table table-striped table-bordered text-center">
                    <thead>
                    <tr>
                        <th scope="row"><spring:message code="label.olcode"/></th>
                        <th scope="row"><spring:message code="label.olnameuser"/></th>
                        <th scope="row"><spring:message code="label.oldate"/></th>
                        <th scope="row"><spring:message code="label.olrequire"/></th>
                        <th scope="row"><spring:message code="label.olreceiver"/></th>
                        <th scope="row"><spring:message code="label.olprice"/></th>
                        <th scope="row"><spring:message code="label.oladdress"/> </th>
                        <th scope="row"><spring:message code="label.olnumberphone"/></th>
                        <th scope="row"><spring:message code="label.olstatus"/></th>
                        <th scope="row"><spring:message code="label.olaction"/></th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:if test="${not empty order}">
                    <c:forEach items="${order }" var="o">
                        <tr>
                            <td>${o.id}</td>
                            <td>${o.customer.id }</td>
                            <td><fmt:formatDate value="${o.orderDate}" pattern="dd/MM/yyy" /></td>
                            <td><fmt:formatDate value="${o.requireDate}" pattern="dd/MM/yyy" /></td>
                            <td>${o.receiver}</td>
                            <td><fmt:formatNumber value="${o.amount}" pattern="###,###" />
                                VNĐ</td>
                            <td>${o.address}</td>
                            <td>${o.numberPhone }</td>
                            <td><c:choose>
                                <c:when test="${o.status == 1 }">
                                    <span class="btn btn-warning btn-small"><spring:message code="label.ol-st-wait"/> </span>
                                </c:when>
                                <c:when test="${o.status == 2 }">
                                    <span class="btn btn-danger btn-small"><spring:message code="label.ol-st-cancel"/> </span>
                                </c:when>
                                <c:when test="${o.status == 3 }">
                                    <span class="btn btn-info btn-small"><spring:message code="label.ol-st-process"/></span>
                                </c:when>
                                <c:when test="${o.status == 4 }">
                                    <span class="btn btn-success btn-small"><spring:message code="label.ol-st-success"/></span>
                                </c:when>
                            </c:choose></td>
                            <td><c:choose>
                                <c:when test="${o.status == 1 }">
                                    <a type="submit" class="btn btn-success btn-small" href="Shopping.com/order/detail/${o.id}"><span class="icon-zoom-in"></span><spring:message code="label.oldetail"/></a>
                                    <a type="submit" class="btn btn-danger btn-small" href="Shopping.com/order/cancel-order/${o.id}"
                                       onclick="return confirm('Bạn chắc chắ muốn hủy đơn hàng ?')"><span class="icon-remove"></span><spring:message code="label.olcancel"/> </a>
                                </c:when>
                                <c:when test="${o.status == 2 }">
                                    <a type="submit" class="btn btn-primary btn-small"
                                       href="Shopping.com/order/detail/${o.id}"><span class="icon-zoom-in"></span><spring:message code="label.oldetail"/></a>
                                </c:when>
                                <c:when test="${o.status == 3 }">
                                    <a type="submit" class="btn btn-primary btn-small" href="Shopping.com/order/detail/${o.id}"><spring:message code="label.oldetail"/></a>
                                </c:when>
                                <c:otherwise>
                                    <a type="submit" class="btn btn-primary btn-small" href="Shopping.com/order/detail/${o.id}"><spring:message code="label.oldetail"/></a>
                                </c:otherwise>
                            </c:choose></td>
                        </tr>
                    </c:forEach>
                    </c:if>
                    </tbody>
                </table>
                </div>
                <br>
                <div class="col-md-7" id="content-ept">
                <c:if test="${empty order}">
                    <h3><spring:message code="label.olnotfound"/></h3>
                    <br>
                    <a href="Shopping.com/user/product"><input class="btn btn-primary"  type="submit" value="<spring:message code="label.olbackhome"/>"></a>
                </c:if>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"/>
<script type="text/javascript">
    $(document).ready(function() {
        $('#order').DataTable();
    } );
</script>
</body>
</html>