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
      <th>Hoạt động</th>
    </tr>
    <c:forEach var="product" items="${productList}">
      <tr>
        <td>${product.getMaDH()}</td>
        <td>${product.getName()}</td>
        <td>${product.getDescription()}</td>
        <td>${product.getCategoryName()}</td>
        <td>${product.getPrice()}</td>
        <td>${product.getStatus()}</td>
        <td>
          <button onclick="getInfoDelete('${product.getMaDH()}','${product.getName()}')" data-bs-toggle="modal"
                  data-bs-target="#deleteModal" class="btn btn-sm btn-danger">Xoá
          </button>
        </td>
      </tr>
    </c:forEach>
  </table>

  <!-- Modal -->
  <div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <form action="/students?action=delete" method="post">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>

          <div class="modal-body">
            <input hidden="hidden" id="deleteId" name="deleteId">
            <span>Bạn có muốn xoá sinh viên </span>
            <span style="color: red" id="deleteName"></span>
            <span> không???</span>
          </div>

          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Huỷ</button>
            <button type="submit" class="btn btn-primary">Xoá</button>
          </div>
        </div>
      </form>
    </div>
  </div>
  <script>
    function getInfoDelete(id, name) {
      document.getElementById("deleteName").innerText = name;
      document.getElementById("deleteId").value = id;
    }
  </script>
</body>
</html>
