package com.tcs.springtcs.models;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "customers")
public class Customer {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "customer_id")
    private long id;
    @Column(name = "customer_name")
    private String name;
    @Column(name = "address")
    private String address;
    @Column(name = "city")
    private String city;
    @Column(name = "state")
    private String state;
    @Column(name = "zip")
    private int zip;
    @Column(name = "phone")
    private String phone;

    @Override
    public String toString() {
        return "Customer [id=" + id + ", name=" + name + ", address=" + address + ", city=" + city + ", state=" + state + ", zip=" + zip + ", phone=" + phone + "]";
    }
}
