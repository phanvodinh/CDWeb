<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
            <li class="breadcrumb-item active"><a href="#"><b>Danh sách đơn hàng</b></a></li>
        </ul>
        <div id="clock"></div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="tile">
                <div class="tile-body">
                    <div class="row element-button">
                        <div class="col-sm-2">

                            <a class="btn btn-add btn-sm" href="form-add-don-hang.html" title="Thêm"><i
                                    class="fas fa-plus"></i>
                                Tạo mới đơn hàng</a>
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
                            <th>ID đơn hàng</th>
                            <th>Khách hàng</th>
                            <th>Địa chỉ</th>
                            <th>Số lượng</th>
                            <th>Tổng tiền</th>
                            <th>Tình trạng</th>
                            <th>Tính năng</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="order" items="${lsOrder}">
                            <tr>
                                <td width="10"><input type="checkbox" name="check1" value="1"></td>
                                <td id="orderID">${order.id}</td>
                                <td>${order.display_name}</td>
                                <td>${order.address}</td>
                                <td>${order.quantity}</td>
                                <td><fmt:formatNumber type="number" value="${order.total}"/>đ</td>
                                <td><span class="badge bg-success">Hoàn thành</span></td>
                                <td>
                                    <button class="btn btn-primary btn-sm trash" id="btnDel" type="button" title="Xóa">
                                        <i
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
            // Lấy ID của order
            var orderId = $(this).closest("tr").find("td:eq(1)").text();

            // Xác nhận việc xóa order
            if (confirm("Bạn có chắc chắn muốn xóa đơn hàng này?" + orderId)) {
                // Gửi request DELETE đến URL /admin/category/${id}
                $.ajax({
                    url: "/WebSpringMVC_war/admin/deleteOrder/" + orderId,
                    type: "GET",
                    success: function (response) {
                        // Xóa category khỏi danh sách
                        $(orderId).closest("tr").remove();
                         location.reload(true);
                    },
                    error: function (xhr, status, error) {
                        alert("Error: " + error);
                    }
                });
            }
        });
    });


</script>
</body>

</html>