package com.gsm.bb.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Lob;
import jakarta.persistence.Table;

@Entity
@Table(name = "product")
public class Product {
    @Id
    private String productId;
    private String title;
    private String description;
    private double price;

    @Lob
    @Column(columnDefinition="LONGBLOB")
    private byte[] productImage1;

    @Lob
    @Column(columnDefinition="LONGBLOB")
    private byte[] productImage2;

    @Lob
    @Column(columnDefinition="LONGBLOB")
    private byte[] productImage3;

    // Getters and setters
    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
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

    public byte[] getProductImage1() {
        return productImage1;
    }

    public void setProductImage1(byte[] productImage1) {
        this.productImage1 = productImage1;
    }

    public byte[] getProductImage2() {
        return productImage2;
    }

    public void setProductImage2(byte[] productImage2) {
        this.productImage2 = productImage2;
    }

    public byte[] getProductImage3() {
        return productImage3;
    }

    public void setProductImage3(byte[] productImage3) {
        this.productImage3 = productImage3;
    }
}
