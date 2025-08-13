package org.example.product.model.repository;

import org.example.product.model.entity.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {
    private static final String GET_ALL_PRODUCT = "select * from Product ";
    private static final String ADD_PRODUCT = "insert into Product (maDH, name, description, category, price, status) values (?,?,?,?,?,?)";

    @Override
    public List<Product> getProductList() {
        List<Product> productList = new ArrayList<>();
        try (Connection con = DBConnection.getConnectDB()){
            PreparedStatement ps = con.prepareStatement(GET_ALL_PRODUCT);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                String maDH = rs.getString("maDH");
                String name = rs.getString("name");
                String description = rs.getString("description");
                String category = rs.getString("category");
                double price = rs.getDouble("price");
                String status = rs.getString("status");
                Product product = new Product(maDH, name, description, category, price, status);
                productList.add(product);
            }
        } catch (SQLException e) {
            System.out.println("Query error");
        }
        return productList;
    }

    @Override
    public boolean addProduct(Product product) {
        try (Connection con = DBConnection.getConnectDB()){
            PreparedStatement ps = con.prepareStatement(ADD_PRODUCT);
            ps.setString(1, product.getMaDH());
            ps.setString(2, product.getName());
            ps.setString(3, product.getDescription());
            ps.setString(4, product.getCategory());
            ps.setDouble(5, product.getPrice());
            ps.setString(6, product.getStatus());
            int effectRow = ps.executeUpdate();
            return effectRow == 1;
        } catch (SQLException e) {
            System.out.println("Query error");
            return false;
        }
    }

    @Override
    public Product getProduct(String category) {

        return null;
    }
}
