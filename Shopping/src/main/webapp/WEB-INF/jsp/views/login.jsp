<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 10/16/2020
  Time: 2:27 PM
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
    <title><spring:message code="label.title"/> </title>
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
                    <li class="active"><spring:message code="label.login"/></li>
                </ul>
                <h3><spring:message code="label.login"/></h3>
                <h5 style="color: red"><spring:message code="label.lslogin"/></h5>
                <div class="well">
                    <h3><spring:message code="label.linfo"/></h3>
                    <form:form action="Shopping.com/user/checkLogin" method="post" modelAttribute="user" class="form-horizontal" role="form" id="register">
                        <label class="error" style="color: red">${message}</label>
                        <div class="control-group">
                            <label class="control-label"><spring:message code="label.rusername"/><sup style="color: red">*</sup></label>
                            <div class="controls">
                                <form:input path="id" id="id" placeholder="Username" cssClass="form-control" />
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label"><spring:message code="label.rpassword"/>
                                <sup style="color: red">*</sup></label>
                            <div class="controls">
                                <form:password path="password"  id="password" placeholder="Password" cssClass="form-control" />
                            </div>
                            <form:hidden path="activated"/>
                        </div>
                        <div class="control-group">
                            <label class="control-label"> </label>
                            <div class="controls">
                                    <input type="checkbox" name="remember" value="1">
                                <span><spring:message code="label.lrememberme"/></span>
                            </div>
                        </div>

                        <div class="control-group">
                            <div class="controls">
                                <input class="btn btn-large btn-danger" type="submit" value="<spring:message code="label.login"/>">
                            </div>
                        </div>
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
        $("#register").validate({
            rules : {
                id : {
                    required : true
                },
                password : {
                    required : true,
                    minlength : 6
                }
            },
            messages : {
                id : {
                    required : '<spring:message code="message.luser"/>'
                },
                password : {
                    required : '<spring:message code="message.lpassword"/>',
                    minlength : '<spring:message code="message.lpassword1"/>'
                }
            }
        });
    });
</script>
</html>