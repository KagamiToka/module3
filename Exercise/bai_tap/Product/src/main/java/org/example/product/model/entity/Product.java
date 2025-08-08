package org.example.product.model.entity;

public class Product {
    private String maDH;
    private String name;
    private String description;
    private String category;
    private double price;
    private String status;

    public Product() {
    }

    public Product(String maDH, String name, String description, String category, double price, String status) {
        this.maDH = maDH;
        this.name = name;
        this.description = description;
        this.category = category;
        this.price = price;
        this.status = status;
    }

    public String getMaDH() {
        return maDH;
    }

    public void setMaDH(String maDH) {
        this.maDH = maDH;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
