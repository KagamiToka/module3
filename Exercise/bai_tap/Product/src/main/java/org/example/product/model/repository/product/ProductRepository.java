package org.example.product.model.repository.product;

import org.example.product.dto.ProductDTO;
import org.example.product.model.entity.Product;
import org.example.product.model.repository.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {
    private static final String GET_ALL_PRODUCT = "select p.maDH, p.name, p.description, c.name as category, p.price, p.status\n" +
                                                    "from Product p \n" +
                                                    "join Category c on p.category_id = c.id; ";
    private static final String ADD_PRODUCT = "insert into Product (maDH, name, description, category_id, price, status) values (?,?,?,?,?,?)";
    private static final String DELETE_PRODUCT = "delete from Product where maDH = ?";

    @Override
    public List<ProductDTO> getProductList() {
        List<ProductDTO> productList = new ArrayList<>();
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
                productList.add(new ProductDTO(maDH,name,description,price,status,category));
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
            ps.setInt(4, product.getCategoryId());
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

    @Override
    public boolean deleteProduct(String maDH) {
        int effectRow = 0;
        List<ProductDTO> productList = getProductList();
        try(Connection con = DBConnection.getConnectDB()) {
            PreparedStatement ps = con.prepareStatement(DELETE_PRODUCT);
            if(productList.get(0).getMaDH().toLowerCase().equals(maDH.toLowerCase())) {
                ps.setString(1, maDH);
                effectRow = ps.executeUpdate();   
            }
            return effectRow == 1;
        } catch (SQLException e) {
            System.out.println("Query error");
            return false;
        }
    }
}
