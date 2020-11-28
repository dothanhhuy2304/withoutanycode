<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 10/23/2020
  Time: 5:04 PM
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
                    <li><a href="Shopping.com/employee/home">Home</a> <span class="divider">/</span></li>
                    <li class="active">Add Edit Producer</li>
                </ul>
                <h3>Add Edit Producer</h3>
                <h4 style="color: red;">${message}</h4>
                <form:form action="Shopping.com/employee/producer/saveProducer" method="post"
                           modelAttribute="producer" class="form-horizontal"
                           enctype="multipart/form-data" role="form" id="producer">
                <h4>Fill in information ${message}  </h4>
                    ${error}

                <div class="control-group">
                    <label class="control-label">Name Producer: <sup
                            style="color: red">*</sup>
                    </label>
                    <div class="controls">
                        <form:input path="nameProducer" id="nameProducer" placeholder="Name Producer" class="form-control"/>
                    </div>
                    <form:errors path="nameProducer" cssClass="text-danger"/>
                </div>

                <div class="control-group">
                    <label class="control-label">Email: <sup
                            style="color: red">*</sup>
                    </label>
                    <div class="controls">
                        <form:input path="email" id="email" type="email" placeholder="Enter email" cssClass="form-control" />
                        <form:errors path="email" cssClass="text-danger"/>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label">Address: <sup
                            style="color: red">*</sup></label>
                    <div class="controls">
                        <form:input path="address" id="address" placeholder="Full Name" cssClass="form-control" />
                    </div>
                    <form:errors path="address" cssClass="text-danger"/>
                </div>

                <div class="control-group">
                    <label class="control-label">Number Phone: <sup
                            style="color: red">*</sup>
                    </label>
                    <div class="controls">
                        <form:input path="numberPhone"  id="numberPhone" placeholder="Number Phone" cssClass="form-control" />
                    </div>
                    <form:errors path="numberPhone" cssClass="text-danger"/>
                </div>



                <div class="control-group">
                    <label class="control-label">Avatar: <sup
                            style="color: red">*</sup>
                    </label>
                    <div class="controls">
                        <input name="file_image" type="file"  id="file_image" placeholder="Number Phone" class="form-control" />
                    </div>
                </div>


                <div class="control-group">
                    <div class="controls">
                        <input class="btn btn-large btn-success" type="submit"
                               value="Register" >
                    </div>
                </div>
            </div>
                    <form:hidden path="id" id="id"/>
            </form:form>
        </div>
        <!--  -->
    </div>
</div>
</div>
<jsp:include page="footer.jsp"/>
</body>
<script src="project/themes/assets/jquery-ui/jquery-ui.min.js"></script>
<script src="project/themes/js/jquery-1.7.1.min.js"></script>
<script src="project/themes/js/jquery.validate.min.js"></script>
<script type="text/javascript">
    $(function () {
        $("#producer").validate({
            rules : {
                nameProducer : {
                    required:  true
                },
                email : {
                    required : true
                },
                address : {
                    required : true
                },
                numberPhone : {
                    required : true
                },
                file_image : {
                    required : true
                }
            },
            message : {
                nameProducer : {
                    required : 'Vui lòng nhập tên nhà cung cấp'
                },
                email : {
                    email : 'Vui lòng nhập đúng địa chỉ email !',
                    required : 'Vui lòng nhập địa chỉ email !'
                },
                address : {
                    required : 'Vui lòng nhập đia chỉ'
                },
                numberPhone : {
                    required : 'Vui lòng nhập số điện thoại'
                },
                file_image : {
                    required : 'Vui lòng chọn ảnh'
                }

            }
        });
    });
</script>
</html>