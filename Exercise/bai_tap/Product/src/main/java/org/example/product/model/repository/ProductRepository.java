package org.example.product.model.repository;

import org.example.product.model.entity.Product;

import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {
    private static List<Product> productList = new ArrayList<>();

    static {
        productList.add(new Product("MH01", "Swift 3", "Ultrabook with IPS display", "Laptop", 20052725, "active"));
        productList.add(new Product("MH02", "Legion Y520-15IKBN", "Gaming laptop with GTX 1050", "Laptop", 26016458, "active"));
        productList.add(new Product("MH03", "ASUS ROG Strix Scope NX TKL Deluxe", "Bàn phím cơ gaming TKL với switch ASUS NX Red, đèn RGB, thiết kế nhỏ gọn", "Keyboard", 3500000, "active"));
        productList.add(new Product("MH04", "MSI Clutch GM41 Lightweight", "Lightweight gaming mouse with 16K DPI", "Mouse", 1302125, "active"));
        productList.add(new Product("MH05", "Corsair Virtuoso RGB Wireless", "Premium wireless gaming headset with 7.1 surround", "Headphone", 4687650, "active"));
    }

    @Override
    public List<Product> getProductList() {
        return productList;
    }

    @Override
    public boolean addProduct(Product product) {
        productList.add(product);
        return true;
    }

    @Override
    public Product getProduct(String category) {
        for (Product product : productList) {
            if (product.getCategory().equals(category)) {
                return product;
            }
        }
        return null;
    }
}
