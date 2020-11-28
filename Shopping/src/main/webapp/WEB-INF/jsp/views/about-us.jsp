<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 10/14/2020
  Time: 9:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
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
            <div class="span9" id="mainCol">
                <ul class="breadcrumb">
                    <li><a href="Shopping.com/user/product"><spring:message code="label.home" /></a> <span class="divider">/</span></li>
                    <li class="active"><spring:message code="label.introduce"/></li>
                </ul>
                <h3><spring:message code="label.aIntroduce1"/></h3>
                <p><spring:message code="label.content1"/> </p>
                <h3><spring:message code="label.aIntroduce2" /> </h3>
                <p><spring:message code="label.content2"/> </p>
                <hr class="soft">
                <h4><spring:message code="label.aIntroduce3"/></h4>
                <p><spring:message code="label.content3"/></p>
                <br>

                <h4><spring:message code="label.aIntroduce4"/> </h4>
                <p><spring:message code="label.content4"/></p>
                <br>

                <h4><spring:message code="label.aIntroduce5"/></h4>
                <p><spring:message code="label.content5"/></p>
                <br>

                <h4><spring:message code="label.aIntroduce6"/></h4>
                <p><spring:message code="label.content6"/></p>
                <br>

                <h4><spring:message code="label.aIntroduce7"/></h4>
                <p><spring:message code="label.content7"/> </p>
                <br>

                <h4><spring:message code="label.aIntroduce8"/></h4>
                <p><spring:message code="label.content8"/></p>
                <br>

                <h4><spring:message code="label.aIntroduce9"/></h4>
                <p><spring:message code="label.content9"/></p>
                <br>

                <h4><spring:message code="label.aIntroduce10"/></h4>
                <p><spring:message code="label.content10"/></p>
                <br>

                <h4><spring:message code="label.aIntroduce11"/></h4>
                <p><spring:message code="label.content11"/></p>
                <br>

                <h4><spring:message code="label.aIntroduce12"/></h4>
                <p><spring:message code="label.content12"/> </p>
                <br>

                <h4><spring:message code="label.aIntroduce13"/></h4>
                <p><spring:message code="label.content13"/></p>
                <br>

                <h4><spring:message code="label.aIntroduce14"/></h4>
                <p><spring:message code="label.content14"/></p>
                <br>

                <h4><spring:message code="label.aIntroduce15"/></h4>
                <p><spring:message code="label.content15"/></p>
                <br>

                <h4><spring:message code="label.aIntroduce16"/></h4>
                <p><spring:message code="label.content16"/></p>
                <br>

            </div>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>
