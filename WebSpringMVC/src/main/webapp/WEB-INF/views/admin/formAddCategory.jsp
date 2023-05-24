<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Danh sách đơn hàng | Quản trị Admin</title>

    <%@include file="layout/header.jsp" %>
</head>

<body onload="time()" class="app sidebar-mini rtl">
<%@include file="layout/navbar.jsp" %>

<!-- Sidebar menu-->
<div class="app-sidebar__overlay" data-toggle="sidebar"></div>
<%@include file="layout/menu.jsp" %>
<main class="app-content">
    <div class="app-title">
        <ul class="app-breadcrumb breadcrumb">
            <li class="breadcrumb-item">Main</li>
            <li class="breadcrumb-item"><a href="<c:url value="/admin/category"/>">Category</a></li>
        </ul>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="tile">
                <h3 class="tile-title">Tạo mới danh sách nội bộ</h3>
                <div class="tile-body">
                    <div class="row element-button">
                        <div class="col-sm-2">
                            <a class="btn btn-add btn-sm" data-toggle="modal"
                               data-target="#exampleModalCenter"><b><i
                                    class="fas fa-folder-plus"></i> Tạo tình trạng mới</b></a>
                        </div>

                    </div>

                    <form class="row" method="post" action="<c:url value="/admin/addCategory"/>">
                        <div class="form-group col-md-4">
                            <label class="control-label">Tên danh mục</label>
                            <input class="form-control" name="name" type="text" required="required">
                        </div>

                        <div class="form-group col-md-4">
                            <label class="control-label">Mô tả</label>
                            <input class="form-control" name="description" rows="4"></input>
                        </div>
                        <div class="tile-footer">
                        </div>
                        <BR>

                        <button class="btn btn-add " type="submit">Lưu lại</button>
                        <a class=" btn btn-cancel" href="<c:url value="/admin/main"/>">
                            Hủy
                        </a>
                    </form>
                </div>
            </div>
        </div>
    </div>

</main>


<%@include file="layout/footer.jsp" %>

</body>
F
</html>