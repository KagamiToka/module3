package org.example.product.dto;

public class ProductDTO {
    private String maDH;
    private String name;
    private String description;
    private double price;
    private String status;
    private String categoryName;

    public ProductDTO() {
    }

    public ProductDTO(String maDH, String name, String description, double price, String status, String categoryName) {
        this.maDH = maDH;
        this.name = name;
        this.description = description;
        this.price = price;
        this.status = status;
        this.categoryName = categoryName;
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

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }
}
