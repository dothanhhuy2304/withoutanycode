<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 10/14/2020
  Time: 9:48 PM
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
<style>
    #message-success{
        color: #1fa80a;
    }
</style>
<body>
<jsp:include page="header.jsp"/>
<jsp:include page="menu.jsp"/>
<div id="mainBody">
    <div class="container">
        <div class="row">
            <div class="span9" id="mainCol">
                <ul class="breadcrumb">
                    <li><a href="Shopping.com/user/product"><spring:message code="label.home"/></a> <span class="divider">/</span></li>
                    <li class="active"><spring:message code="label.feedback"/></li>
                </ul>
                <h3><spring:message code="label.fbSlogan"/></h3>
                <hr class="soft">
                <p class="help-block">
                    <spring:message code="label.fbcontent"/>
                </p>
                <label class="error">${error}</label>
                <label id="message-success" class="has-feedback">${message }</label>
                <form action="Shopping.com/user/feedback/save" method="post" role="form" id="feedback">
                    <%--@declare id="info"--%>
                        <div class="form-group">
                            <input type="hidden" name="id">
                        <label><spring:message code="label.fbusername"/> </label>
                            <input type="text" class="required" class="form-control border-input" name="name" placeholder="Enter your name" style="width: 530px; height: 25px">
                    </div>
                    <div class="form-group">
                        <label><spring:message code="label.fbemail"/> </label>
                        <input type="email" class="required email" class="form-control" name="email"
                               placeholder="Enter email" style="width: 530px; height: 25px">
                    </div>
                    <label for="cat"><spring:message code="label.fbtheme"/></label>
                        <select class="form-control" id="cat" name="theme" style="width: 542px; height: 36px">
                            <option value=""><spring:message code="label.fboption-choose"/> </option>
                            <option value="web"><spring:message code="label.fboption1"/></option>
                            <option value="service"><spring:message code="label.fboption2"/></option>
                            <option value="employee"><spring:message code="label.fboption3"/></option>
                     </select>
                        <br> <label for="info"><spring:message code="label.fbcontent-feedback"/></label>
                    <textarea name="description" class="required" class="form-control" rows="5" style="width: 530px"></textarea>
                    <br>
                    <button type="submit" class="btn btn-danger btn-large"><spring:message code="label.fbsend"/></button>
                </form>
            </div>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"/>
<script src="project/themes/js/jquery-1.7.1.min.js"></script>
<script src="project/themes/js/jquery.validate.min.js"></script>
<script type="text/javascript">
    $(function() {
        $("#feedback").validate({
            rules : {
                name : {
                    required : true
                },
                email : {
                    required : true,
                    email : true
                },
                theme :{
                    required:true
                },
                description : {
                    required : true
                }
            },
            messages : {
                name : {
                    required : '<spring:message code="message.fbname"/>'
                },
                email : {
                    required : '<spring:message code="message.fbemail"/>',
                    email : '<spring:message code="message.fbemail1"/>'
                },
                theme : {
                    required:'<spring:message code="message.fbtheme"/>'
                },
                description : {
                    required : '<spring:message code="message.fbdescription"/>'
                }
            }
        });
    });
</script>
</body>
</html>