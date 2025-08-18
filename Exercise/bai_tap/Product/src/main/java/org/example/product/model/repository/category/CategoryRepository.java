package org.example.product.model.repository.category;

import org.example.product.model.entity.Category;
import org.example.product.model.entity.Product;
import org.example.product.model.repository.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategoryRepository implements ICategoryRepository {
    private static final String SELECT_CATEGORY = "select * from Category";

    @Override
    public List<Category> findAll() {
        List<Category> categories = new ArrayList<>();
        try (Connection con = DBConnection.getConnectDB()){
            PreparedStatement ps = con.prepareStatement(SELECT_CATEGORY);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                int categoryId = rs.getInt("id");
                String name = rs.getString("name");
                categories.add(new Category(categoryId,name));
            }
        } catch (SQLException e) {
            System.out.println("Query error");
        }
        return categories;
    }
}
