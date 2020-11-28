<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 10/31/2020
  Time: 7:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <base href="${pageContext.servletContext.contextPath }/">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Thống Kê Doanh Thu</title>
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
                        Thống Kê Doanh Thu
                    </h3>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="Shopping.com/admin/home">
                            Trang Chủ</a></li>
                        <li class="breadcrumb-item active">
                            Thống Kê Doanh Thu
                        </li>
                    </ol>
                </div>
            </div>
            <!-- End Bread crumb and right sidebar toggle -->
            <div class="row">
                <!-- column -->
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-block">
                            <h4 class="card-title">
                                Danh Sách Thống Kê
                            </h4>
                            <h6 class="card-subtitle">
                                Ở đây bạn có thể thực hiện các chức năng !
                            </h6>
                            <!-- Tìm Kiếm -->
                            <form:form method="post">
                                <div class="row">
                                    <div class="col-md-2">
                                        <input type="text" name="min" placeholder="Min Date yyyy/MM/dd" id="min"
                                               class="datepicker form-control form-control-line"
                                               value="${param.min }" />
                                    </div>
                                    <div class="col-md-2">
                                        <input type="text" name="max" placeholder="Max Date yyyy/MM/dd" id="max"
                                               class="datepicker form-control form-control-line"
                                               value="${param.max }" />
                                    </div>
                                    <div class="col-md-2">
                                        <button type="submit" class="btn btn-danger">
                                            Lọc
                                        </button>
                                    </div>
                                    <!--Dropdown-->
                                    <div class="dropdown">
                                        <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            Lọc Doanh Thu Theo
                                        </button>
                                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                            <a class="dropdown-item" href="Shopping.com/admin/revenue/by-category.htm">Doanh thu theo danh muc</a>
                                            <a class="dropdown-item" href="Shopping.com/admin/revenue/by-producer.htm">Doanh thu theo nhà sản xuất</a>
                                            <a class="dropdown-item" href="Shopping.com/admin/revenue/by-customer.htm">Doanh thu theo khách hàng</a>
                                            <a class="dropdown-item" href="Shopping.com/admin/revenue/by-product.htm">Doanh thu theo sản phẩm</a>
                                            <a class="dropdown-item" href="Shopping.com/admin/revenue/by-today.htm">Doanh thu theo ngày</a>
                                            <a class="dropdown-item" href="Shopping.com/admin/revenue/by-month.htm">Doanh thu theo tháng</a>
                                            <a class="dropdown-item" href="Shopping.com/admin/revenue/by-year.htm">Doanh thu theo năm</a>
                                            <a class="dropdown-item" href="Shopping.com/admin/revenue/by-quarter.htm">Doanh thu theo quý</a>
                                        </div>
                                    </div>
                                </div>
                            </form:form>
                            <br>
                            <!-- Show -->
                            <div class="content table-responsive table-full-width">
                                <table class="table table-striped">
                                    <thead>
                                    <tr>
                                        <th>Nhóm/Loại</th>
                                        <th>Số Lượng</th>
                                        <th>Doanh Thu</th>
                                        <th>Giá Thấp Nhất</th>
                                        <th>Giá Cao Nhất</th>
                                        <th>Giá Trung Bình</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="arr" items="${arrays}">
                                        <tr>
                                            <td>${arr[0]}</td>
                                            <td>${arr[1]}</td>
                                            <td>
                                                <fmt:formatNumber value="${arr[2]}" type="currency" pattern="000,000" /> VNĐ</td>
                                            <td>
                                                <fmt:formatNumber value="${arr[3]}" type="currency" pattern="000,000" /> VNĐ</td>
                                            <td>
                                                <fmt:formatNumber value="${arr[4]}" type="currency" pattern="000,000" /> VNĐ</td>
                                            <td>
                                                <fmt:formatNumber value="${arr[5]}" type="currency" pattern="000,000" /> VNĐ</td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <!--  -->
                        </div>
                    </div>
                </div>
            </div>

            <!-- End PAge Content -->
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-block">
                            <h4 class="card-title">
                                Biểu Đồ
                            </h4>
                            <%-- https://www.google.com/jsapi" --%>
                            <script type="text/javascript" src="project/themes/google-api/loader.js"></script>
                            <script type="text/javascript">
                                google.load("visualization", "1", {packages:["corechart"]});
                                google.setOnLoadCallback(drawChart);
                                function drawChart() {
                                    var data = google.visualization.arrayToDataTable([
                                        ['Doanh Số Của Từng Loại', 'Doanh Số Của Từng Loại'],
                                        <c:forEach var="arr" items="${arrays}">
                                        ["${arr[0]}", ${arr[2]}],
                                        </c:forEach>
                                    ]);

                                    var options = {
                                        title: 'Doanh Số Của Từng Loại',
                                        is3D: true,
                                    };

                                    var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
                                    chart.draw(data, options);
                                }
                            </script>
                            <div id="piechart_3d" style="width: 900px; height: 500px;"></div>
                        </div>
                        <!--  -->
                    </div>
                </div>
            </div>
            <!--  -->
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
        $(".min").datepicker({
            dateFormat : 'dd/mm/yy'
        });
        $("input#min").datepicker({
            dateFormat : 'dd/mm/yy'
        });
    });

    $(function() {
        $(".max").datepicker({
            dateFormat : 'dd/MM/yy'
        });
        $("input#max").datepicker({
            dateFormat : 'dd/MM/yy'
        });
    });
</script>
</html>