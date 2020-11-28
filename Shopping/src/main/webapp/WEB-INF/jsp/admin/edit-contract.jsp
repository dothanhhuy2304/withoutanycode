<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 11/12/2020
  Time: 2:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <base href="${pageContext.servletContext.contextPath }/">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Thêm Hợp Đồng</title>
</head>
<body>
<jsp:include page="header.jsp"/>
<jsp:include page="menu.jsp"/>
<div id="main-wrapper">
    <div class="page-wrapper">
        <div class="container-fluid">
            <div class="row page-titles">
                <div class="col-md-5 col-8 align-self-center">
                    <h3 class="text-themecolor m-b-0 m-t-0">
                        Trang chủ
                    </h3>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="Shopping.com/employee/home">
                            Trang chủ </a></li>
                        <li class="breadcrumb-item active">
                            Thay đổi thông tin
                    </ol>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-block">
                            <h4 class="card-title">
                                Thêm Hợp Đồng
                            </h4>
                        </div>
                        <div class="content">
                            <%--                            <div class="row">--%>
                            <%--                                <div class="col-md-6">--%>
                            <%--                                    <div class="form-group">--%>
                            <%--                                        <label>Tìm kiếm phòng ban:--%>
                            <%--                                            (<span style="color: red;">*</span>) </label>--%>
                            <%--                                        <form action="Shopping.com/admin/contract/search-contract.htm">--%>
                            <%--                                            <select name="id" class="form-control border-input">--%>
                            <%--                                                <option selected="selected" value="">--%>
                            <%--                                                    Department--%>
                            <%--                                                    <c:forEach var="contract" items="${department}">--%>
                            <%--                                                <option value="${contract.id}">${contract.nameDepartment}</option>--%>
                            <%--                                                </c:forEach>--%>
                            <%--                                            </select>--%>
                            <%--                                            <br>--%>
                            <%--                                            <button type="submit"--%>
                            <%--                                                    class="btn btn-success btn-fill btn-wd"--%>
                            <%--                                                    style="text-align: right;">--%>
                            <%--                                                Tìm Kiếm--%>
                            <%--                                            </button>--%>
                            <%--                                        </form>--%>
                            <%--                                    </div>--%>
                            <%--                                </div>--%>
                            <%--                            </div>--%>
                            <span style="color: green">${message}</span>
                            <br>
                            <form:form action="Shopping.com/admin/contract/save-edit-contract" method="POST"
                                       modelAttribute="contract">
                                <div class="col col-md-12">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Tên nhân viên: (<span
                                                        style="color: red;">*</span>) </label>
                                                <form:input readonly="true" path="employee.id" class="form-control border-input"/>
                                            </div>
                                        </div>

                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Tên Hợp Đồng:
                                                    (<span style="color: red;">*</span>)
                                                    <form:errors path="nameContract"/></label>
                                                <form:select path="nameContract" class="form-control border-input">
                                                    <option selected="selected" value="">Lựa chọn</option>
                                                    <form:option value="HD Khong Xac Dinh Thoi Han">
                                                        Hợp Đồng Không Xác Định Thời Hạn
                                                    </form:option>
                                                    <form:option value="HD Xac Dinh Thoi Han">
                                                        Hợp Đồng Xác Định Thời Hạn
                                                    </form:option>
                                                    <form:option value="HD Theo Mua Vu">
                                                        Hợp Đồng Theo Mùa Vụ
                                                    </form:option>
                                                </form:select>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>
                                                    Trợ Cấp:
                                                    (<span style="color: red;">*</span>)
                                                    <form:errors path="subsidize"/></label>
                                                <form:select path="subsidize" class="form-control border-input">
                                                    <option selected="selected" value="0">
                                                        Không Có Trợ Cấp
                                                    </option>
                                                    <form:option value="500000">
                                                        Tiền Ăn Trưa
                                                    </form:option>
                                                    <form:option value="300000">
                                                        Tiền Xăng Xe
                                                    </form:option>
                                                    <form:option value="100000">
                                                        Tền Điện THoại
                                                    </form:option>
                                                    <form:option value="900000">
                                                        Tất Cả Trợ Cấp
                                                    </form:option>
                                                </form:select>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <div class="form-group">
                                                    <label>
                                                        Ngày Bắt Đầu:
                                                    </label>
                                                    <form:input path="startTime" placeholder="dd/MM/yyyy..."
                                                                class="form-control border-input"/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <div class="form-group">
                                                    <label>
                                                        Ngày Kết Thúc:
                                                    </label>
                                                    <form:input path="endTime" placeholder="dd/MM/yyyy..."
                                                                class="form-control border-input"/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Lương:
                                                    (<span style="color: red;">*</span>)<form:errors
                                                            path="salary"/></label>
                                                <form:input type="number" path="salary"
                                                            placeholder="Nhập số tiền..." size="9" maxlength="9"
                                                            value="" class="form-control border-input"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div>
                                        <form:hidden path="id"/>
                                        <form:hidden path="status" value="1"/>
                                    </div>

                                    <br>
                                    <div class="text-center">
                                        <button type="submit" class="btn btn-danger btn-fill btn-wd">
                                            Thêm Hợp Đồng
                                        </button>
                                    </div>
                                    <div class="clearfix"></div>
                                    <br>
                                </div>
                            </form:form>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="footer.jsp"/>
</div>
</body>
</html>
