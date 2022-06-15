package com.tcs.springtcs.controllers;

import com.tcs.springtcs.models.Employee;
import com.tcs.springtcs.servces.EmployeeService;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;

@CrossOrigin
@RestController
@RequestMapping("/api")
public class EmployeeController {

    private final EmployeeService employeeService;

    public EmployeeController(EmployeeService employeeService) {
        this.employeeService = employeeService;
    }


    @RequestMapping(value = "employee", method = RequestMethod.GET)
    public ArrayList<Employee> getEmployee() {
        return employeeService.getAllEmployees();
    }

    @RequestMapping(value = "employee/{id}", method = RequestMethod.GET)
    public Employee getOneEmployee(@PathVariable long id) {
        return employeeService.getEmployeeById(id);
    }

    @RequestMapping(value = "employee", method = RequestMethod.POST)
    public void addEmployee(@RequestBody Employee employee) {
       employeeService.saveEmployee(employee);
    }

    @RequestMapping(value = "employee/{id}", method = RequestMethod.PUT)
    public void updateEmployee(@PathVariable long id, @RequestBody Employee employee) {
    }
}
