<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f4f4f4;
      margin: 40px;
    }

    h1 {
      color: #333;
      text-align: center;
    }

    table {
      width: 90%;
      margin: 0 auto;
      border-collapse: collapse;
      background-color: white;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    th, td {
      padding: 12px 16px;
      border: 1px solid #ddd;
      text-align: left;
    }

    th {
      background-color: #007BFF;
      color: white;
    }

    tr:nth-child(even) {
      background-color: #f9f9f9;
    }

    tr:hover {
      background-color: #f1f1f1;
    }
  </style>
</head>
<body>
  <h1>Product List</h1>
  <a href="products?action=add">Create New Product</a>
  <form method="get" action="products?action=search">
    <input type="text" name="category" placeholder="Search...">
    <button type="submit">Search</button>
  </form>
  <table>
    <tr>
      <th>Mã sản phẩm</th>
      <th>Tên sản phẩm</th>
      <th>Mô tả</th>
      <th>Loại</th>
      <th>Giá</th>
      <th>Trạng thái</th>
    </tr>
    <c:forEach var="product" items="${productList}">
      <tr>
        <td>${product.getMaDH()}</td>
        <td>${product.getName()}</td>
        <td>${product.getDescription()}</td>
        <td>${product.getCategory()}</td>
        <td>${product.getPrice()}</td>
        <td>${product.getStatus()}</td>
      </tr>
    </c:forEach>
  </table>
</body>
</html>
