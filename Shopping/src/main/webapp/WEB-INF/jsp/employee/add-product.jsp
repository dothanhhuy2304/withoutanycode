<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 10/24/2020
  Time: 7:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <base href="${pageContext.servletContext.contextPath }/">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Quản Lý Sản Phẩm</title>
    <style>
        .message{
            color: #1fa80a;
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
                        <li class="breadcrumb-item"><a href="Shopping.com/employee/home">Trang Chủ</a></li>
                        <li class="breadcrumb-item active">
                            Thêm Sản Phẩm</li>
                    </ol>
                </div>
            </div>
            <!-- End Bread crumb and right sidebar toggle -->
            <!-- Start Page Content -->
            <div class="row">
                <!-- column -->
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-block">
                            <h4 class="card-title">
                               Thêm Sản Phẩm
                            </h4>
                            <span class="message">${message}</span>
                            <form:form action="Shopping.com/employee/product/save-product" method="POST" modelAttribute="product"
                                       enctype="multipart/form-data" id="product">
                                <div class="row">
                                    <div class="col-md-6">
                                        <label> Tên Sản Phẩm: (<span style="color: red;">*</span>)
                                            <form:errors path="nameProduct" /></label>
                                        <form:input path="nameProduct" id="nameProduct" placeholder="Tên sản phẩm" size="30" maxlength="30"
                                                    class="form-control form-control-line" />
                                    </div>
                                    <div class="col-md-6">
                                        <label>Số Lượng:
                                            (<span style="color: red;">*</span>)
                                            <form:errors path="quantity" /></label>
                                        <form:input path="quantity" id="quantity" placeholder="Số lượng" size="30"
                                                    maxlength="30" class="form-control form-control-line"
                                                    type="number" />
                                    </div>
                                </div>
                                <br>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label>Đơn Vị Tính:
                                            (<span style="color: red;">*</span>)
                                            <form:errors path="unitBrief" /></label>
                                        <form:input path="unitBrief" id="unitBrief" placeholder="Đơn vị tính" size="30" maxlength="30"
                                                    class="form-control form-control-line" />
                                    </div>
                                    <div class="col-md-6">
                                        <label><i class="fa fa-calendar bigger-110"> </i>
                                            Ngày Sản Xuất: (<span style="color: red;">*</span>)
                                            <form:errors path="productDate" /></label>
                                        <form:input path="productDate" id="productDate" placeholder="dd/MM/yyyy" size="30" maxlength="30"
                                                    class="form-control form-control-line" />
                                    </div>
                                </div>
                                <br>

                                <div class="row">
                                    <div class="col-md-6">
                                        <label>Đơn Giá:
                                            (<span style="color: red;">*</span>)
                                            <form:errors path="unitPrice" /></label>
                                        <form:input path="unitPrice" id="unitPrice" placeholder="Đơn giá" size="30" maxlength="30" type="number"
                                                    class="form-control form-control-line" />
                                    </div>
                                    <div class="col-md-6">
                                        <label>Giảm Giá:
                                        </label>
                                        <form:select path="discount" id="discount" class="form-control form-control-line">
                                            <form:option value="">--Lựa Chọn</form:option>
                                            <form:option value="0">0 %</form:option>
                                            <form:option value="0.03">3 %</form:option>
                                            <form:option value="0.05">5 %</form:option>
                                            <form:option value="0.08">8 %</form:option>
                                            <form:option value="0.10">10 %</form:option>
                                        </form:select>
                                    </div>
                                </div>
                                <br>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label for="category.id">Danh Mục(<span style="color: red;">*</span>) </label>
                                        <form:select path="category.id" id="category" items="${category}" itemValue="id" itemLabel="nameCategory"
                                                     class="form-control form-control-line" />
                                    </div>
                                    <div class="col-md-6">
                                        <label for="producer.id">Hãng Sản Xuất(<span
                                                style="color: red;">*</span>) </label>
                                        <form:select path="producer.id" id="producer" items="${producer}" itemValue="id" itemLabel="nameProducer"
                                                     class="form-control form-control-line" />
                                    </div>
                                </div>
                                <br>

                                <div class="row">
                                    <div class="col-md-4">
                                        <label>Sản Phẩm Có Sẵn:
                                        </label>
                                        <form:select path="available" id="available" class="form-control form-control-line">
                                            <form:option value="">
                                                --Lựa Chọn--
                                            </form:option>
                                            <form:option value="0">
                                                Không
                                            </form:option>
                                            <form:option value="1">
                                                Có
                                            </form:option>
                                        </form:select>
                                    </div>
                                    <div class="col-md-4">
                                        <label>
                                            Sản Phẩm Đặc Biệt:
                                        </label>
                                        <form:select path="special" id="special" class="form-control form-control-line">
                                            <form:option value="">
                                                --Lựa Chọn--
                                            </form:option>
                                            <form:option value="0">
                                              Không
                                            </form:option>
                                            <form:option value="1">
                                               Có
                                            </form:option>
                                        </form:select>
                                    </div>
                                    <div class="col-md-4">
                                        <label>Sản Phẩm Mới Nhất:
                                        </label>
                                        <form:select path="news" id="news" class="form-control form-control-line">
                                            <form:option value="">
                                                --Lựa Chọn
                                            </form:option>
                                            <form:option value="0">
                                                Không
                                            </form:option>
                                            <form:option value="1">
                                                Có
                                            </form:option>
                                        </form:select>
                                    </div>
                                </div>
                                <br>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label>Hình Ảnh Chính Cho Sản Phẩm:
                                            (<span style="color: red;">*</span>)
                                            <form:errors path="photo" /></label>
                                        <input id="photo" type="file" name="file_image" class="form-control form-control-line" />
                                        <br> <br> <br> <br>
                                        <div style="text-align: center;">
                                            <button class="btn btn-success btn-lg">
                                               Thêm Sản Phẩm
                                            </button>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="description">Mô Tả:</label>
                                        <form:textarea path="description" rows="5" style="text-align: center; width:570px; height:200px"
                                                       class="form-control form-control-line" />
                                    </div>
                                </div>
                                <br>
                                <form:hidden path="status" value="0" />
                                <form:hidden path="views" value="0"/>
                            </form:form>

                        </div>
                    </div>
                </div>
            </div>
            <!-- End PAge Content -->
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
    $(function () {
        $(".productDate").datepicker({
            dateFormat:'dd/mm/yy'
        });
        $("input#productDate").datepicker({
            dateFormat: 'dd/mm/yy'
        });
    });
</script>
<script type="text/javascript">
    $(function () {
        $("#product").validate({
            rules : {
                nameProduct : {
                    required : true
                },
                quantity : {
                    required: true
                },
                unitBrief : {
                    required : true
                },
                productDate : {
                    required : true
                },
                unitPrice : {
                    required : true
                },
                discount : {
                    required : true
                },
                category : {
                    required : true
                },
                producer : {
                    required : true
                },
                available : {
                    required : true
                },
                special : {
                    required : true
                },
                news : {
                    required : true
                },
                photo : {
                    required : true
                }
            },
            messages : {
                nameProduct: {
                    required : 'Vui lòng nhập tên sản phẩm'
                },
                quantity : {
                    required : 'Vui lòng nhập số lượng'
                },
                unitBrief : {
                   required : 'Vui lòng nhập đơn vị tính'
                },
                productDate: {
                    required : 'Vui lòng nhập ngày sản xuất'
                },
                unitPrice: {
                    required : 'Vui lòng nhập đơn giá'
                },
                discount: {
                    required : 'Vui lòng nhập giảm giá'
                },
                category: {
                    required : 'Vui lòng lựa chọn thể loại'
                },
                producer:{
                   required : 'Vui lòng lựa chọn nhà cung cấp'
                },
                available: {
                    required : 'Vui lòng lựa chọn'
                },
                special: {
                    required : 'Vui lòng lựa chọn'
                },
                news : {
                    required : 'Vui lòng lựa chọn'
                },
                photo: {
                    required : 'Vui lòng chọn ảnh'
                }
            }
        });
    });
</script>
</html>