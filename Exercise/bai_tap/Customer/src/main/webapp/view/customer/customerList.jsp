<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
  <h1>Customer List</h1>
  <table>
    <tr>
      <th>Tên</th>
      <th>Ngày sinh</th>
      <th>Địa chỉ</th>
      <th>Ảnh</th>
    </tr>
    <c:forEach var="customers" items="${customers}">
      <tr>
        <td>${customers.getName()}</td>
        <td>${customers.getDateOfBirth()}</td>
        <td>${customers.getAddress()}</td>
        <td><img src="${customers.getImage_url()}" alt="ảnh" height="20px" width="20px"></td>
      </tr>
    </c:forEach>
  </table>
</body>
</html>
