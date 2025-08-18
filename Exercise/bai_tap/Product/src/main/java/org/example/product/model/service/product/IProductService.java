package org.example.product.model.service.product;

import org.example.product.dto.ProductDTO;
import org.example.product.model.entity.Product;

import java.util.List;

public interface IProductService {
    List<ProductDTO> getProductList();
    boolean addProduct(Product product);
    Product getProduct(String category);
}
