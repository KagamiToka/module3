package org.example.product.model.service;

import org.example.product.model.entity.Product;
import org.example.product.model.repository.IProductRepository;
import org.example.product.model.repository.ProductRepository;

import java.util.List;

public class ProductService implements IProductService {
    private IProductRepository productRepository = new ProductRepository();


    @Override
    public List<Product> getProductList() {
        return productRepository.getProductList();
    }

    @Override
    public boolean addProduct(Product product) {
        return productRepository.addProduct(product);
    }

    @Override
    public Product getProduct(String category) {
        return productRepository.getProduct(category);
    }
}
