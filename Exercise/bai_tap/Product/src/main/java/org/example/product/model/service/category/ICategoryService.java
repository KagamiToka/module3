package org.example.product.model.service.category;

import org.example.product.model.entity.Category;
import org.example.product.model.entity.Product;

import java.util.List;

public interface ICategoryService {
    List<Category> getCategories();
}
