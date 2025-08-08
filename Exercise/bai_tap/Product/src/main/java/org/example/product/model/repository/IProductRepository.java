package org.example.product.model.repository;

import org.example.product.model.entity.Product;

import java.util.List;

public interface IProductRepository {
    List<Product> getProductList();
    boolean addProduct(Product product);
    Product getProduct(String category);
}
