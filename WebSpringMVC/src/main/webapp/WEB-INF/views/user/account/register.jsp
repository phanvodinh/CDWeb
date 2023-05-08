<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 3/15/2023
  Time: 11:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="row">
    <div id="sidebar" class="span3">
        <div class="well well-small">
            <ul class="nav nav-list">
                <li><a href="products.html"><span class="icon-chevron-right"></span>Fashion</a></li>
                <li><a href="products.html"><span class="icon-chevron-right"></span>Watches</a></li>
                <li><a href="products.html"><span class="icon-chevron-right"></span>Fine Jewelry</a></li>
                <li><a href="products.html"><span class="icon-chevron-right"></span>Fashion Jewelry</a></li>
                <li><a href="products.html"><span class="icon-chevron-right"></span>Engagement & Wedding</a></li>
                <li><a href="products.html"><span class="icon-chevron-right"></span>Men's Jewelry</a></li>
                <li><a href="products.html"><span class="icon-chevron-right"></span>Vintage & Antique</a></li>
                <li><a href="products.html"><span class="icon-chevron-right"></span>Loose Diamonds </a></li>
                <li><a href="products.html"><span class="icon-chevron-right"></span>Loose Beads</a></li>
                <li><a href="products.html"><span class="icon-chevron-right"></span>See All Jewelry & Watches</a></li>
                <li style="border:0"> &nbsp;</li>
                <li><a class="totalInCart" href="cart.html"><strong>Total Amount <span
                        class="badge badge-warning pull-right" style="line-height:18px;">$448.42</span></strong></a>
                </li>
            </ul>
        </div>

        <div class="well well-small alert alert-warning cntr">
            <h2>50% Discount</h2>
            <p>
                only valid for online order. <br><br><a class="defaultBtn" href="#">Click here </a>
            </p>
        </div>
        <div class="well well-small"><a href="#"><img src="assets/img/paypal.jpg" alt="payment method paypal"></a></div>

        <a class="shopBtn btn-block" href="#">Upcoming products <br><small>Click to view</small></a>
        <br>
        <br>
        <ul class="nav nav-list promowrapper">
            <li>
                <div class="thumbnail">
                    <a class="zoomTool" href="product_details.html" title="add to cart"><span
                            class="icon-search"></span> QUICK VIEW</a>
                    <img src="assets/img/bootstrap-ecommerce-templates.png" alt="bootstrap ecommerce templates">
                    <div class="caption">
                        <h4><a class="defaultBtn" href="product_details.html">VIEW</a> <span
                                class="pull-right">$22.00</span></h4>
                    </div>
                </div>
            </li>
            <li style="border:0"> &nbsp;</li>
            <li>
                <div class="thumbnail">
                    <a class="zoomTool" href="product_details.html" title="add to cart"><span
                            class="icon-search"></span> QUICK VIEW</a>
                    <img src="assets/img/shopping-cart-template.png" alt="shopping cart template">
                    <div class="caption">
                        <h4><a class="defaultBtn" href="product_details.html">VIEW</a> <span
                                class="pull-right">$22.00</span></h4>
                    </div>
                </div>
            </li>
            <li style="border:0"> &nbsp;</li>
            <li>
                <div class="thumbnail">
                    <a class="zoomTool" href="product_details.html" title="add to cart"><span
                            class="icon-search"></span> QUICK VIEW</a>
                    <img src="assets/img/bootstrap-template.png" alt="bootstrap template">
                    <div class="caption">
                        <h4><a class="defaultBtn" href="product_details.html">VIEW</a> <span
                                class="pull-right">$22.00</span></h4>
                    </div>
                </div>
            </li>
        </ul>

    </div>
    <div class="span9">
        <ul class="breadcrumb">
            <li><a href="index.html">Home</a> <span class="divider">/</span></li>
            <li class="active">Đăng Ký - Đăng Nhập</li>
        </ul>
        <h3> Login</h3>
        <hr class="soft"/>
        <%--sign up--%>
        <div class="row">
            <div class="span4">
                <div class="well">
                    <h5>Đăng Ký</h5><br/>


                    <form:form method="post" action="dang-ky" modelAttribute="signup" lang="vi" >
                        <div class="control-group">
                            <label class="control-label" for="inputEmail">E-mail</label>
                            <div class="controls">
                                    <%--                                <input class="span3" id="inputEmail" type="text" placeholder="Email">--%>
                                <form:input type="email" class="span3" placeholder="Email" id="inputEmail" path="user"/>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="inputPassword">Mật khẩu</label>
                            <div class="controls">
                                    <%--                                <input class="span3" id="inputPassword" type="text" placeholder="Mật khẩu">--%>
                                <form:input type="password" class="span3" placeholder="Mật khẩu" id="inputPassword"
                                            path="password"/>

                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="inputName">Tên</label>
                            <div class="controls">
                                    <%--                                <input class="span3" id="inputName" type="text" placeholder="Tên">--%>
                                <form:input type="text" class="span3" placeholder="Tên" id="inputName"
                                            path="displayName" lang="vi"/>

                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="inputAddress">Địa chỉ</label>
                            <div class="controls">
                                    <%--                                <input class="span3" id="inputAddress" type="text" placeholder="Địa chỉ">--%>
                                <form:input type="text" class="span3" placeholder="Địa chỉ" id="inputAddress"
                                            path="address" lang="vi"/>

                            </div>
                        </div>
                        <div class="controls">
                            <button type="submit" class="btn block">Đăng ký</button>
                        </div>
                    </form:form>
                </div>
            </div>

            <%--login--%>
            <div class="span1"> &nbsp;</div>
            <div class="span4">
                <div class="well">
                    <h5> Đăng Nhập </h5>
                    <form:form method="post" action="dang-nhap" modelAttribute="signup" lang="vi">
                        <div class="control-group">
                            <label class="control-label" for="inputEmail">Email</label>
                            <div class="controls">
                                    <%--                                <input class="span3" type="text" placeholder="Email">--%>
                                <form:input type="email" class="span3" placeholder="Email" id="inputEmail" path="user" />

                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="inputPassword">Mật Khẩu</label>
                            <div class="controls">
<%--                                <input type="password" class="span3" placeholder="Password">--%>
                                <form:input type="password" class="span3" placeholder="Mật khẩu" id="inputPassword"
                                            path="password"/>
                            </div>
                        </div>
                        <div class="control-group">
                            <div class="controls">
                                <button type="submit" class="defaultBtn">Đăng Nhập</button>
                                <a href="#">Quên mật khẩu ?</a>
                            </div>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>

    </div>
</div>

</body>
</html>
