package com.tcs.springtcs.utils;

import com.tcs.springtcs.models.Customer;
import com.tcs.springtcs.models.CustomerRepository;
import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.stereotype.Component;

@Component
public class AppStartupEvent implements ApplicationListener<ApplicationReadyEvent> {
    private final CustomerRepository customerRepository;

    public AppStartupEvent(CustomerRepository customerRepository) {
        this.customerRepository = customerRepository;
    }

    @Override
    public void onApplicationEvent(ApplicationReadyEvent event) {
        Iterable<Customer> customers = customerRepository.findAll();
       customers.forEach(System.out::println);
    }
}
