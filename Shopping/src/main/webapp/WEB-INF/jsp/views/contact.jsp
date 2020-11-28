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
<body>
<jsp:include page="header.jsp"/>
<jsp:include page="menu.jsp"/>
<div id="mainBody">
    <div class="container">
        <div class="row">
            <!--  -->
            <div class="span9" id="mainCol">
                <ul class="breadcrumb">
                    <li><a href="Shopping.com/user/product"><spring:message code="label.home"/></a> <span class="divider">/</span></li>
                    <li class="active"><spring:message code="label.contact"/></li>
                </ul>
                <h3><spring:message code="label.cslogan"/></h3>
                <hr class="soft">
            </div>
            <div class="row">
                <div class="span4">
                    <h4><spring:message code="label.caddress"/></h4>
                    <p>
                        <spring:message code="label.ccontact"/>
                        <a href="https://www.facebook.com/%C4%90%E1%BB%97-Th%C3%A0nh-Huy-C9-102950021596807">Đỗ Thành Huy</a><br>
                    </p>
                </div>
                <div class="span4">
                    <h4><spring:message code="label.timeoppen1"/></h4>
                    <h5><spring:message code="label.timeoppen2"/></h5>
                    <span><spring:message code="label.timeoppen3"/></span> <br>
                    <h5><spring:message code="label.timeoppen4"/></h5>
                    <span><spring:message code="label.timeoppen5"/></span><br>
                    <h5><spring:message code="label.timeoppen6"/></h5>
                    <span><spring:message code="label.timeoppen7"/></span> <br>
                </div>
                <br>
                <hr class="soft">
                <div class="span9" id="mainCol">
                    <h3><spring:message code="label.cmyaddress"/> </h3>
                    <hr class="soft">
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3724.2802239203916!2d105.80748621533208!3d21.021470693402105!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135ab666ac2c3b1%3A0x8f77b30b5f366910!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBMdeG6rXQgSMOgIE7hu5lp!5e0!3m2!1svi!2s!4v1602762838579!5m2!1svi!2s"
                            width="600" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0">
                    </iframe>
                </div>
            </div>
            <!--  -->
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>