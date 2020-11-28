<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<base href="${pageContext.servletContext.contextPath}/">
<style type="text/css" id="enject"></style>
<div id="footerSection">
    <div class="container" style="background-color: #202020">
        <div class="row">
            <div class="span3">
                <c:choose>
                    <c:when test="${ sessionScope.user.fullName != null}">
                        <h5><spring:message code="label.faccount" /></h5>
                        <a href="Shopping.com/user/change-pass/${sessionScope.user.id }.htm"><spring:message code="label.fchange-pass" /></a>
                        <a href="Shopping.com/user/change-info/${sessionScope.user.id }.htm"><spring:message code="label.fupdate-info"/></a>
                        <a href="Shopping.com/order/list"><spring:message code="label.forder-list" /></a>
                    </c:when>
                </c:choose>
            </div>
            <div class="span3">
                <h5><spring:message code="label.infor"/></h5>
                <a href="Shopping.com/user/about"><spring:message code="label.fabout"/></a>
                <a href="Shopping.com/user/feedback"><spring:message code="label.ffeedback"/></a>
                <a href="Shopping.com/user/contact"><spring:message code="label.fcontact"/></a>
                <a href="Shopping.com/user/about"><spring:message code="label.fQA"/></a>
            </div>
            <div class="span3">
                <h5><spring:message code="label.fproduct"/></h5>
                <a href="Shopping.com/user/product/type/sales.htm"><spring:message code="label.fsale"/></a>
                <a href="Shopping.com/user/product/type/special.htm"><spring:message code="label.fspecial"/></a>
                <a href="Shopping.com/user/product/type/views.htm"><spring:message code="label.fview"/></a>
                <a href="Shopping.com/user/product/type/sales.htm"><spring:message code="label.fsale"/></a>
                <a href="Shopping.com/user/product/type/buy.htm"><spring:message code="label.fbuy"/></a>
            </div>

            <div class="span pull-right">
                <div id="fb-root"></div>
                <script async defer crossorigin="anonymous" src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v8.0&appId=373059747215774&autoLogAppEvents=1" nonce="zJmmNcO3"></script>
                <div class="fb-page" data-href="https://www.facebook.com/%C4%90%E1%BB%97-Th%C3%A0nh-Huy-C9-102950021596807" data-tabs="timeline" data-width="255" data-height="100" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true"></div>
            </div>
            <div id="socialMedia" class="span3 pull-right">
                <h5><spring:message code="label.fcontact1"/></h5>
                <a href="https://www.facebook.com/profile.php?id=100010618027265" target="blank">
                    <img width="60" height="60" src="project/themes/images/facebook.png" title="facebook" alt="facebook"></a> <a
                    href="https://twitter.com/" target="blank">
                <img width="60" height="60" src="project/themes/images/twitter.png" title="twitter" alt="twitter"></a>
                <a href="https://www.youtube.com/watch?v=Vchgv-SXEqo" target="blank">
                <img width="60" height="60" src="project/themes/images/youtube.png" title="youtube" alt="youtube"></a>
            </div>
        </div>
        <div class="pull-right" style="font-size: 20px;">
            <b><spring:message code="label.fsupport"/></b>
        </div>
        <br>
        <p class="pull-right"><spring:message code="label.fcopyright"/></p>
    </div>
</div>
<script src="https://uhchat.net/code.php?f=d63847"></script>
<!-- Placed at the end of the document so the pages load faster============== -->
<script src="project/themes/js/jquery.js" type="text/javascript"></script>
<script src="project/themes/js/bootstrap.min.js" type="text/javascript"></script>
<script src="project/themes/js/google-code-prettify/prettify.js"></script>
<script src="project/themes/js/bootshop.js"></script>
<script src="project/themes/js/jquery.lightbox-0.5.js"></script>
<script src="project/themes/js/jquery-1.7.1.min.js"></script>
<script src="project/themes/js/jquery.validate.min.js"></script>
<script src="project/themes/js/less.js"></script>
<!--Pagination-->
<script src="project/themes/js/jquery-pagination.js"></script>
<script src="project/themes/js/cdn-database.js"></script>
<script src="project/themes/js/bootstrap-database.js"></script>