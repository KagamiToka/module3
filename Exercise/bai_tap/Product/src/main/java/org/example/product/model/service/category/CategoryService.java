package org.example.product.model.service.category;

import org.example.product.model.entity.Category;
import org.example.product.model.repository.category.CategoryRepository;
import org.example.product.model.repository.category.ICategoryRepository;

import java.util.List;

public class CategoryService implements ICategoryService {
    private static ICategoryRepository categoryRepository = new CategoryRepository();

    @Override
    public List<Category> getCategories() {
        return categoryRepository.findAll();
    }
}
