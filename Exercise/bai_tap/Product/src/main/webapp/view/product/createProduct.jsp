<%--
  Created by IntelliJ IDEA.
  User: NamNguyen
  Date: 8/8/2025
  Time: 8:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
  <style>
    body {
      background-color: #f2f2f2;
      font-family: Arial, sans-serif;
      display: flex;
      justify-content: center;
      padding-top: 60px;
    }

    h1,form {
      background-color: #fff;
      padding: 30px 40px;
      border-radius: 10px;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
      width: 400px;
    }

    input[type="text"],
    input[type="number"],
    select {
      width: 100%;
      padding: 10px 12px;
      margin: 10px 0;
      border: 1px solid #ccc;
      border-radius: 6px;
      box-sizing: border-box;
    }

    button {
      width: 100%;
      padding: 12px;
      margin-top: 10px;
      background-color: #007BFF;
      color: white;
      border: none;
      border-radius: 6px;
      cursor: pointer;
      font-size: 16px;
    }

    button:hover {
      background-color: #0056b3;
    }

    h1 {
      text-align: center;
      color: #333;
    }
  </style>
</head>
<body>
<%--  <h1>Create Product Form</h1>--%>
  <form method="post" action="products?action=add">
    <input name="maDH" type="text" placeholder="Nhập mã đơn hàng..."> <br>
    <input name="name" type="text" placeholder="Nhập tên sản phẩm..."> <br>
    <input name="description" type="text" placeholder="Nhập mô tả..."> <br>
    <input name="category" type="text" placeholder="Nhập loại sản phầm..."> <br>
    <input name="price" type="number" placeholder="Nhập giá..."> <br>
    <select>
      <option name="status">Active</option>
      <option name="status">Inactive</option>
    </select> <br>
    <button type="submit">Create product</button>
  </form>
</body>
</html>
