<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 10/25/2020
  Time: 8:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <base href="${pageContext.servletContext.contextPath }/">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Thông Tin Đơn Hàng</title>
</head>
<body>
<div id="main-wrapper">
    <jsp:include page="header.jsp"/>
    <jsp:include page="menu.jsp"/>
    <div class="page-wrapper">
        <!-- Container fluid  -->
        <div class="container-fluid">
            <!-- Bread crumb and right sidebar toggle -->
            <div class="row page-titles">
                <div class="col-md-5 col-8 align-self-center">
                    <h3 class="text-themecolor m-b-0 m-t-0">
                        Thông Tin Đơn Hàng
                    </h3>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="Shopping.com/employee/home">
                            Trang Chủ
                        </a></li>
                        <li class="breadcrumb-item active">
                            Chỉnh Sửa Thông Tin</li>
                    </ol>
                </div>
            </div>
            <!-- End Bread crumb and right sidebar toggle -->
            <!-- Start Page Content -->
            <div class="row">
                <!-- column -->
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-block">
                            <h4 class="card-title">
                             Chỉnh Sửa Đơn Hàng
                            </h4>
                            <div class="pull left">
                                <span class="red">${error}</span>
                                <span style="color: red">${message}</span>
                            </div>
                            <br>
                            <form:form action="Shopping.com/employee/order/saveEditOrder"
                                       method="POST" modelAttribute="order" role="form" id="detail">
                                <div class="row">
                                    <div class="col-md-4">
                                        <label>Người Nhận Hàng:
                                            (<span style="color: red;">*</span>)
                                            <form:errors path="receiver" /></label>
                                        <form:input path="receiver" id="receiver"
                                                    placeholder="Tên người nhận" size="30" maxlength="30"
                                                    class="form-control form-control-line" />
                                    </div>
                                    <div class="col-md-4">
                                        <label>Địa Chỉ:
                                            (<span style="color: red;">*</span>)
                                            <form:errors path="address" /></label>
                                        <form:input path="address" id="address" placeholder="Địa chỉ" size="30" maxlength="30"
                                                    class="form-control form-control-line" />
                                    </div>
                                    <div class="col-md-4">
                                        <label>Số Điện Thoại:
                                            (<span style="color: red;">*</span>)
                                            <form:errors path="numberPhone" /></label>
                                        <form:input path="numberPhone" id="numberPhone" placeholder="Số điện thoại" size="30" maxlength="30"
                                                    class="form-control form-control-line" />
                                    </div>
                                </div>
                                <br>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label>
                                            Ngày Giao Hàng:
                                            (<span style="color: red;">*</span>)
                                            <form:errors path="requireDate" /></label>
                                        <form:input path="requireDate" id="requireDate" placeholder="dd/MM/yyyy" size="30" maxlength="30"
                                                    class="form-control form-control-line" />
                                    </div>
                                    <div class="col-md-6">
                                        <label><i class="fa fa-calendar bigger-110"> </i>
                                            Mô Tả: (<span
                                                style="color: red;">*</span>)
                                            <form:errors path="description" /></label>
                                        <form:input path="description" id="description" placeholder="Mô tả" size="30" maxlength="30"
                                                    class="form-control form-control-line" />
                                    </div>
                                </div>
                                <br>
                                <br>
                                <div style="text-align: center;">
                                    <button class="btn btn-danger">
                                        Sửa Đơn Hàng
                                    </button>
                                </div>
                                <br>
                                <form:hidden path="customer.id" />
                                <form:hidden path="status" />
                                <form:hidden path="amount" />
                                <form:hidden path="id" />
                                <form:hidden path="orderDate" />
                            </form:form>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End PAge Content -->
        </div>
        <!-- End Container fluid  -->
        <!-- footer -->
        <jsp:include page="footer.jsp"/>
    </div>
</div>
</body>
<script src="project/themes/js/jquery-1.7.1.min.js"></script>
<script src="project/themes/js/jquery.validate.min.js"></script>
<script src="project/themes/assets/jquery-ui/jquery-ui.min.js"></script>
<script>
    $(function() {
        $(".requireDate").datepicker({
            dateFormat : 'dd/mm/yy'
        });
        $("input#requireDate").datepicker({
            dateFormat : 'dd/mm/yy'
        });
    });
</script>
<script type="text/javascript">
    $(function() {
        $("#detail").validate({
            rules : {
                receiver : {
                    required : true
                },
                address : {
                    required : true
                },
                requireDate : {
                    required : true
                },
                numberPhone : {
                    required : true
                }
            },
            messages : {
                receiver : {
                    required : 'Vui lòng nhập tên người nhận !'
                },
                address : {
                    required : 'Vui lòng nhập địa chỉ !'
                },
                requireDate : {
                    required : 'Vui lòng nhập ngày nhận hàng !'
                },
                numberPhone : {
                    required : 'Vui lòng số điện thoại !'
                }

            }
        });
    });
</script>
</html>