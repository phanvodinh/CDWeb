<%@ page import="java.io.File" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="org.apache.commons.io.FileUtils" %>


<%--gọi các file css hay js nhớ để trong <c:url value=""/>--%>
<html lang="en">

<head>
    <title>Danh sách nhân viên | Quản trị Admin</title>
    <%@include file="layout/header.jsp" %>
</head>

<body onload="time()" class="app sidebar-mini rtl">

<!-- Navbar-->
<%@include file="layout/navbar.jsp" %>

<!-- Sidebar menu-->
<div class="app-sidebar__overlay" data-toggle="sidebar"></div>
<%@include file="layout/menu.jsp" %>

<main class="app-content">
    <div class="app-title">
        <ul class="app-breadcrumb breadcrumb side">
            <li class="breadcrumb-item active"><a href="#"><b>Danh sách sản phẩm</b></a></li>
        </ul>
        <div id="clock"></div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="tile">
                <div class="tile-body">
                    <div class="row element-button">
                        <div class="col-sm-2">

                            <a class="btn btn-add btn-sm" href="<c:url value="/admin/addPro"/>" title="Thêm"><i
                                    class="fas fa-plus"></i>
                                Tạo mới sản phẩm</a>
                        </div>
                        <div class="col-sm-2">
                            <a class="btn btn-delete btn-sm nhap-tu-file" type="button" title="Nhập"
                               onclick="myFunction(this)"><i
                                    class="fas fa-file-upload"></i> Tải từ file</a>
                        </div>

                        <div class="col-sm-2">
                            <a class="btn btn-delete btn-sm print-file" type="button" title="In"
                               onclick="myApp.printTable()"><i
                                    class="fas fa-print"></i> In dữ liệu</a>
                        </div>
                        <div class="col-sm-2">
                            <a class="btn btn-delete btn-sm print-file js-textareacopybtn" type="button"
                               title="Sao chép"><i
                                    class="fas fa-copy"></i> Sao chép</a>
                        </div>

                        <div class="col-sm-2">
                            <a class="btn btn-excel btn-sm" href="" title="In"><i class="fas fa-file-excel"></i> Xuất
                                Excel</a>
                        </div>
                        <div class="col-sm-2">
                            <a class="btn btn-delete btn-sm pdf-file" type="button" title="In"
                               onclick="myFunction(this)"><i
                                    class="fas fa-file-pdf"></i> Xuất PDF</a>
                        </div>
                        <div class="col-sm-2">
                            <a class="btn btn-delete btn-sm" type="button" title="Xóa" onclick="myFunction(this)"><i
                                    class="fas fa-trash-alt"></i> Xóa tất cả </a>
                        </div>
                    </div>
                    <table class="table table-hover table-bordered" id="sampleTable">
                        <thead>
                        <tr>
                            <th width="10"><input type="checkbox" id="all"></th>
                            <th>Mã sản phẩm</th>
                            <th>Tên sản phẩm</th>
                            <th>Ảnh</th>
                            <th>Số lượng</th>
                            <th>Tình trạng</th>
                            <th>Giá tiền</th>
                            <th>Danh mục</th>
                            <th>Chức năng</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%--<c:forEach items="${listProduct}" var="product">--%>
                        <c:forEach items="${lsP}" var="product">
                            <tr>

                                <td width="10"><input type="checkbox" name="check1" value="1"></td>
                                <td>${product.id_product}</td>
                                <td>${product.name}</td>

                                <td><img src="<c:url value="/assets/user/img/${product.img}"/>" alt=""
                                         width="100px;">
                                </td>


                                <td>Số lượng chưa update</td>
                                <td><span class="badge bg-success">${product.status}</span>
                                    <c:if test="${product.status == null}"><span
                                            class="badge bg-danger">Run Out</span>
                                    </c:if>
                                </td>
                                <td><fmt:formatNumber type="number" value="${product.price}"/></td>
                                <c:forEach items="${lsC}" var="cate">
                                    <c:if test="${cate.id == product.id_category}">
                                        <td>${cate.name}</td>
                                    </c:if>
                                </c:forEach>
                                <td>
                                        <%--                                    <a href="<c:url value="/admin/delProduct/${product.id_product}"/>">--%>
                                    <button id="delProduct" class="btn btn-primary btn-sm trash" type="button"
                                            title="Xóa"
                                            onclick="myFunction(this)"><i class="fas fa-trash-alt"></i>
                                    </button>
                                        <%--                                    </a>--%>
                                    <a href="<c:url value="/admin/editProduct/${product.id_product}"/>">
                                        <button class="btn btn-primary btn-sm edit " type="button"
                                                title="Sửa" id="show-emp"
                                                data-toggle="modal"
                                                data-target="#ModalUP"><i class="fas fa-edit"></i></button>
                                    </a>

                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</main>

<!--
  MODAL
-->
<%--<div class="modal fade" id="ModalUP" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static"--%>
<%--     data-keyboard="false">--%>
<%--    <div class="modal-dialog modal-dialog-centered" role="document">--%>
<%--        <div class="modal-content">--%>

<%--            <div class="modal-body">--%>
<%--                <div class="row">--%>
<%--                    <div class="form-group  col-md-12">--%>
<%--          <span class="thong-tin-thanh-toan">--%>
<%--            <h5>Chỉnh sửa thông tin sản phẩm cơ bản</h5>--%>
<%--          </span>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <form action="">--%>
<%--                    <div class="row">--%>
<%--                        <div class="form-group col-md-6">--%>
<%--                            <label class="control-label">Mã sản phẩm </label>--%>
<%--                            <input class="form-control" type="number" value="71309005">--%>
<%--                        </div>--%>
<%--                        <div class="form-group col-md-6">--%>
<%--                            <label class="control-label">Tên sản phẩm</label>--%>
<%--                            <input class="form-control" type="text" required value="Bàn ăn gỗ Theresa">--%>
<%--                        </div>--%>
<%--                        <div class="form-group  col-md-6">--%>
<%--                            <label class="control-label">Số lượng</label>--%>
<%--                            <input class="form-control" type="number" required value="20">--%>
<%--                        </div>--%>
<%--                        <div class="form-group col-md-6 ">--%>
<%--                            <label for="exampleSelect1" class="control-label">Tình trạng sản phẩm</label>--%>
<%--                            <select class="form-control" id="exampleSelect1">--%>
<%--                                <option>Còn hàng</option>--%>
<%--                                <option>Hết hàng</option>--%>
<%--                                <option>Đang nhập hàng</option>--%>
<%--                            </select>--%>
<%--                        </div>--%>
<%--                        <div class="form-group col-md-6">--%>
<%--                            <label class="control-label">Giá bán</label>--%>
<%--                            <input class="form-control" type="text" value="5.600.000">--%>
<%--                        </div>--%>
<%--                        <div class="form-group col-md-6">--%>
<%--                            <label for="exampleSelect1" class="control-label">Danh mục</label>--%>
<%--                            <select class="form-control" id="exampleSelect1">--%>
<%--                                <option>Bàn ăn</option>--%>
<%--                                <option>Bàn thông minh</option>--%>
<%--                                <option>Tủ</option>--%>
<%--                                <option>Ghế gỗ</option>--%>
<%--                                <option>Ghế sắt</option>--%>
<%--                                <option>Giường người lớn</option>--%>
<%--                                <option>Giường trẻ em</option>--%>
<%--                                <option>Bàn trang điểm</option>--%>
<%--                                <option>Giá đỡ</option>--%>
<%--                            </select>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <BR>--%>
<%--                    <a href="#" style="    float: right;--%>
<%--    font-weight: 600;--%>
<%--    color: #ea0000;">Chỉnh sửa sản phẩm nâng cao</a>--%>
<%--                    <BR>--%>
<%--                    <BR>--%>
<%--                    <button class="btn btn-save" type="button">Lưu lại</button>--%>
<%--                    <a class="btn btn-cancel" data-dismiss="modal" href="#">Hủy bỏ</a>--%>
<%--                    <BR>--%>
<%--                </form>--%>
<%--            </div>--%>
<%--            <div class="modal-footer">--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>

<script>
    $(document).ready(function () {
        $("#sampleTable").on("click", "#delProduct", function () {
            var productId = $(this).closest('tr').find('td:eq(1)').text();
            if (confirm("Bạn có chắc muốn xóa sản phẩm này?")) {
                $.ajax({
                    url: '/WebSpringMVC_war/admin/delProduct/' + productId,
                    type: 'GET',
                    success: function (result) {
                        window.location.href = "/WebSpringMVC_war/admin/products";
                    },
                    error: function (error) {
                        alert("Error" + error);
                        alert(productId);

                    }
                });
            }
        });

        $(document).ready(function () {
            $('.edit-product-btn').click(function () {
                //  var productId = $(this).data('product-id');
                var productId = $(this).closest('tr').find('td:eq(1)').text();
                $.ajax({
                    url: '/WebSpringMVC_war/admin/editProduct/' + productId,
                    type: 'GET',
                    success: function (data) {
                        $('#edit-product-modal .modal-body').html(data);
                        $('#edit-product-modal').modal('show');
                    }
                });
            });
        });


    });


</script>


<%--FOOTER-MODAL --%>
<%@include file="layout/footer.jsp" %>
</body>

</html>