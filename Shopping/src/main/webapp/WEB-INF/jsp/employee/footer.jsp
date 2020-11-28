<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 10/19/2020
  Time: 11:29 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<base href="${pageContext.servletContext.contextPath}/">
<style type="text/css" id="enject"></style>
    <div class="container-fluid" id="footer">
        <div class="row-fluid">
            <div id="socialMedia" class="span3 pull-right">
                <h5>LIÊN HỆ VỚI CHÚNG TÔI</h5>
                <a href="https://www.facebook.com/profile.php?id=100010618027265" target="blank">
                    <img width="60" height="60" src="project/themes/images/facebook.png" title="facebook" alt="facebook"></a>
                <a href="https://twitter.com/" target="blank">
                <img width="60" height="60" src="project/themes/images/twitter.png" title="twitter" alt="twitter"></a>
                <a href="https://www.youtube.com/watch?v=Vchgv-SXEqo" target="blank">
                <img width="60" height="60" src="project/themes/images/youtube.png" title="youtube" alt="youtube"></a>
            </div>
        </div>
        <div class="comment-text">
            ${sessionScope.employeeSession}
        </div>
        <div class="comment-text">
        <div class="pull-right" style="font-size: 20px;">
            <b>Hotline hỗ trợ khách hàng</b>
        </div>
        <br>
        <p class="pull-right">© Đỗ Thành Huy - 09.7249.3905 (từ 7:30h-21h, kể cả T7-CN)</p>
    </div>
    </div>

<style>
    #footer{
        background: white;
    }
</style>
<script src="project/themes/lite/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap tether Core JavaScript -->
<script src="project/themes/lite/plugins/bootstrap/js/tether.min.js"></script>
<script src="project/themes/lite/plugins/bootstrap/js/bootstrap.min.js"></script>
<!-- slimscrollbar scrollbar JavaScript -->
<script src="project/themes/lite/js/jquery.slimscroll.js"></script>
<!--Wave Effects -->
<script src="project/themes/lite/js/waves.js"></script>
<!--Menu sidebar -->
<script src="project/themes/lite/js/sidebarmenu.js"></script>
<!--stickey kit -->
<script src="project/themes/lite/plugins/sticky-kit-master/dist/sticky-kit.min.js"></script>
<!--Custom JavaScript -->
<script src="project/themes/lite/js/custom.min.js"></script>
<!-- ============================================================== -->
<!-- This page plugins -->
<!-- ============================================================== -->
<!-- chartist chart -->
<script src="project/themes/lite/plugins/chartist-js/dist/chartist.min.js"></script>
<script src="project/themes/lite/plugins/chartist-plugin-tooltip-master/dist/chartist-plugin-tooltip.min.js"></script>
<!--c3 JavaScript -->
<script src="project/themes/lite/plugins/d3/d3.min.js"></script>
<script src="project/themes/lite/plugins/c3-master/c3.min.js"></script>
<!-- Chart JS -->
<script src="project/themes/lite/js/dashboard1.js"></script>

<!--Line two-->

<script src="project/themes/assets/jquery-ui/jquery.min.js"></script>
<script src="project/themes/assets/js/jquery.min.js"></script>
<script src="project/themes/assets/jquery-ui/jquery-ui.min.js"></script>
<script src="project/themes/assets/jquery-ui/external/jquery/jquery.js"></script>
<script src="project/themes/assets/jquery-ui/jquery-ui.js"></script>
<!--Header -->
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<script src="project/themes/js/respond.js"></script>
<script src="project/themes/js/responds.js"></script>
<script src="project/themes/assets/js/jquery-3.1.1.min.js"></script>
<!--New validation-->
<!-- Placed at the end of the document so the pages load faster============== -->
<script src="project/themes/js/jquery.lightbox-0.5.js"></script>
<script src="project/themes/js/jquery-1.7.1.min.js"></script>
<!--Validaton-->
<script src="project/themes/js/jquery.validate.min.js"></script>
<!--Date-->
<script src="project/themes/assets/jquery-ui/jquery-ui.min.js"></script>
<!--Login-->
<script src="project/themes/login/js/jquery-1.10.2.js" type="text/javascript"></script>
<script src="project/themes/login/js/bootstrap.min.js" type="text/javascript"></script>
