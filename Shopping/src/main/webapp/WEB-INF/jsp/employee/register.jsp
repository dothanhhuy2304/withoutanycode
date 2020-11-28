<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 10/20/2020
  Time: 8:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <base href="${pageContext.servletContext.contextPath }/" />
    <meta charset="utf-8">
    <title>Website Bán Hàng Online</title>
    <link href="project/themes/assets/jquery-ui/jquery-ui.min.css" rel="stylesheet" />
    <style>
        #c{
            height: 5em;
        }
        .controls{
            height: 3em;
        }
    </style>
</head>
<body>
<jsp:include page="header.jsp"/>
<jsp:include page="menu.jsp"/>
<div id="mainBody">
    <div class="container">
        <div class="row">
            <!--  -->
            <div class="span9">
                <ul class="breadcrumb">
                    <li><a href="Shopping.com/employee/home">Home</a>
                        <span class="divider">/</span>
                    </li>
                    <li class="active">Registration</li>
                </ul>
                <h3>Registration</h3>
                <h4 style="color: red;">${status_note_login}</h4>
                <form:form action="Shopping.com/employee/saveEmployee" method="post" modelAttribute="employee" class="form-horizontal"
                           enctype="multipart/form-data" role="form" id="register">
                    <h4>Your personal information ${message}  </h4>
                    ${error}

                    <div class="control-group">
                        <label class="control-label">User Name:
                            <sup style="color: red">*</sup>
                        </label>
                        <div class="controls">
                            <input name="username" id="id" placeholder="User Name" class="form-control" />

                        </div>
                        <form:errors path="username" cssClass="text-danger"/>
                    </div>
                    <div class="control-group">
                        <label class="control-label">Email Address:
                            <sup style="color: red">*</sup></label>
                        <div class="controls">
                            <form:input path="email" id="email" placeholder="Email" class="form-control" />
                        </div>
                        <form:errors path="email" cssClass="text-danger"/>
                    </div>
                    <div class="control-group">
                        <label class="control-label">Full Name:
                            <sup style="color: red">*</sup></label>
                        <div class="controls">
                            <form:input path="nameEmployee" id="nameEmployee" placeholder="Full Name" cssClass="form-control" />
                        </div>
                        <form:errors path="nameEmployee" cssClass="text-danger"/>
                    </div>
                    <div class="control-group">
                        <label class="control-label">Password:
                            <sup style="color: red">*</sup></label>
                        <div class="controls">
                            <form:password path="password" id="password" placeholder="Password" cssClass="form-control" />
                        </div>
                        <form:errors path="password" cssClass="text-danger"/>
                    </div>
                    <div class="control-group">
                        <label class="control-label">Birthday:
                            <sup style="color: red">*</sup>
                        </label>
                        <div class="controls">
                            <form:input path="birthday" id="birthday" placeholder="dd/MM/yyyy" cssClass="form-control" />
                            <form:errors path="birthday" cssClass="text-danger"/>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">Number Phone:
                            <sup style="color: red">*</sup>
                        </label>
                        <div class="controls">
                            <form:input path="numberPhone"  id="numberPhone" placeholder="Number Phone" cssClass="form-control" />
                        </div>
                        <form:errors path="numberPhone" cssClass="text-danger"/>
                    </div>
                    <div class="control-group">
                        <label class="control-label">Gender:
                            <sup style="color: red">*</sup></label>
                        <div class="controls">
                            <form:select path="gender" id="gender" cssClass="form-control">
                                <option value="">--Lựa Chọn--</option>
                                <option value="1">Nam</option>
                                <option value="2">Nữ</option>
                            </form:select>
                        </div>
                        <form:errors path="gender" cssClass="text-danger"/>
                    </div>
                    <div class="control-group">
                        <label class="control-label">Address:
                            <sup style="color: red">*</sup></label>
                        <div class="controls">
                            <form:select path="address" id="address" cssClass="form-control">
                                <option value="">-- Select --</option>
                                <option value="TP Ha Noi">TP. Hà Nội</option>
                                <option value="TP Ho Chi Minh">TP. HCM</option>
                                <option value="Bac Giang">Bắc Giang</option>
                                <option value="Ban Kan">Bắc Kạn</option>
                                <option value="Bac Lieu">Bạc Liêu</option>
                                <option value="Bac Ninh">Bắc Ninh</option>
                                <option value="Cao Bang">Cao Bằng</option>
                                <option value="Dak Lak">Đắk Lắk</option>
                                <option value="Dak Nong">Đắk Nông</option>
                                <option value="Ben Tre">Bến Tre</option>
                                <option value="Binh Dinh">Bình Định</option>
                                <option value="Binh Duong">Bình Dương</option>
                                <option value="Binh Phuoc">Bình Phước</option>
                                <option value="Binh Thuan">Bình Thuận</option>
                                <option value="Ca Mau">Cà Mau</option>
                                <option value="Dien Bien">Điện Biên</option>
                                <option value="Dong Nai">Đồng Nai</option>
                                <option value="Dong Thap">Đồng Tháp</option>
                                <option value="Gia Lai">Gia Lai</option>
                                <option value="TP Can Tho">TP. Cần Thơ</option>
                                <option value="TP Da Nang">TP. Đà Nẵng</option>
                                <option value="TP Hai Phong">TP. Hải Phòng</option>
                                <option value="Ha Giang">Hà Giang</option>
                                <option value="Ha Nam">Hà Nam</option>
                                <option value="Ha Tinh">Hà Tĩnh</option>
                                <option value="Hai Duong">Hải Dương</option>
                                <option value="Hau Giang">Hậu Giang</option>
                                <option value="Hoa Binh">Hòa Bình</option>
                                <option value="Hung Yen">Hưng Yên</option>
                                <option value="Khanh Hoa">Khánh Hòa</option>
                                <option value="Kien Giang">Kiên Giang</option>
                                <option value="Kon Tum">Kon Tum</option>
                                <option value="Lai Chau">Lai Châu</option>
                                <option value="Lam Dong">Lâm Đồng</option>
                                <option value="Lang Son">Lạng Sơn</option>
                                <option value="Lao Cai">Lào Cai</option>
                                <option value="Long An">Long An</option>
                                <option value="Nam Dinh">Nam Định</option>
                                <option value="Nghe An">Nghệ An</option>
                                <option value="Ninh Binh">Ninh Bình</option>
                                <option value="Ninh Thuan">Ninh Thuận</option>
                                <option value="Phu Tho">Phú Thọ</option>
                                <option value="Quang Binh">Quảng Bình</option>
                                <option value="Quang Nam">Quảng Nam</option>
                                <option value="Quang Ngai">Quảng Ngãi</option>
                                <option value="Quang Ninh">Quảng Ninh</option>
                                <option value="Quang Tri">Quảng Trị</option>
                                <option value="Soc Trang">Sóc Trăng</option>
                                <option value="Son La">Sơn La</option>
                                <option value="Tay Ninh">Tây Ninh</option>
                                <option value="Thai Binh">Thái Bình</option>
                                <option value="Thai Nguyen">Thái Nguyên</option>
                                <option value="Thanh Hoa">Thanh Hóa</option>
                                <option value="Thua Thien Hue">Thừa Thiên Huế</option>
                                <option value="Tien Giang">Tiền Giang</option>
                                <option value="Tra Vinh">Trà Vinh</option>
                                <option value="An Giang">An Giang</option>
                                <option value="Ba Ria - Vung Tau">Bà Rịa - Vũng Tàu</option>
                                <option value="Tuyen Quang">Tuyên Quang</option>
                                <option value="Vinh Long">Vĩnh Long</option>
                                <option value="Vinh Phuc">Vĩnh Phúc</option>
                                <option value="Yen Bai">Yên Bái</option>
                                <option value="Phu Yen">Phú Yên</option>
                            </form:select>
                        </div>
                        <form:errors path="address" cssClass="text-danger"/>
                    </div>
                <div class="control-group">
                    <label class="control-label">Phòng ban:
                        <sup style="color: red">*</sup></label>
                    <div class="controls">
<%--                        <form:select path="department" id="department" cssClass="form-control">--%>
<%--                            <option value="">-- Select --</option>--%>
<%--                            <option value="PB1">Phòng IT</option>--%>
<%--                            <option value="PB2">Phòng Kế Toán</option>--%>
<%--                            <option value="PB3">Phòng Nhân Sự</option>--%>
<%--                            <option value="PB4">Phòng Marketting</option>--%>
<%--                        </form:select>--%>
                        <form:select path="department.id" id="department" items="${department}" itemValue="id" itemLabel="nameDepartment"
                                     class="form-control form-control-line" />
                    </div>
                    <form:errors path="department" cssClass="text-danger"/>
                </div>
                <div class="control-group">
                    <label class="control-label">Nhân viên loại: <sup
                            style="color: red">*</sup></label>
                    <div class="controls">
                        <form:select path="employeeType" id="employeeType" cssClass="form-control">
                            <option value="">-- Select --</option>
                            <option value="LNV1">Full Time</option>
                            <option value="LNV2">Part Time</option>
                        </form:select>
                    </div>
                    <form:errors path="employeeType" cssClass="text-danger"/>

                    <label class="control-label">Photo:</label>
                    <div class="controls" id="c">
                        <input id="file_image" name="file_image" type="file" class="form-control" />
                        <br>
                    </div>
                    <form:errors path="photo" cssClass="text-danger"/>

                <input type="hidden" name="activated" value="True">
                <input type="hidden" name="access" value="1">
                    <div class="control-group">
                        <div class="controls">
                            <input class="btn btn-large btn-success" type="submit"
                                   value="Register" >
                        </div>
                    </div>
            </div>
            </form:form>
        </div>
        <!--  -->
    </div>
</div>
</div>
<jsp:include page="footer.jsp"/>
</body>
<script src="project/themes/js/jquery-1.7.1.min.js"></script>
<script src="project/themes/js/jquery.validate.min.js"></script>
<script src="project/themes/assets/jquery-ui/jquery-ui.min.js"></script>
<script>
    $(function() {
        $(".birthday").datepicker({
            dateFormat : 'dd/mm/yy'
        });
        $("input#birthday").datepicker({
            dateFormat : 'dd/mm/yy'
        });
    });
</script>

<script type="text/javascript">
    $(function() {
        $("#register").validate({
            rules : {
                id : {
                    required : true
                },
                nameEmployee : {
                    required : true
                },
                email : {
                    email : true,
                    required : true
                },
                password : {
                    required : true,
                    minlength : 6
                },
                address : {
                    required : true
                },
                gender : {
                    required : true
                },
                numberPhone : {
                    required : true
                },
                birthday : {
                    required : true
                },
                department :{
                    required : true
                },
                employeeType :{
                    required : true
                },
                file_image : {
                    required : true
                }
            },
            messages : {
                id : {
                    required : 'Vui lòng nhập tên đăng nhập !'
                },
                nameEmployee : {
                    required : 'Vui lòng nhập tên đầy đủ !'
                },
                email : {
                    email : 'Vui lòng nhập đúng địa chỉ email !',
                    required : 'Vui lòng nhập địa chỉ email !'
                },
                password : {
                    required : 'Vui lòng nhập mật khẩu',
                    minlength : 'Mật khẩu phải lớn hơn 6 ký tự !'
                },
                address : {
                    required : 'Vui lòng chọn đia chỉ !'
                },
                gender : {
                    required : 'Vui lòng chọn giới tính !'
                },
                numberPhone : {
                    required : 'Vui lòng nhập số điện thoại !'
                },
                birthday : {
                    required : 'Vui lòng nhập ngày tháng năm sinh !'
                },
                department : {
                  required : 'Vui lòng xác nhập phòng ban !'
                },
                employeeType : {
                    required : 'Vui lòng xác nhập loại nhân viên !'
                },
                file_image : {
                    required : 'Vui lòng chọn ảnh !'
                }

            }
        });
    });
</script>

</html>