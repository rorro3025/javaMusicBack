package com.tcs.springtcs.servces;

import com.tcs.springtcs.models.Employee;
import com.tcs.springtcs.models.EmployeeRepository;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class EmployeeService {

    public final EmployeeRepository employeeRepository;


    public EmployeeService(EmployeeRepository employeeRepository) {
        this.employeeRepository = employeeRepository;
    }

    public ArrayList<Employee> getAllEmployees() {
        ArrayList<Employee> list = (ArrayList<Employee>) employeeRepository.findAll();
        if (list.size() > 0) {
            return list;
        } else {
            return new ArrayList<Employee>();
        }
    }

    public Employee getEmployeeById(long id) {
        return employeeRepository.findById(id).get();
    }

    public void saveEmployee(Employee employee) {
        try{
            employeeRepository.save(employee);
        }catch (Exception e){
            System.out.println("Error " + e.getMessage());
        }
    }

    public void updateEmployee(Employee employee,long id) {
        try{
            employeeRepository.save(employee);
        }catch (Exception e){
            System.out.println("Error " + e.getMessage());
        }
    }
}
