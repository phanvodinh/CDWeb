<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 1/5/2023
  Time: 2:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<header id="header">
    <div class="row">
        <div class="span4">
            <h1>
                <a class="logo" href="<c:url value="/trang-chu"/> "><span>Twitter Bootstrap ecommerce template</span>
                    <img src=" <c:url value="/assets/user/img/logo-bootstrap-shoping-cart.png" />"
                         alt="bootstrap sexy shop">
                </a>
            </h1>
        </div>
        <div class="span4">
            <div class="offerNoteWrapper">
                <h1 class="dotmark">
                    <i class="icon-cut"></i>
                    Twitter Bootstrap shopping cart HTML template is available @ $14
                </h1>
            </div>
        </div>
        <div class="span4 alignR">
            <p><br> <strong> Support (24/7) : 0800 1234 678 </strong><br><br></p>
            <span class="btn btn-mini">[ ${ totalCartQuantity} ] <span class="icon-shopping-cart"></span></span>
            <span class="btn btn-warning btn-mini">$</span>
            <span class="btn btn-mini">&pound;</span>
            <span class="btn btn-mini">&euro;</span>
        </div>
    </div>
</header>

<!--
Navigation Bar Section
-->
<div class="navbar">
    <div class="navbar-inner">
        <div class="container">
            <a data-target=".nav-collapse" data-toggle="collapse" class="btn btn-navbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </a>
            <div class="nav-collapse">
                <ul class="nav">
                    <%--                   LOAD MENU- nếu muốn thêm nhiều menu thì chỉ cần vào db rồi thêm nó--%>
                    <c:forEach var="item" items="${menus}">
                        <li class=""><a href="<c:url value="/${item.url}"/>">${item.name} </a></li>
                    </c:forEach>

                </ul>
                <form action="#" class="navbar-search pull-left">
                    <input type="text" placeholder="Search" class="search-query span2">
                </form>
                <ul class="nav pull-right">
                    <li class="dropdown">
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#"><span class="icon-lock"></span>
                            Login <b class="caret"></b></a>
                        <div class="dropdown-menu">
                            <form class="form-horizontal loginFrm">
                                <div class="control-group">
                                    <input type="text" class="span2" id="inputEmail" placeholder="Email">
                                </div>
                                <div class="control-group">
                                    <input type="password" class="span2" id="inputPassword" placeholder="Password">
                                </div>
                                <div class="control-group">
                                    <label class="checkbox">
                                        <input type="checkbox"> Remember me
                                    </label>
                                    <button type="submit" class="shopBtn btn-block">Sign in</button>
                                </div>
                            </form>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
</html>
