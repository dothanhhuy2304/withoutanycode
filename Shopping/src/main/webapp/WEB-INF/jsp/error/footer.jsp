<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<base href="${pageContext.servletContext.contextPath}/">
<style type="text/css" id="enject"></style>
<div id="footerSection">
    <div class="container">
        <div class="row">
            <div class="span3">
                <c:choose>
                    <c:when test="${ sessionScope.user.fullName != null}">
                        <h5>TÀI KHOẢN</h5>
                        <a href="user/change-pass/${sessionScope.user.id }.htm">ĐỔI MẬT KHẨU</a>
                        <a href="user/change-info/${sessionScope.user.id }.htm">CẬP NHẬT THÔNG TIN</a>
                        <a href="order/list">XEM ĐƠN HÀNG</a>
                    </c:when>
                </c:choose>
            </div>
            <div class="span3">
                <h5>THÔNG TIN</h5>
                <a href="user/about">GIỚI THIỆU</a>
                <a href="user/feedback">GÓP Ý</a>
                <a href="user/contact">LIÊN HỆ</a>
                <a href="user/about">HỎI ĐÁP</a>
            </div>
            <div class="span3">
                <h5>SẢN PHẨM</h5>
                <a href="user/product/type/sales.htm">GIẢM GIÁ</a>
                <a href="user/product/type/special.htm">ĐẶC BIỆT</a>
                <a href="user/product/type/views.htm">XEM NHIỀU</a>
                <img src="project/bo-cong-thuong.svg"/>
            </div>
            <div id="socialMedia" class="span3 pull-right">
                <h5>LIÊN HỆ VỚI CHÚNG TÔI</h5>
                <a href="https://www.facebook.com/profile.php?id=100010618027265" target="blank">
                    <img width="60" height="60" src="project/themes/images/facebook.png" title="facebook" alt="facebook"></a> <a
                    href="https://twitter.com/" target="blank">
                <img width="60" height="60" src="project/themes/images/twitter.png" title="twitter" alt="twitter"></a>
                <a href="https://www.youtube.com/watch?v=Vchgv-SXEqo" target="blank">
                <img width="60" height="60" src="project/themes/images/youtube.png" title="youtube" alt="youtube"></a>
            </div>
        </div>
        <div class="pull-right" style="font-size: 20px;">
            <b>Hotline hỗ trợ khách hàng</b>
        </div>
        <br>
        <p class="pull-right">© Đỗ Thành Huy - 09.7249.3905 (từ 7:30h-21h,
            kể cả T7-CN)</p>
    </div>
</div>
<!-- Placed at the end of the document so the pages load faster============== -->
<script src="project/themes/js/jquery.js" type="text/javascript"></script>
<script src="project/themes/js/bootstrap.min.js" type="text/javascript"></script>
<script src="project/themes/js/google-code-prettify/prettify.js"></script>
<script src="project/themes/js/bootshop.js"></script>
<script src="project/themes/js/jquery.lightbox-0.5.js"></script>
<script src="project/themes/js/jquery-1.7.1.min.js"></script>
<script src="project/themes/js/jquery.validate.min.js"></script>
<script src="project/themes/js/less.js"></script>
