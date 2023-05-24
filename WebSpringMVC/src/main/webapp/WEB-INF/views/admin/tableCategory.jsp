<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Danh sách đơn hàng | Quản trị Admin</title>
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
            <li class="breadcrumb-item active"><a href="#"><b>Quản lý nội bộ</b></a></li>
        </ul>
        <div id="clock"></div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="tile">
                <div class="tile-body">
                    <div class="row element-button">
                        <div class="col-sm-2">

                            <a class="btn btn-add btn-sm" href="<c:url value="/admin/AddCate"/>" title="Thêm"><i
                                    class="fas fa-plus"></i>
                                Tạo mới</a>
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
                            <th>ID</th>
                            <th>Tên Danh Mục</th>
                            <th>Mô tả</th>

                        </tr>
                        </thead>
                        <tbody>


                        <c:forEach items="${lsCate}" var="cate">
                            <tr>
                                <td width="10"><input type="checkbox" name="check1" value="1"></td>
                                <td id="cateID">${cate.id}</td>
                                <td>${cate.name}</td>
                                <td>${cate.description}
                                </td>
                                    <%--                                <td><span class="badge bg-danger">Sa thải</span></td>--%>
                                <td>
                                        <%--                                    <a href="<c:url value="/admin/deleteCate/${cate.id}"/>">--%>
                                        <%--button delete category--%>
                                    <a class="delete-link" data-id="${cate.id}">
                                        <button class="btn btn-primary btn-sm trash  "
                                                id="btnDel" type="button" title="Xóa"><i
                                                class="fas fa-trash-alt"></i></button>
                                        <a/>
                                            <%--button edit category--%>
                                        <a href="<c:url value="category/${cate.id}/editCate"/>">
                                            <button class="btn btn-primary btn-sm edit" type="button" title="Sửa"><i
                                                    data-toggle="modal"
                                                    data-id="${cate.id}" id="edit-category" data-target="#ModalUP"
                                                    class="fa fa-edit" ></i></button>


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
<%--MODAL--%>
<%--<div class="modal fade" id="ModalUP" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static" div--%>
<%--     data-keyboard="false">--%>
<%--    &lt;%&ndash;    <form action="<c:url value="category/${cateByID.id}/editCate"/>" method="post">&ndash;%&gt;--%>
<%--    <form>--%>
<%--        <div class="modal-dialog modal-dialog-centered" role="document">--%>
<%--            <div class="modal-content">--%>

<%--                <div class="modal-body">--%>
<%--                    <div class="row">--%>
<%--                        <div class="form-group  col-md-12">--%>
<%--          <span class="thong-tin-thanh-toan">--%>
<%--            <h5>Chỉnh sửa thông tin sản phẩm cơ bản</h5>--%>
<%--          </span>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="row">--%>
<%--                        <div class="form-group col-md-6">--%>
<%--                            <label class="control-label">Mã sản phẩm </label>--%>
<%--                            <input class="form-control" type="number" value="">--%>
<%--                        </div>--%>
<%--                        <div class="form-group col-md-6">--%>
<%--                            <label class="control-label">Tên sản phẩm</label>--%>
<%--                            <input class="form-control" id="name" type="text" value="">--%>
<%--                        </div>--%>
<%--                        <div class="form-group  col-md-6">--%>
<%--                            <label class="control-label">Số lượng</label>--%>
<%--                            <input class="form-control" id="description" type="text" value="20">--%>
<%--                        </div>--%>


<%--                    </div>--%>
<%--                    <BR>--%>
<%--                    <a href="#" style="    float: right;--%>
<%--    font-weight: 600;--%>
<%--    color: #ea0000;">Chỉnh sửa sản phẩm nâng cao</a>--%>
<%--                    <BR>--%>
<%--                    <BR>--%>
<%--                    <button class="btn btn-save" type="submit">Lưu lại</button>--%>
<%--                    <a class="btn btn-cancel" data-dismiss="modal" href="#">Hủy bỏ</a>--%>
<%--                    <BR>--%>
<%--                </div>--%>
<%--                <div class="modal-footer">--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </form>--%>
<%--</div>--%>

<%--New Modal--%>
<div id="edit-modal" style="display: none;">
    <form id="edit-form" action="" method="post">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name">
        <br>
        <label for="description">Description:</label>
        <textarea id="description" name="description"></textarea>
        <br>
        <input type="submit" value="Save">
    </form>
</div>

<!-- Essential javascripts for application to work-->
<%@include file="layout/footer.jsp" %>
<script>
    $(document).ready(function () {
        // Xử lý sự kiện khi nhấn nút Xóa
        $("#sampleTable").on("click", "#btnDel", function () {
            // Lấy ID của category
            var categoryId = $(this).closest("tr").find("td:eq(1)").text();
            //  var categoryId = $("#cateID").text();
            // Xác nhận việc xóa category
            if (confirm("Bạn có chắc chắn muốn xóa category này?")) {
                // Gửi request DELETE đến URL /admin/category/${id}
                $.ajax({
                    url: "http://localhost:8080/WebSpringMVC_war/admin/deleteCate/" + categoryId,
                    type: "GET",
                    success: function (response) {
                        // Xóa category khỏi danh sách
                        $(this).closest("tr").remove();
                        location.reload(false);
                    },
                    error: function (xhr, status, error) {
                        alert(categoryId);
                        alert("Error: " + error);
                    }
                });
            }
        });
    });
</script>
<script>
    //hiển thị modal khi click vào btn category
    $("#edit-category").click(function () {
        var id = $(this).data("id");
        $.get("/category/" + id + "/editCate", function (data) {
            $("#edit-modal").html(data);
            $("#edit-modal").show();
        });
    });
    $("#edit-form").submit(function () {
        var id = $("#edit-category-id").val();
        var name = $("#name").val();
        var description = $("#description").val();
        $.ajax({
            url: "/category/" + id + "/editCate",
            type: "POST",
            data: {
                name: name,
                description: description
            },
            success: function () {
                location.reload();
            },
            error: function (error) {
                alert("đã xảy ra lỗi");
                alert("Error: " + error);
            }
        });
        return false;
    });
</script>
</body>
</html>