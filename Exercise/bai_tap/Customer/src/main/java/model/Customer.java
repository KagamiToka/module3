package model;

import java.util.Date;

public class Customer {
    private String name;
    private String dateOfBirth;
    private String address;
    private String image_url;

    public Customer() {
    }

    public Customer(String name, String dateOfBirth, String address, String image_url) {
        this.name = name;
        this.dateOfBirth = dateOfBirth;
        this.address = address;
        this.image_url = image_url;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(String dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getImage_url() {
        return image_url;
    }

    public void setImage_url(String image_url) {
        this.image_url = image_url;
    }
}
