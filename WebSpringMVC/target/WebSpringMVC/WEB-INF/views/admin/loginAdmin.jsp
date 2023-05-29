<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 5/25/2023
  Time: 3:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>

    <title>Đăng nhập quản trị | Website quản trị v2.0</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%--    <link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">--%>
    <%--    <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">--%>
    <%--    <link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">--%>
    <%--    <link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">--%>
    <%--    <link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">--%>
    <link rel="stylesheet" type="text/css" href="<c:url value="/assets/admin/css/util.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/assets/admin/css/main.css"/>">
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-sweetalert/1.0.1/sweetalert.min.css">
    <script src="<c:url value="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"/>"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
    <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
</head>
<body>
<div class="limiter">
    <div class="container-login100">
        <div class="wrap-login100">
            <div class="login100-pic js-tilt" data-tilt>
                <img src="<c:url value="/assets/admin/images/team.jpg"/>" alt="IMG">
            </div>
            <!--=====TIÊU ĐỀ======-->
            <form class="login100-form validate-form" action="<c:url value="/admin/authenticate"/>" method="post">
                    <span class="login100-form-title">
                        <b>ĐĂNG NHẬP </b>
                    </span>
                <!--=====FORM INPUT TÀI KHOẢN VÀ PASSWORD======-->

                <div class="wrap-input100 validate-input">
                    <input class="input100" type="text" placeholder="Tài khoản quản trị" name="user"
                           id="username" required>
                    <span class="focus-input100"></span>
                    <span class="symbol-input100">
                                <i class='bx bx-user'></i>
                            </span>
                </div>
                <div class="wrap-input100 validate-input">
                    <input autocomplete="off" class="input100" type="password" placeholder="Mật khẩu"
                           name="password" id="password-field" required>
                    <span toggle="#password-field" class="bx fa-fw bx-hide field-icon click-eye"></span>
                    <span class="focus-input100"></span>
                    <span class="symbol-input100">
                                <i class='bx bx-key'></i>
                            </span>
                </div>

                <!--=====ĐĂNG NHẬP======-->
                <div class="container-login100-form-btn">
                    <input class="" type="submit" value="Đăng nhập" id="submit"/>
                </div>
                <%--                <button type="submit">Đăng nhập</button>--%>
                <!--=====LINK TÌM MẬT KHẨU======-->
                <div class="text-right p-t-12">
                    <a class="txt2" href="/forgot.html">
                        Bạn quên mật khẩu?
                    </a>
                </div>
            </form>
        </div>
    </div>
</div>
<!--Javascript-->
<script src="<c:url value="/assets/admin/js/main.js"></c:url> "></script>
<%--<script src="https://unpkg.com/boxicons@latest/dist/boxicons.js"></script>--%>
<%--<script src="vendor/jquery/jquery-3.2.1.min.js"></script>--%>
<%--<script src="vendor/bootstrap/js/popper.js"></script>--%>
<%--<script src="vendor/bootstrap/js/bootstrap.min.js"></script>--%>
<%--<script src="vendor/select2/select2.min.js"></script>--%>
<script type="text/javascript">
    //show - hide mật khẩu
    function myFunction() {
        var x = document.getElementById("myInput");
        if (x.type === "password") {
            x.type = "text"
        } else {
            x.type = "password";
        }
    }

    $(".click-eye").click(function () {
        $(this).toggleClass("bx-show bx-hide");
        var input = $($(this).attr("toggle"));
        if (input.attr("type") == "password") {
            input.attr("type", "text");
        } else {
            input.attr("type", "password");
        }
    });
</script>
</body>

<%--<%@include file="layout/footer.jsp" %>--%>

</html>
