package org.example.demo1;

import java.io.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "helloServlet", value = "/hello-servlet")
public class HelloServlet extends HttpServlet {
    private String message;

    public void init() {

    }

//    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
//
//    }


    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        double discount = Double.parseDouble(request.getParameter("discount"));
        double finalPrice = price - price * discount * 0.01;

        request.setAttribute("description", description);
        request.setAttribute("price", price);
        request.setAttribute("discount", discount);
        request.setAttribute("finalPrice", finalPrice);

        request.getRequestDispatcher("/WEB-INF/dicount_result.jsp").forward(request,response);
    }
    public void destroy() {
    }
}