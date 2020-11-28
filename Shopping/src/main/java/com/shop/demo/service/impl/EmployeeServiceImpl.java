package com.shop.demo.service.impl;

import com.shop.demo.model.Employee;
import com.shop.demo.repository.EmployeeRepository;
import com.shop.demo.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class EmployeeServiceImpl implements EmployeeService {

    @Autowired
    private EmployeeRepository employeeRepository;

    @Override
    public List<Employee> findAll() {
        return employeeRepository.findAll();
    }

    @Override
    public List<Employee> searchByAll(String key) {
        return null;
    }

    @Override
    public Page<Employee> searchByEmployee(String key, Pageable pageable) {
        return employeeRepository.searchByEmployee(key, pageable);
    }

    @Override
    public Optional<Employee> findOneEmployeeById(Long id) {
        return employeeRepository.findById(id);
    }

    @Override
    public void save(Employee employee) {
        employeeRepository.save(employee);
    }

    @Override
    public void delete(Employee employee) {
        employeeRepository.delete(employee);
    }

    @Override
    public Page<Employee> findAlls(Pageable pageable) {
        return employeeRepository.findAll(pageable);
    }

    @Override
    public Employee checkLogin(String username, String password) {
        return employeeRepository.checkLogin(username, password);
    }

    @Override
    public String findEmployeePassword(String username) {
        return employeeRepository.findEmployeePassword(username);
    }

    @Override
    public Employee findByUserEmployee(String username) {
        return employeeRepository.findByUserEmployee(username);
    }

    @Override
    public String checkUserName(String username) {
        return employeeRepository.checkUserName(username);
    }

    @Override
    public Employee findByIdEmployee(Long id) {
        return employeeRepository.findByIdEmployee(id);
    }

    @Override
    public Employee findEmployeeByDepartmentId(String id) {
        return employeeRepository.findEmployeeByDepartmentId(id);
    }

}
