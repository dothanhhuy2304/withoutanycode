package com.shop.demo.service;

import com.shop.demo.model.EmployeeType;

import java.util.List;

public interface EmployeeTypeService {
    List<EmployeeType> findAll();

    List<EmployeeType> search(String key);

    EmployeeType findOne(String id);

    void save(EmployeeType employee);

    void delete(EmployeeType employee);
}
