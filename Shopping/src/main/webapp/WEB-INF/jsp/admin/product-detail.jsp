<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 10/31/2020
  Time: 10:19 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <base href="${pageContext.servletContext.contextPath }/">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Product Detail</title>
    <style>
        * {
            box-sizing: border-box;
        }
        .zoom {
            padding: 75px;
            transition: transform .2s;
            width: 30em;
            height: 25em;
            margin: 0 auto;
        }
        .zoom:hover {
            -ms-transform: scale(1.5); /* IE 9 */
            -webkit-transform: scale(1.5); /* Safari 3-8 */
            transform: scale(1.5);
        }
    </style>
</head>
<body>
<div id="main-wrapper">
    <jsp:include page="header.jsp"/>
    <jsp:include page="menu.jsp"/>
    <div class="page-wrapper">
        <!-- Container fluid  -->
        <div class="container-fluid">
            <!-- Bread crumb and right sidebar toggle -->
            <div class="row page-titles">
                <div class="col-md-5 col-8 align-self-center">
                    <h3 class="text-themecolor m-b-0 m-t-0">
                        Quản Lý Sản Phẩm
                    </h3>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="Shopping.com/admin/home">
                            Trang Chủ
                        </a></li>
                        <li class="breadcrumb-item active">
                            Chi Tiết Sản Phẩm
                        </li>
                    </ol>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 col-xlg-12 col-md-12">
                    <div class="card">
                        <div class="card-block little-profile text-center">
                            <a href="project/products/${product.photo}">
                                <img class="zoom card-img-top" src="project/products/${product.photo }"/>
                            </a>
                            <div class="pro-img">
                                <a href="project/products/${product.photo}">
                                    <img src="project/products/${product.photo }"/></a>
                            </div>
                            <h3 class="m-b-0">${product.nameProduct }</h3>
                            <p>${product.nameProduct }</p>

                            <h5 style="text-align: center;">
                                <span>Tên Sản Phẩm:</span>
                                ${product.producer.nameProducer}
                            </h5>

                            <h5 style="text-align: center;">
                                <span>Danh Mục:</span>
                                ${product.category.nameCategory}
                            </h5>

                            <h5 style="text-align: center;">
                                <span>Số Lượng: </span>
                                ${product.quantity}
                            </h5>

                            <h5 style="text-align: center;">
                                <span>Đơn Giá:</span>
                                <fmt:formatNumber value="${product.unitPrice}" type="number"/> VNĐ
                            </h5>

                            <h5 style="text-align: center;">
									<span>Đơn Vị Tính:
									</span> ${product.unitBrief}
                            </h5>

                            <h5 style="text-align: center;">
                                <span>Giảm Giá: </span>
                                <c:choose>
                                    <c:when test="${product.discount == null}">0%</c:when>
                                    <c:when test="${product.discount == 0}">0%</c:when>
                                    <c:otherwise>
                                        <fmt:formatNumber value="${product.discount }" type="percent" />
                                    </c:otherwise>
                                </c:choose>
                            </h5>

                            <h5 style="text-align: center;">
                                <span>Lượt Xem: </span>
                                <c:choose>
                                    <c:when test="${product.views == null}">
                                        0
                                    </c:when>
                                    <c:otherwise>
                                        ${product.views}
                                    </c:otherwise>
                                </c:choose>
                            </h5>

                            <hr>

                            <!-- Đặc Điểm -->
                            <div style="text-align: center;">
                                <form:form action="Shopping.com/admin/product/change-detail/${product.id }.htm"
                                           method="POST" modelAttribute="product">
                                    <div class="row">
                                        <div class="col-md-3">
                                            <label>Sản Phẩm Có Sẵn:
                                            </label>
                                            <form:select path="available" class="form-control form-control-line">
                                                <form:option value="0">
                                                    Không
                                                </form:option>
                                                <form:option value="1">
                                                    Có
                                                </form:option>
                                            </form:select>
                                        </div>
                                        <div class="col-md-3">
                                            Sản Phẩm Đặc Biệt:
                                            </label>
                                            <form:select path="special" class="form-control form-control-line">
                                                <form:option value="0">
                                                    Không
                                                </form:option>
                                                <form:option value="1">
                                                    Có
                                                </form:option>
                                            </form:select>
                                        </div>
                                        <div class="col-md-3">
                                            <label>Sản Phẩm Mới Nhất:
                                            </label>
                                            <form:select path="news" class="form-control form-control-line">
                                                <form:option value="0">
                                                    Không
                                                </form:option>
                                                <form:option value="1">
                                                    Có
                                                </form:option>
                                            </form:select>
                                        </div>
                                        <div class="col-md-3">
                                            <label>Chức Năng</label> <br>
                                            <button class="btn btn-danger">
                                                Lưu
                                            </button>
                                        </div>
                                    </div>
                                    <div>
                                        <form:hidden path="discount"/>
                                        <form:hidden path="views"/>
                                        <form:hidden path="status" />
                                        <form:hidden path="description" />
                                        <form:hidden path="photo" />
                                        <form:hidden path="nameProduct" />
                                        <form:hidden path="quantity" />
                                        <form:hidden path="unitBrief" />
                                        <form:hidden path="unitPrice" />
                                        <form:hidden path="productDate" />
                                        <form:hidden path="producer.id" items="${producer}"
                                                     itemValue="id" itemLabel="nameProducer" />
                                        <form:hidden path="category.id" items="${category}"
                                                     itemValue="id" itemLabel="nameCategory" />
                                    </div>

                                </form:form>
                            </div>
                            <br>
                            <!-- Thay Ảnh -->
                            <div style="text-align: center;">
                                <form:form id="product" action="Shopping.com/admin/product/changePhoto-detail/${product.id }.htm" method="POST" modelAttribute="product"
                                           enctype="multipart/form-data">
                                    <div style="text-align: center;">
                                        <label>Hình ảnh:
                                        </label>
                                        <form:errors path="photo" />
                                        <input id="file_image" type="file" name="file_image" />
                                        <button class="btn btn-warning">
                                            Lưu
                                        </button>
                                        <br>
                                    </div>
                                    <div>
                                        <form:hidden path="status" />
                                        <form:hidden path="description" />
                                        <form:hidden path="available" />
                                        <form:hidden path="special" />
                                        <form:hidden path="news" />
                                        <form:hidden path="photo" />
                                        <form:hidden path="discount"/>
                                        <form:hidden path="nameProduct" />
                                        <form:hidden path="quantity" />
                                        <form:hidden path="unitBrief" />
                                        <form:hidden path="unitPrice" />
                                        <form:hidden path="productDate" />
                                        <form:hidden path="producer.id" items="${producer}" itemValue="id" itemLabel="nameProducer" />
                                        <form:hidden path="category.id"  items="${category}"
                                                     itemValue="id" itemLabel="nameCategory" />
                                    </div>
                                </form:form>

                            </div>
                            <hr>
                            <h5 style="text-align: center;">
									<span>Mô Tả:
									</span><br> ${product.description}
                            </h5>
                            <hr>
                            <a href="Shopping.com/admin/product"
                               class="m-t-10 waves-effect waves-dark btn btn-primary btn-md btn-rounded">
                                Trở Lại
                            </a>
                            <!--  -->
                            <div class="row text-center m-t-20"></div>
                        </div>
                        <!--  -->

                    </div>

                </div>
            </div>
            <!-- End Bread crumb and right sidebar toggle -->

        </div>
        <!-- End Container fluid  -->
        <!-- footer -->
        <jsp:include page="footer.jsp"/>
    </div>
</div>
</body>
<script src="project/themes/js/jquery-1.7.1.min.js"></script>
<script src="project/themes/js/jquery.validate.min.js"></script>
<script src="project/themes/assets/jquery-ui/jquery-ui.min.js"></script>
<script type="text/javascript">
    $(function() {
        $("#product").validate({
            rules : {
                file_image : {
                    required : true
                }
            },
            messages : {
                file_image : {
                    required : 'Vui lòng nhập tên đăng nhập !'
                }
            }
        });
    });
</script>
</html>