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
    <script src="<c:url value="/assets/user/js/jquery.easing-1.3.min.js" />"></script>
    <script src="<c:url value="/assets/user/js/jquery.scrollTo-1.4.3.1-min.js" />"></script>
</head>
<body>
<div class="row">
    <div class="span12">
        <ul class="breadcrumb">
            <li><a href="index.html">Home</a> <span class="divider">/</span></li>
            <li class="active">Check Out</li>
        </ul>
        <div class="well well-small">
            <h1>Check Out <small class="pull-right"> ${Cart.size()} Items are in the cart </small></h1>
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
                    <tr id="cart-items">
                        <td><img width="100" src="<c:url value="/assets/user/img/${item.value.productsDto.img}" />"
                                 alt=""></td>
                        <td>${item.value.productsDto.name}<br>Carate : 22<br>Model : n/a</td>
                        <td> -</td>
                        <td><span class="shopBtn"><span class="icon-ok"></span></span></td>
                        <td><fmt:formatNumber
                                type="number" groupingUsed="true" value="${item.value.productsDto.price}"/>đ
                        </td>
                        <td>
                                <%--                            id="appendedInputButtons"
                                 href="<c:url value="/editcart/1/5"/>"
                                --%>
                            <input class="span1 quantityInput" style="max-width:34px" placeholder="1"
                                   id="quantity-cart-${item.key}"
                                   size="16" type="number" min="0" max="1000" value="${item.value.quantity}">
                            <div class="input-append">
                                    <%--                                <button name="down-product" class="btn btn-mini" type="button">-</button>--%>
                                    <%--                                <button name="up-product" class="btn btn-mini" type="button"> +</button>--%>
                                    <%--   <button href="<c:url value="/editcart/1"/>" class="btn btn-mini btn-danger" type="button"><span class="icon-remove" ></span>
                                       </button>--%>
                                <button data-id="${item.key}"
                                        class="btn btn-mini btn-warning edit-card"
                                        type="button">
                                    <span class="icon-edit"></span>
                                </button>
                                <a href="<c:url value="deletecart/${item.value.productsDto.id_product}"/>"
                                   class="btn btn-mini btn-danger"
                                   type="button"
                                   id="remove-cart">
                                    <span class="icon-remove"></span>
                                </a>
                                    <%--                                href="<c:url value="/deleteCart/1"/>"--%>
                            </div>
                        </td>
                        <td id="totalPriceOfOneItem"><fmt:formatNumber
                                type="number" groupingUsed="true" value="${item.value.totalPrice}"/>đ
                        </td>
                    </tr>
                </c:forEach>
                <%--                <tr>--%>
                <%--                    <td colspan="6" class="alignR">Total products:</td>--%>
                <%--                    <td> $448.42</td>--%>
                <%--                </tr>--%>
                <%--                <tr>--%>
                <%--                    <td colspan="6" class="alignR">Total products:</td>--%>
                <%--                    <td> $448.42</td>--%>
                <%--                </tr>--%>
                <%--                <tr>--%>
                <%--                    <td colspan="6" class="alignR">Total products:</td>--%>
                <%--                    <td> $448.42</td>--%>
                <%--                </tr>--%>
                <tr>
                    <td colspan="6" class="alignR">Total products:</td>
                    <td class="label label-success"><fmt:formatNumber
                            type="number" groupingUsed="true" value="${totalCartPrice}"/>đ
                    </td>
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
<content tag="script">
    <script>
        $(".edit-card").on('click', function () {
            var id = $(this).data("id");
            var quantity = $('#quantity-cart-' + id).val();
            alert("Amount of this Item is:  " + quantity);
            window.location = "editcart/" + id + "/" + quantity;

        });

    </script>

</content>

</body>

<%--
<script>
    var xhttp;

    // initRequest() dùng để khỏi tạo ajax cho phù hợp với từng trình duyệt
    function initRequest() {
        if (window.XMLHttpRequest) {
            // dành cho hầu hết trình duyệt
            xhttp = new XMLHttpRequest();

        }//dành cho trình duyệt InternetExporer
        xhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }

    //ajax xóa sp khỏi giỏ hàng- chưa xong
    $(document).on('click', '#remove-cart', function (event) {
        event.preventDefault();
        var productID = $(this).data('id').data('#remove-cart')
        $.ajax({
            type: 'POST',
            url: '/deletecart',
            data: {'id': productID},
            success: function (response) {
                // Cập nhật giỏ hàng trên trang
                //  $('#cart-items').html(response);
                alert('Item removed from cart');
            }
        })
            .fail(function () {
                alert('Failed to remove product from cart');
            });
    })
</script>--%>
