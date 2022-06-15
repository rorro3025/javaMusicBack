package com.tcs.springtcs.models;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Setter @Getter
@Table(name = "employees")
@Entity
public class Employee {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "emp_number")
    private long id;
    @Column(name = "emp_name")
    private String name;
    @Column(name = "outlet_number")
    private int outletNumber;

    @Override
    public String toString() {
        return "Employee [id=" + id + ", name=" + name + ", outletNumber=" + outletNumber + "]";
    }
}
