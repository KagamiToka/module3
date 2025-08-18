<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <select name="categoryId">
      <option disabled selected>--------Loại Sản Phẩm-------</option>
      <c:forEach items="${category}" var="cate">
        <option value="${cate.getId()}">${cate.getName()}</option>
      </c:forEach>
    </select>
    <input name="price" type="number" placeholder="Nhập giá..."> <br>
    <select name="status">
      <option>Active</option>
      <option>Inactive</option>
    </select> <br>
    <button type="submit">Create product</button>
  </form>
</body>
</html>
