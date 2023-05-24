<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 5/12/2023
  Time: 5:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style>
        /* Thiết lập font chữ và độ rộng form */
        body {
            font-family: Arial, sans-serif;
            width: 500px;
            margin: 0 auto;
        }

        /* Thiết lập khoảng cách giữa các phần tử */
        h1 {
            margin-top: 20px;
            margin-bottom: 20px;
            text-align: center;
        }
        label {
            display: block;
            margin-bottom: 5px;
        }
        input[type="text"], textarea {
            width: 100%;
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 3px;
            margin-bottom: 15px;
        }
        input[type="submit"], input[type="button"] {
            display: inline-block;
            padding: 5px 15px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }
        input[type="submit"]:hover, input[type="button"]:hover {
            background-color: #0069d9;
        }
        input[type="submit"]:focus, input[type="button"]:focus {
            outline: none;
            box-shadow: 0 0 0 2px #007bff;
        }
        input[type="button"] {
            background-color: #6c757d;
        }
        input[type="button"]:hover {
            background-color: #5a6268;
        }
        input[type="button"]:focus {
            outline: none;
            box-shadow: 0 0 0 2px #6c757d;
        }
    </style>
</head>
<body>

<h1>Edit Category</h1>
<form id="edit-form" action="" method="post">

    <form id="edit-form" action="" method="post">
        <input type="hidden" id="edit-category-id" name="id" value="${category.id}" readonly>
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" value="${category.name}">
        <br>
        <label for="description">Description:</label>
        <textarea id="description" name="description">${category.description}</textarea>
        <br>
        <input type="submit" value="Save">
        <input type="button" value="Cancel" >
    </form>

</body>
</html>
