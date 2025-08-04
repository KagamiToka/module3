<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
    <h1><%= "Hello World!" %></h1>
    <form method="post" action="hello-servlet">
        <input type="text" placeholder="nhập mô tả" name="description">
        <input type="number" placeholder="nhập giá" name="price">
        <input type="number" placeholder="nhập tỷ lệ chiết khấu" name="discount">
        <button type="submit">Calculate discount</button>
    </form>
</body>
</html>