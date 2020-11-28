package com.shop.demo.service.impl;

import com.shop.demo.model.EmployeeType;
import com.shop.demo.repository.EmployeeTypeRepository;
import com.shop.demo.service.EmployeeTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmployeeTypeServiceImpl implements EmployeeTypeService {

    @Autowired
    private EmployeeTypeRepository employeeTypeRepository;

    @Override
    public List<EmployeeType> findAll() {
        return employeeTypeRepository.findAll();
    }

    @Override
    public List<EmployeeType> search(String key) {
        return null;
    }

    @Override
    public EmployeeType findOne(String id) {
        return employeeTypeRepository.findById(id).get();
    }

    @Override
    public void save(EmployeeType employee) {
        employeeTypeRepository.save(employee);
    }

    @Override
    public void delete(EmployeeType employee) {
        employeeTypeRepository.delete(employee);
    }
}
