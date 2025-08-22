package org.example.product.model.repository.product;

import org.example.product.dto.ProductDTO;
import org.example.product.model.entity.Product;

import java.util.List;

public interface IProductRepository {
    List<ProductDTO> getProductList();
    boolean addProduct(Product product);
    Product getProduct(String category);
    boolean deleteProduct(String maDH);
}
