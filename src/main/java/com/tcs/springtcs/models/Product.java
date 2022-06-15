package com.tcs.springtcs.models;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Setter @Getter
@Table(name = "products")
@Entity
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name="product_code")
    private int id;
    @Column(name = "artist")
    private String artist;
    @Column(name = "title")
    private String title;
    @Column(name = "cost")
    private double cost;
    @Column(name = "sale_price")
    private double price;

    @Override
    public String toString() {
        return "Product [id=" + id + ", artist=" + artist + ", title=" + title + ", cost=" + cost + ", price=" + price + "]";
    }
}


