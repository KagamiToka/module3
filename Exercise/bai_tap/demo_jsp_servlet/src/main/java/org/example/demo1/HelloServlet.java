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

    private void calculateDiscount(String description, double price, double discount) {
        double calculatedPrice = price * discount * 0.01;
        System.out.println("Product Description: " + description);
        System.out.println("Product Price: " + price);
        System.out.println("Product Discount: " + discount);
        System.out.println("Total Price: " + calculatedPrice);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        double discount = Double.parseDouble(request.getParameter("discount"));
        double finalPrice = price - price * discount * 0.01;
//        calculateDiscount(description, price, discount);

        request.setAttribute("description", description);
        request.setAttribute("price", price);
        request.setAttribute("discount", discount);
        request.setAttribute("finalPrice", finalPrice);

        request.getRequestDispatcher("/WEB-INF/dicount_result.jsp").forward(request,response);
    }
    public void destroy() {
    }
}