<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 10/17/2020
  Time: 9:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <base href="${pageContext.servletContext.contextPath }/"/>
    <meta charset="utf-8">
    <title><spring:message code="label.title"/></title>
    <link href="project/themes/assets/jquery-ui/jquery-ui.min.css" rel="stylesheet"/>
</head>
<body>
<jsp:include page="header.jsp"/>
<jsp:include page="menu.jsp"/>
<div id="mainBody">
    <div class="container">
        <div class="row">
            <div class="span9">
                <ul class="breadcrumb">
                    <li><a href="Shopping.com/user/product">Home</a> <span class="divider">/</span></li>
                    <li class="active"><spring:message code="label.coslogan"/></li>
                </ul>
                <h3><spring:message code="label.coslogan1"/></h3><br>

                <div class="well">
                    <h3><spring:message code="label.coslogan2"/></h3>
                    <label class="error">${message } </label>
                    <form:form id="order" role="form" modelAttribute="order"
                               class="form-horizontal" action="Shopping.com/order/purchase" method="post"
                               novalidate="novalidate">
                                <div class="control-group">
                                    <label class="control-label"><spring:message code="label.conameuser"/> </label>
                                    <div class="controls">
                                        <form:input path="customer.id" name="id" class="form-control valid" placeholder="Username" readonly="true"/>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label"><spring:message code="label.codate"/></label>
                                    <div class="controls">
                                        <form:input path="orderDate" name="orderDate" class="form-control error" placeholder="Order Date" readonly="true"/>
                                    </div>
                                </div>
                                <div
                                        class="control-group" type="hidden">
                                    <label class="control-label"><spring:message code="label.coqty"/></label>
                                    <div class="controls">
                                        <form:input path="amount" name="Amount" class="form-control error" placeholder="Amount" readonly="true"/>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label"><spring:message code="label.codaterequire"/> <sup
                                            style="color: red">*</sup></label>
                                    <div class="controls">
                                        <form:input path="requireDate" id="requireDate" name="requireDate" class="form-control error" placeholder="Require Date"/>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label"><spring:message code="label.coreceiver"/> <sup
                                            style="color: red">*</sup></label>
                                    <div class="controls">
                                        <form:input path="receiver" name="receiver" class="form-control error" placeholder="Receiver"/>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label"><spring:message code="label.conumberphone"/><sup
                                            style="color: red">*</sup></label>
                                    <div class="controls">
                                        <form:input path="numberPhone" name="numberPhone" class="form-control error" placeholder="Number Phone"/>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label"><spring:message code="label.coaddress"/><sup
                                            style="color: red">*</sup></label>
                                    <div class="controls">
                                        <form:input path="address" name="address" class="form-control error" placeholder="Address"/>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label"><spring:message code="label.codescription"/></label>
                                    <div class="controls">
                                        <form:textarea path="description" rows="5" name="description" class="form-control error" placeholder="Description"/>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <div class="controls">
                                        <input class="btn btn-large btn-danger" type="submit" value="<spring:message code="label.cosend"/>">

                                    </div>
                                </div>
                                <form:hidden path="status" value="1"/>
                    </form:form>
                    <hr class="soft">
                </div>

            </div>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"/>
</body>
<script src="project/themes/js/jquery-1.7.1.min.js"></script>
<script src="project/themes/js/jquery.validate.min.js"></script>
<script src="project/themes/assets/jquery-ui/jquery-ui.min.js"></script>

<script>
    $(function () {
        $(".requireDate").datepicker({
            dateFormat: 'dd/mm/yy'
        });
        $("input#requireDate").datepicker({
            dateFormat: 'dd/mm/yy'
        });
    });

    $(function () {
        $("a.remove-from-cart").click(function () {
            tr = $(this).parents("tr");
            dataUrl = $(this).attr("data-url");
            $.ajax({
                url: dataUrl,
                data: {},
                dataType: "json",
                success: function (response) {
                    $("span#cart-count").html(response.count + " items");
                    $("span#cart-amount").html(response.amount + " VNĐ");
                    tr.hide(500);
                }
            });
            return false;
        });
    });
</script>

<script type="text/javascript">
    $(function () {
        $("#order").validate({
            rules: {
                requireDate: {
                    required: true
                },
                receiver: {
                    required: true
                },
                address: {
                    required: true
                },
                numberPhone: {
                    required: true
                }
            },
            messages: {
                requireDate: {
                    required: 'Vui lòng nhập ngày nhận !'
                },
                receiver: {
                    required: 'Vui lòng nhập tên người nhận !'
                },
                address: {
                    required: 'Vui lòng nhập địa chỉ của bạn !'
                },
                numberPhone: {
                    required: 'Vui lòng nhập số điện thoại của bạn !'
                }
            }
        });
    });
</script>
</html>