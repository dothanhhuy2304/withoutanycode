<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 10/14/2020
  Time: 11:12 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <base href="${pageContext.servletContext.contextPath }/"/>
    <meta charset="utf-8">
    <meta property="og:type" content="website" />
    <meta property="og:image" content="URL_IMAGE" />
    <meta property="og:locale" content="vi_VN" />
    <meta property="fb:app_id"  content="373059747215774" />
    <meta property="fb:admins" content="1284363711927551"/>
    <meta property="fb:admins" content="1048041898976254"/>
    <title><spring:message code="label.title"/> </title>
    <style>
        * {
            box-sizing: border-box;
        }

        #price-detail {
            color: red;
        }

        #img-by-category{
            width: 23em !important;
            height: 15em !important;
        }
        #img-by-producer{
            width: 23em !important;
            height: 15em !important;
        }

        .zoom {
            padding: 33px;
            transition: transform .2s;
            margin: 0 auto;
        }

        .zoom:hover {
            -ms-transform: scale(1.5); /* IE 9 */
            -webkit-transform: scale(1.5); /* Safari 3-8 */
            transform: scale(1.5);
        }
    </style>
</head>
<style>
</style>
<body>
<jsp:include page="header.jsp"/>
<div id="mainBody">
    <jsp:include page="menu.jsp"/>
    <div class="container">
        <div class="row">
            <!--  -->
            <div class="span9">
                <ul class="breadcrumb">
                    <li><a href="Shopping.com/user/product"><spring:message code="label.home"/></a> <span class="divider">/</span></li>
                    <li><a href="Shopping.com/user/about"><spring:message code="label.pdabout-us"/></a> <span
                            class="divider">/</span></li>
                    <li class="active"><spring:message code="label.pdslogan"/></li>
                </ul>
                <!--Chi tiết sản phẩm-->
                <div class="row">
                    <div id="gallery" class="span3">
                        <a href="project/products/${product.photo }" title="${product.nameProduct }">
                            <img class="zoom" src="project/products/${product.photo }" style="width: 100%" alt="">
                        </a>
                        <div id="differentview" class="moreOptopm carousel slide">
                            <div class="carousel-inner">
                                <div class="item active">
                                    <div class="swiper-container">
                                        <div class="swiper-wrapper">

                                            <div class="swiper-slide">
                                                <a href="project/products/${product.photo}">
                                                <img style="width: 29%" src="project/products/${product.photo}"
                                                     title="${product.nameProduct}" alt=""/>
                                            </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--If null-->
                                <div class="item">
                                    <a href="project/themes/images/products/large/f3.jpg">
                                        <img style="width: 29%" src="project/themes/images/products/large/f3.jpg"
                                            alt=""/></a> <a href="project/themes/images/products/large/f1.jpg">
                                    <img style="width: 29%" src="project/themes/images/products/large/f1.jpg" alt=""/>
                                </a> <a href="project/themes/images/products/large/f2.jpg">
                                    <img style="width: 29%" src="project/themes/images/products/large/f2.jpg" alt=""/>
                                </a>
                                </div>
                            </div>
                        </div>
                        <div class="btn-toolbar">
                            <div class="btn-group">
                                <a href="" class="btn"><i class="icon-envelope"></i></a>
                                <span class="btn">
                                    <i class="icon-print"></i></span>
                                <i class="icon-star"></i>
                                <span class="btn">
                                    <i class=" icon-thumbs-up"></i>
                                    </span> <span class="btn">
                                <i class="icon-thumbs-down"></i>
                                </span>
                            </div>
                        </div>
                        <br class="soft">
                        <hr class="soft">
                        <div class="fb-like" data-href="https://www.facebook.com/%C4%90%E1%BB%97-Th%C3%A0nh-Huy-C9-102950021596807"
                             data-width="280px" data-layout="standard" data-action="like"
                             data-size="small" data-show-faces="true" data-share="true"></div>
                        <div>
                            <br>
                            <a href="https://www.facebook.com/%C4%90%E1%BB%97-Th%C3%A0nh-Huy-C9-102950021596807" target="_blank">
                            <img src="project/themes/images/facebook-s.png" alt="Facebook"/>
                        </a>
                        </div>
                    </div>
                    <div class="span6">
                        <h3>${product.nameProduct }
                            <span class="btn btn-warning pull-right"><spring:message code="label.pddiscount"/>
                                <c:choose>
                            <c:when test="${product.discount == null}">0%</c:when>
                            <c:when test="${product.discount == 0}">0%</c:when>
                            <c:otherwise>
                                <fmt:formatNumber value="${product.discount}" type="percent"/>
                            </c:otherwise>
                        </c:choose>
								</span>
                        </h3>
                        <table class="table table-striped"
                               style="font-stretch: ultra-condensed;">
                            <tbody>
                            <tr>
                                <td style="font-size: 16px; font-weight: bold;" colspan="2" align="center">
                                    <spring:message code="label.pdslogan1"/>
                                </td>
                            </tr>
                            <tr>
                                <td><spring:message code="label.pdcode"/></td>
                                <td> ${product.id }</td>
                            </tr>
                            <tr>
                                <td><spring:message code="label.pdcategory"/></td>
                                <td> ${product.category.nameCategory }</td>
                            </tr>
                            <tr>
                                <td><spring:message code="label.pdproducer"/></td>
                                <td> ${product.producer.nameProducer }</td>
                            </tr>
                            <tr>
                                <td><spring:message code="label.pdunitprice"/></td>
                                <td><fmt:formatNumber value="${product.unitPrice }"
                                                      pattern="###,###"/> VNĐ
                                </td>
                            </tr>
                            <tr>
                                <td><spring:message code="label.pddateexp"/></td>
                                <td><fmt:formatDate value="${product.productDate }"
                                                    pattern="dd/MM/yyy"/></td>
                            </tr>
                            <tr>
                                <td><spring:message code="label.pdqty"/></td>
                                <td> ${product.quantity }</td>
                            </tr>
                            <tr>
                                <td><spring:message code="label.pdunitbrief"/></td>
                                <td> ${product.unitBrief }</td>
                            </tr>
                            <tr>
                                <td><spring:message code="label.pdspecial"/></td>
                                <td><c:choose>
                                    <c:when test="${product.special == true }">
                                        <span><spring:message code="label.pdslogan2"/></span>
                                    </c:when>
                                    <c:when test="${product.news == true }">
                                        <span><spring:message code="label.pdnew"/></span>
                                    </c:when>
                                    <c:when test="${product.special == false }">
                                  <spring:message code="label.pdno"/>
                                    </c:when>
                                    <c:when test="${product.news == false }">
                                        <spring:message code="label.pdno"/>
                                    </c:when>
                                </c:choose>
                                </td>
                            </tr>
                            <tr>
                                <td><spring:message code="label.pdstatus"/></td>
                                <td><c:choose>
                                    <c:when test="${product.quantity < 1 }">
                                        <span><spring:message code="label.pd1"/></span>
                                    </c:when>
                                    <c:when test="${product.quantity >= 1}">
                                        <span><spring:message code="label.pdavailable"/></span>
                                    </c:when>
                                </c:choose></td>
                            </tr>
                            <tr>
                                <td><spring:message code="label.view"/></td>
                                <td><span>${product.views }</span></td>
                            </tr>
                            </tbody>
                        </table>
                        <hr class="soft">
                        <div class="control-group">
                            <div class="controls">
                                <label class="control-label" id="price-detail"><span style="font-size: 3ch">
                                    <fmt:formatNumber value="${product.unitPrice*(1-product.discount) }" pattern="###,###"/> VNĐ</span></label>
                                <a href="Shopping.com/shopping-cart/add/${product.id }" type="submit"
                                   class="btn btn-large btn-primary pull-right"> <spring:message code="label.addToCart2"/>
                                    <i class=" icon-shopping-cart"></i>
                                </a>
                            </div>
                        </div>
                        <hr class="soft">
                    </div>
                    <div class="span9">
                        <p>${product.description }</p>
                        <hr class="soft">
                    </div>
                    <!--  -->
                    <div class="span9">
                        <ul id="productDetail" class="nav nav-tabs">
                            <li class="">
                                <a href="#comment" data-toggle="tab"><spring:message code="label.pdcomment"/></a>
                            </li>
                            <li class="">
                                <a href="#producer" data-toggle="tab"><spring:message code="label.pdbyproducer"/></a>
                            </li>
                            <li class="">
                                <a href="#category" data-toggle="tab"><spring:message code="label.pdbycategory"/></a>
                            </li>
                        </ul>
                        <div id="myTabContent" class="tab-content">
                            <!-- Bình luận -->
                            <div class="tab-pane fade " id="comment">
                                <div id="fb-root"></div>
                                <script async defer crossorigin="anonymous" src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v8.0&appId=373059747215774&autoLogAppEvents=1" nonce="vTwl4vNM"></script>
                                <div class="fb-comments" data-href="http://localhost:8000/user/product" data-width="470"></div>
                            </div>

                            <!-- Hàng cùng hãng -->
                            <div class="tab-pane fade" id="producer">
                                <ul class="thumbnails" id="thumbnail">
                                    <c:forEach var="pd" items="${product.producer.product}">
                                        <li class="span3">
                                            <div class="thumbnail" id="img-by-producer">
                                                <!--Imgage Hàng Cung Hãng-->
                                                <a href="Shopping.com/user/product/detail/${pd.id}.htm">
                                                    <img class="img-rounded" src="project/products/${pd.photo }"
                                                         width="50px" height="100px"></a>
                                                <div class="caption">
                                                    <h5>
                                                        <span>${pd.nameProduct }</span>
                                                    </h5>
                                                    <h5>
                                                        <span><fmt:formatNumber value="${pd.unitPrice *(1-pd.discount)}" type="number" pattern="###,###,###"/>VNĐ</span>
                                                    </h5>
                                                </div>
                                            </div>
                                        </li>
                                    </c:forEach>
                                </ul>
                                <hr class="soft">
                                <br class="clr">
                            </div>
                            <!-- Hàng cùng danh mục -->
                            <div class="tab-pane fade" id="category">
                                <ul class="thumbnails" id="thumbnail">
                                    <c:forEach var="pd" items="${product.category.product}">
                                        <li class="span3">
                                            <div class="thumbnail" id="img-by-category">
                                                <a href="Shopping.com/user/product/detail/${pd.id}.htm">
                                                    <img class="img-rounded" src="project/products/${pd.photo }"
                                                         width="50px" height="100px"></a>
                                                <div class="caption">
                                                    <h5>
                                                        <span>${pd.nameProduct }</span>
                                                    </h5>
                                                    <h5>
                                                        <span><fmt:formatNumber value="${pd.unitPrice *(1-pd.discount)}" type="number" pattern="###,###,###"/> VNĐ </span>
                                                    </h5>
                                                </div>
                                            </div>
                                        </li>
                                    </c:forEach>
                                </ul>
                                <hr class="soft">
                                <br class="clr">
                            </div>
                        </div>
                    </div>
                    <!--  -->
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"/>
<script>
    (function(d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) return;
        js = d.createElement(s);
        js.id = id;
        js.src = "https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v8.0&appId=373059747215774";
        fjs.parentNode.insertBefore(js, fjs);
    }(document, "script", "facebook-jssdk"));
</script>
<script>
    window.fbAsyncInit = function() {
        FB.init({
            appId      : '373059747215774',
            xfbml      : true,
            version    : 'v8.0'
        });
        FB.AppEvents.logPageView();
    };

    (function(d, s, id){
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) {return;}
        js = d.createElement(s); js.id = id;
        js.src = "https://connect.facebook.net/en_US/sdk.js";
        fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));
</script>

</body>
</html>
