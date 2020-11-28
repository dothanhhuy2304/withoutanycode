<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 10/16/2020
  Time: 2:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <base href="${pageContext.servletContext.contextPath }/" />
    <meta charset="utf-8">
    <title><spring:message code="label.title"/> </title>
    <link href="project/themes/assets/jquery-ui/jquery-ui.min.css" rel="stylesheet" />
    <style>
        #c{
            height: 5em;
        }
        .controls{
            height: 3em;
        }
        #id{
            height: 1.7em;
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
                    <li><a href="Shopping.com/user/product"><spring:message code="label.home"/></a> <span class="divider">/</span></li>
                    <li class="active"><spring:message code="label.rslogan"/></li>
                </ul>
                <h3>Registration</h3>
                <h4 style="color: red;">${status_note_login}</h4>
                <h1 style="color: green;">${status_message}</h1>
                    <form:form action="Shopping.com/user/saveCustomer" method="post"
                               modelAttribute="customer" class="form-horizontal"
                               enctype="multipart/form-data" role="form" id="register">
                        <h4><spring:message code="label.rinfo"/> ${message}  </h4>

                        <div class="control-group">
                            <label class="control-label"><spring:message code="label.rfullname"/> <sup
                                    style="color: red">*</sup>
                            </label>
                            <div class="controls">
                                <form:input path="fullName" id="fullName" placeholder="Full Name" class="form-control" />
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label"><spring:message code="label.rusername"/> <sup
                                    style="color: red">*</sup></label>
                            <div class="controls">
                                <input name="id" id="id" placeholder="Username" class="form-control" />
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label"><spring:message code="label.rpassword"/><sup
                                    style="color: red">*</sup></label>
                            <div class="controls">
                                <form:password path="password" id="password" placeholder="Password" cssClass="form-control" />
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label"><spring:message code="label.remail"/> <sup
                                    style="color: red">*</sup></label>
                            <div class="controls">
                                <form:input path="email" id="email" placeholder="Email Address" cssClass="form-control" />
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label"><spring:message code="label.rbirthday"/> <sup
                                    style="color: red">*</sup>
                            </label>
                            <div class="controls">
                                <form:input path="birthday" id="birthday" placeholder="dd/MM/yyyy" cssClass="form-control" />
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label"><spring:message code="label.rnumber"/><sup
                                    style="color: red">*</sup>
                            </label>
                            <div class="controls">
                                <form:input path="numberPhone" id="numberPhone" placeholder="Number Phone" cssClass="form-control" />
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label"><spring:message code="label.rgender"/> <sup
                                    style="color: red">*</sup></label>
                            <div class="controls">
                                <form:select path="gender" cssClass="form-control">
                                    <option value=""><spring:message code="label.rselect1"/></option>
                                    <option value="1"><spring:message code="label.rselect2"/></option>
                                    <option value="2"><spring:message code="label.rselect3"/></option>
                                </form:select>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label"><spring:message code="label.raddress"/> <sup
                                    style="color: red">*</sup></label>
                            <div class="controls">
                                <form:select path="address" cssClass="form-control">
                                    <option value=""><spring:message code="label.rselect1"/></option>
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
                        </div>
                            <label class="control-label"><spring:message code="label.rphoto"/></label>
                            <div class="controls" id="c">
                                <input id="photo" name="file_image" type="file"
                                       class="form-control" />
                        </div>
                        <div class="control-group">
                            <div class="controls">
                                <input class="btn btn-large btn-success" type="submit"
                                       value="<spring:message code="label.rsubmit"/>" >
                            </div>
                        </div>
                        <input type="hidden" name="activated" value="True">
                        <form:hidden path="access" />
                    </form:form>
                </div>

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
                fullName : {
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
                file_image : {
                    required : true
                }
            },
            messages : {
                id : {
                    required : '<spring:message code="message.ruser"/>'
                },
                fullName : {
                    required : '<spring:message code="message.rfullname"/>'
                },
                email : {
                    email : '<spring:message code="message.remail"/>',
                    required : '<spring:message code="message.remail1"/>'
                },
                password : {
                    required : '<spring:message code="message.rpassword"/>',
                    minlength : '<spring:message code="message.rpassword1"/>
                },
                address : {
                    required : '<spring:message code="message.raddress"/>'
                },
                gender : {
                    required : '<spring:message code="message.rgender"/>'
                },
                numberPhone : {
                    required : '<spring:message code="message.rnumberphone"/>'
                },
                birthday : {
                    required : '<spring:message code="message.rbirthday"/>'
                },
                file_image : {
                    required : '<spring:message code="message.rimage"/>'
                }
            }
        });
    });
</script>
</html>