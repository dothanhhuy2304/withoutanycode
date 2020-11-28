<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 11/11/2020
  Time: 9:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page import="java.util.Date" %>
<html>
<head>
    <base href="${pageContext.servletContext.contextPath }/">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Danh Sách Hợp Đồng</title>
</head>
<body>
<div id="main-wrapper">
    <jsp:include page="header.jsp"/>
    <jsp:include page="menu.jsp"/>
    <div class="page-wrapper">
        <div class="content">
            <div class="container-fluid">
                <div class="row page-titles">
                    <div class="col-md-5 col-8 align-self-center">
                        <h3 class="text-themecolor m-b-0 m-t-0">
                            Trang chủ
                        </h3>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="Shopping.com/admin/home">
                                Trang chủ </a></li>
                            <li class="breadcrumb-item active">
                                Thay đổi thông tin
                        </ol>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <br>
                            <div style="clear: both; width: 98%; margin: 10px auto;" class="">
                                <!-- Tìm Kiếm -->
                                <form action="Shopping.com/admin/contract/search.htm" method="post">
                                    <div class="row">
                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <input type="text" name="key"
                                                       placeholder="Tìm kiếm Mã, Tên NV, Lương"
                                                       class="form-control border-input"/>
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <select name="id" class="form-control border-input">
                                                    <option selected="selected" value="">
                                                        --Phòng Ban--
                                                        <c:forEach var="department" items="${department}">
                                                    <option value="${department.id}">${department.nameDepartment}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <button type="submit" class="btn btn-danger btn-fill">
                                                    Tìm Kiếm
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                                <div>
                                    <a type="button" href="Shopping.com/admin/contract/add-contract.htm" class="btn btn-success btn-fill pull-right">Thêm</a>
                                </div>

                                <!-- Lọc -->
                                <form:form action="Shopping.com/admin/contract/filter.htm" method="post">
                                    <div class="row">
                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <select name="filter" class="form-control border-input">
                                                    <option selected="selected" value="0">Trạng Thái</option>
                                                    <option value="1">Còn Hạn</option>
                                                    <option value="2">Hết Hạn</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <button type="submit" class="btn btn-warning btn-fill">
                                                    Tìm kiếm
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </form:form>
                            </div>

                            <!-- Show -->
                            <div class="content table-responsive table-full-width">
                                <table class="table table-striped">
                                    <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Tên nhân viên</th>
                                        <th>Tên hợp đồng</th>
                                        <th>Bắt đầu</th>
                                        <th>Kết Thúc</th>
                                        <th>Trợ Cấp</th>
                                        <th>Lương</th>
                                        <th>Total</th>
                                        <th>Trạng thái</th>
                                        <th>Chức năng</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${contractList}"  varStatus="iterStat" var="contract">
                                        <tr>
                                            <td>${iterStat.count}</td>
                                            <td>${contract.employee.nameEmployee }</td>
                                            <td>${contract.nameContract }</td>
                                            <td><fmt:formatDate value="${contract.startTime}" pattern="dd/MM/yyyy"/>
                                            <td><fmt:formatDate value="${contract.endTime}" pattern="dd/MM/yyyy"/>
                                            <td><fmt:formatNumber type="currency" value="${contract.subsidize }" pattern="###,###,###"/>VNĐ
                                            </td>
                                            <td><fmt:formatNumber type="currency" value="${contract.salary}" pattern="###,###,###"/>VNĐ
                                            </td>
                                            <td><fmt:formatNumber type="currency" value="${contract.salary +contract.subsidize}" pattern="###,###,###"/>VNĐ
                                            </td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${contract.status >= 2}">
                                                        <a href="Shopping.com/admin/contract/reset-status/${contract.employee.id }.htm"
                                                           type="submit" class="btn btn-info btn-fill btn-sm">
                                                            Gia Hạn
                                                        </a>
                                                    </c:when>

                                                    <c:when test="${contract.status < 2 }">
                                                        <a href="Shopping.com/admin/contract/end-contract/${contract.employee.id }.htm"
                                                                type="submit" class="btn btn-danger btn-fill btn-sm">
                                                            Kết Thúc
                                                        </a>
                                                    </c:when>
                                                </c:choose></td>
                                            <td>
                                                <a href="Shopping.com/admin/contract/edit-contract/${contract.employee.id}.htm" type="button" class="btn btn-danger btn-xs">
                                                    Edit</a>
                                                <a href="Shopping.com/admin/contract/delete-contract/${contract.employee.id}.htm" type="button"
                                                   onclick="return confirm('Bạn chắc chắn chứ ?')" class="btn btn-success btn-xs">Delete </a></td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                                <!-- Phân Trang -->
                                <div class="pagination">
                                    <!--Pagination  -->
                                    <c:if test="${contractList.size() > 0 }">
                                        <div class="panel-footer">
                                            Showing ${number} of ${size} of ${totalElements}
                                            <ul class="pagination">
                                                <c:forEach begin="0" end="${totalPages-1}" var="page">
                                                    <li class="page-item">
                                                        <a href="${pageContext.response.getHeader("list")}?page=${page}&size=${size}"
                                                           class="page-link">${page+1}</a>
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
    </div>
</div>
</body>
</html>