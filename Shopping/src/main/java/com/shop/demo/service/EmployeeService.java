package com.shop.demo.service;

import com.shop.demo.model.Employee;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Optional;

public interface EmployeeService {
    List<Employee> findAll();

    List<Employee> searchByAll(String key);

    Page<Employee> searchByEmployee(String key, Pageable pageable);

    Optional<Employee> findOneEmployeeById(Long id);

    void save(Employee employee);

    void delete(Employee employee);

    Page<Employee> findAlls(Pageable pageable);

    Employee checkLogin(String username, String password);

    //id
    String findEmployeePassword(String username);

    Employee findByUserEmployee(String username);

    String checkUserName(String username);

    Employee findByIdEmployee(Long id);

    public Employee findEmployeeByDepartmentId(String id);

}
