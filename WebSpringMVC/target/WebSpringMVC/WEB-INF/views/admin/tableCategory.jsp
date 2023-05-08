<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
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

                            <a class="btn btn-add btn-sm" href="form-add-bi-cam.html" title="Thêm"><i
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
                            <%--                            <th>Lý do cấm</th>--%>
                            <%--                            <th>Tình trạng</th>--%>
                            <%--                            <th>Chức năng</th>--%>
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
                                    <a class="delete-link" data-id="${cate.id}">
                                        <button class="btn btn-primary btn-sm trash  "
                                                id="btnDel" type="button" title="Xóa"><i
                                                class="fas fa-trash-alt"></i></button>
                                        <a/>
                                        <button class="btn-delete" type="button" title="Xóa"><i
                                                class="fas fa-trash-alt"></i></button>
                                        <button class="btn btn-primary btn-sm edit" type="button" title="Sửa"><i
                                                class="fa fa-edit"></i></button>
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
                        location.reload(true);
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
<%--<script type="text/javascript">--%>
<%--    $(document).ready(function() {--%>
<%--        $(".btn-delete").click(function(event) {--%>
<%--            event.preventDefault();--%>
<%--            var categoryId = $(this).closest("tr").find("td:eq(1)").text();--%>
<%--            var tr = $(this).closest("tr");--%>
<%--            $.ajax({--%>
<%--                url: "/admin/categories/delete/" + categoryId,--%>
<%--                type: "DELETE",--%>
<%--                success: function(response) {--%>
<%--                    if (response === "success") {--%>
<%--                        tr.remove();--%>
<%--                    } else {--%>
<%--                        alert("An error occurred while deleting the category.");--%>
<%--                    }--%>
<%--                },--%>
<%--                error: function() {--%>
<%--                    alert("An error occurred while deleting the category.");--%>
<%--                }--%>
<%--            });--%>
<%--        });--%>
<%--    });--%>
<%--</script>--%>
</body>
</html>