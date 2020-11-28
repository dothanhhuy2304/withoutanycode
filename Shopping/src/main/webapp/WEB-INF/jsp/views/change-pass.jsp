<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 10/17/2020
  Time: 3:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

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
            <!--  -->
            <div class="span9">
                <ul class="breadcrumb">
                    <li><a href="Shopping.com/user/product"><spring:message code="label.home"/></a> <span class="divider">/</span></li>
                    <li class="active"><spring:message code="label.cpslogan"/></li>
                </ul>
                <h3><spring:message code="label.cpslogan"/></h3>
                <div class="well">
                    <form:form action="Shopping.com/user/save-pass" method="post" modelAttribute="user" class="form-horizontal"
                               role="form" id="changePass">
                        <h4><spring:message code="label.cpslogan1"/></h4>
                        <label class="error">${message}</label>
                        <div class="control-group">
                            <label class="control-label"><spring:message code="label.cpoldpass"/> <sup
                                    style="color: red">*</sup>
                            </label>
                            <div class="controls">
                                <form:password path="password" id="password" placeholder="Old Password" cssClass="form-control" />
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label"><spring:message code="label.cpnewpass"/> <sup
                                    style="color: red">*</sup></label>
                            <div class="controls">
                                <input id="password1" class="form-control" name="password1" type="password" placeholder="New Password"  />
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label"><spring:message code="label.cp-cf-pass"/> <sup
                                    style="color: red">*</sup></label>
                            <div class="controls">
                                <input id="password2" class="form-control" name="password2" type="password" placeholder="Confirm Password" />
                            </div>
                        </div>
                        <div class="control-group">
                            <div class="controls">
                                <input class="btn btn-large btn-success" type="submit"
                                       value="<spring:message code="label.cpbtn"/>">
                            </div>
                        </div>
                        <form:hidden path="id" />
                        <form:hidden path="code"/>
                        <form:hidden path="fullName" />
                        <form:hidden path="email" />
                        <form:hidden path="photo" />
                        <form:hidden path="address" />
                        <form:hidden path="numberPhone" />
                        <form:hidden path="birthday" />
                        <form:hidden path="gender" />
                        <form:hidden path="access"/>
                        <form:hidden path="activated" />
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
<script type="text/javascript">
    $(function() {
        $("#changePass").validate({
            rules : {
                password : {
                    required : true
                },
                password1 : {
                    required : true
                },
                password2 : {
                    required : true
                }
            },
            messages : {
                password : {
                    required : '<spring:message code="message.cp-old-pass"/>'
                },
                password1 : {
                    required : '<spring:message code="message.cp-new-pass"/>'
                },
                password2 : {
                    required : '<spring:message code="message.cp-cf-pass"/>'
                }
            }
        });
    });
</script>
</html>