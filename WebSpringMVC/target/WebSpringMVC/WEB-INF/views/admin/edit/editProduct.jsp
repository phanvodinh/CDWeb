<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 5/22/2023
  Time: 11:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Form</title>
    <style>
        /* Reset CSS */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /* Style form container */
        .form-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f4f4f4;
        }

        /* Style form */
        form {
            width: 500px;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #fff;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
        }

        /* Style form fields */
        label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
            color: #333;
        }

        input, select {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: none;
            border-bottom: 2px solid #ccc;
            font-size: 16px;
            color: #555;
            transition: border-bottom-color 0.3s ease-in-out;
        }

        input:focus, select:focus {
            outline: none;
            border-bottom-color: #007bff;
        }

        select {
            height: 40px;
        }

        input[type="submit"], input[type="reset"] {
            display: inline-block;
            background-color: #007bff;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            transition: background-color 0.3s ease-in-out;
        }

        input[type="submit"]:hover, input[type="reset"]:hover {
            background-color: #0069d9;
        }
    </style>
</head>
<body>
<div class="form-container">

    <form id="updateProductForm" action="<c:url value="/admin/listProduct/${product.id_product}/update"/>"
          method="POST">
        <%--    <form id="updateProductForm">--%>

        <label for="idProduct">Mã sản phẩm</label>
        <input type="text" id="idProduct" name="id_product" value="${product.id_product}" required readonly>

        <label for="productName">Tên sản phẩm</label>
        <input type="text" id="productName" name="name" value="${product.name}">

        <label for="productStatus">Tình trạng</label>
        <select id="productStatus" name="status">
            <option value="available" >Có sẵn</option>
            <option value="runout">Hết hàng</option>
        </select>

        <label for="productPrice">Giá bán</label>
        <input type="number" id="productPrice" name="price" value="${product.price}">

        <label for="productCategory">Danh mục</label>
        <select id="productCategory" name="id_category">
            <c:forEach items="${lsCate}" var="category">
                <option value="${category.id}"> ${category.name}</option>
            </c:forEach>
        </select>

        <div>
            <input type="submit" value="Lưu">
            <input type="reset" value="Hủy">
        </div>
    </form>
</div>

</body>
</html>