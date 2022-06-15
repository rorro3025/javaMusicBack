package com.tcs.springtcs.controllers;

import com.tcs.springtcs.models.Customer;
import com.tcs.springtcs.servces.CustomerService;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;

@CrossOrigin
@RestController
@RequestMapping("/api")
public class CustomersController {
    private final CustomerService customerService;

    public CustomersController(CustomerService customerService) {
        this.customerService = customerService;
    }
    @GetMapping("/customers")
   public ArrayList<Customer> getAllCustomers(){
    return customerService.getAllCustomers();
    }

    @GetMapping("/customers/{id}")
    public Customer getOneCustomer(@PathVariable long id){
        return customerService.getCustomerById(id);
    }

    @PostMapping("/customers")
    public void addCustomer(@RequestBody Customer customer){
        customerService.saveCustomer(customer);
    }
}
