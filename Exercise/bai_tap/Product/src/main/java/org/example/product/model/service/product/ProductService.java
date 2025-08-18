package org.example.product.model.service.product;

import org.example.product.dto.ProductDTO;
import org.example.product.model.entity.Product;
import org.example.product.model.repository.product.IProductRepository;
import org.example.product.model.repository.product.ProductRepository;

import java.util.List;

public class ProductService implements IProductService {
    private IProductRepository productRepository = new ProductRepository();


    @Override
    public List<ProductDTO> getProductList() {
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
