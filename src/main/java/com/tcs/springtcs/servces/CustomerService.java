package com.tcs.springtcs.servces;

import com.tcs.springtcs.models.Customer;
import com.tcs.springtcs.models.CustomerRepository;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class CustomerService {
    private final CustomerRepository customerRepository;

    public CustomerService(CustomerRepository customerRepository) {
        this.customerRepository = customerRepository;
    }

    public ArrayList<Customer> getAllCustomers() {
        ArrayList<Customer> list = (ArrayList<Customer>) customerRepository.findAll();
        if (list.size() > 0) {
            return list;
        } else {
            return new ArrayList<>();
        }
    }

    public Customer getCustomerById(long id) {
        return customerRepository.findById(id).isPresent() ?customerRepository.findById(id).get():null;
    }

    public void saveCustomer(Customer customer) {
        try{
            customerRepository.save(customer);
        }catch (Exception e){
            System.out.println("Error " + e.getMessage());
        }
    }
}

