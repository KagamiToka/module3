package org.example.product.controller;

import org.example.product.model.entity.Product;
import org.example.product.model.service.IProductService;
import org.example.product.model.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductController", value = "/products")
public class ProductController extends HttpServlet {
    private IProductService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                showCreateForm(req,resp);
                break;
            case "search":
                showProduct(req,resp);
                break;
            default:
                showListProduct(req,resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                createProduct(req,resp);
                break;
            case "edit":
                break;
            default:
                showListProduct(req,resp);
        }
    }

    private void createProduct(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String maDH = req.getParameter("maDH");
        String name = req.getParameter("name");
        String description = req.getParameter("description");
        String category = req.getParameter("category");
        double price = Double.parseDouble(req.getParameter("price"));
        String status = req.getParameter("status");
        Product product = new Product(maDH,name,description,category,price,status);
        productService.addProduct(product);
        resp.sendRedirect("/products");
    }

    private void showListProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Product> products = productService.getProductList();
        req.setAttribute("productList", products);
        req.getRequestDispatcher("view/product/productList.jsp").forward(req,resp);
    }

    private void showCreateForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("view/product/createProduct.jsp").forward(req,resp);
    }

    private void showProduct(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        String category = req.getParameter("category");
        productService.getProduct(category);
        req.getRequestDispatcher("view/product/productList.jsp").forward(req,resp);
    }
}
