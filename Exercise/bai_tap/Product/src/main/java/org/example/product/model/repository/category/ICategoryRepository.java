package org.example.product.model.repository.category;

import org.example.product.model.entity.Category;

import java.util.List;

public interface ICategoryRepository {
    List<Category> findAll();
}
