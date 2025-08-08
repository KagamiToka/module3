package org.example.product.model.service;

import org.example.product.model.entity.Product;

import java.util.List;

public interface IProductService {
    List<Product> getProductList();
    boolean addProduct(Product product);
    Product getProduct(String category);
}
