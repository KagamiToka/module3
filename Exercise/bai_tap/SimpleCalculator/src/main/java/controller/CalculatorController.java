package controller;

import model.Calculator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CalculatetorController", value = "/calculate")
public class CalculatorController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("view/calculator.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        double firstNumber = Double.parseDouble(request.getParameter("firstNumber"));
        String operator = request.getParameter("operator");
        double secondNumber = Double.parseDouble(request.getParameter("secondNumber"));

        Calculator calc = new Calculator();
        calc.setFirstNumber((int) firstNumber);
        calc.setOperator(operator);
        calc.setSecondNumber((int) secondNumber);

        double result = calc.calculate();

        request.setAttribute("result", result);
        request.setAttribute("firstNumber", firstNumber);
        request.setAttribute("operator", operator);
        request.setAttribute("secondNumber", secondNumber);

        request.getRequestDispatcher("view/result.jsp").forward(request, response);
    }
}
