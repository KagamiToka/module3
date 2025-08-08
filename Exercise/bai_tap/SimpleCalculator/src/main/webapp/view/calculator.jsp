<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Simple Calculator</title>
</head>
<body>
<h1>Simple Calculator</h1>
<form action="calculate" method="post">
    <label>First operand: </label><input type="number" step="0.1" name="firstNumber" required><br>
    <label>Operator: </label>
    <select name="operator" required>
        <option value="Addition">Addition (+)</option>
        <option value="Subtraction">Subtraction (-)</option>
        <option value="Multiplication">Multiplication (*)</option>
        <option value="Division">Division (/)</option>
    </select><br>
    <label>Second operand: </label><input type="number" step="0.1" name="secondNumber" required><br>
    <input type="submit" value="Calculate">
</form>
</body>
</html>