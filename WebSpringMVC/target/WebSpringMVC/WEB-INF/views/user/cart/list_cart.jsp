<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2/22/2023
  Time: 10:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
    <title>List Cart</title>
</head>
<body>
<div class="row">
    <div class="span12">
        <ul class="breadcrumb">
            <li><a href="index.html">Home</a> <span class="divider">/</span></li>
            <li class="active">Check Out</li>
        </ul>
        <div class="well well-small">
            <h1>Check Out <small class="pull-right"> 2 Items are in the cart </small></h1>
            <hr class="soften"/>

            <table class="table table-bordered table-condensed">
                <thead>
                <tr>
                    <th>Product</th>
                    <th>Description</th>
                    <th> Ref.</th>
                    <th>Avail.</th>
                    <th>Unit price</th>
                    <th>Qty</th>
                    <th>Total</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="item" items="${ Cart }">
                    <tr>
                        <td><img width="100" src="assets/img/e.jpg" alt=""></td>
                        <td>Items name here<br>Carate : 22<br>Model : n/a</td>
                        <td> -</td>
                        <td><span class="shopBtn"><span class="icon-ok"></span></span></td>
                        <td>$50.00</td>
                        <td>
                            <input class="span1" style="max-width:34px" placeholder="1" id="appendedInputButtons"
                                   size="16" type="number" min="0" max="1000" value="2">
                            <div class="input-append">
                                <button name="down-product" class="btn btn-mini" type="button">-</button>
                                <button name="up-product" class="btn btn-mini" type="button"> +</button>
                                    <%--   <button href="<c:url value="/editcart/1"/>" class="btn btn-mini btn-danger" type="button"><span class="icon-remove" ></span>
                                       </button>--%>
                                <a href="<c:url value="/editCart/1"/>"  class="btn btn-mini btn-danger" type="button">
                                    <span class="icon-remove"></span>
                                </a>
                            </div>
                        </td>
                        <td>$100.00</td>
                    </tr>
                </c:forEach>
                <tr>
                    <td colspan="6" class="alignR">Total products:</td>
                    <td> $448.42</td>
                </tr>
                <tr>
                    <td colspan="6" class="alignR">Total products:</td>
                    <td> $448.42</td>
                </tr>
                <tr>
                    <td colspan="6" class="alignR">Total products:</td>
                    <td> $448.42</td>
                </tr>
                <tr>
                    <td colspan="6" class="alignR">Total products:</td>
                    <td class="label label-primary"> $448.42</td>
                </tr>
                </tbody>
            </table>
            <br/>


            </table>
            <a href="products.html" class="shopBtn btn-large"><span class="icon-arrow-left"></span> Tiếp tục mua sắm
            </a>
            <a href="login.html" class="shopBtn btn-large pull-right">Thanh toán <span
                    class="icon-arrow-right"></span></a>

        </div>
    </div>
</div>

</body>

