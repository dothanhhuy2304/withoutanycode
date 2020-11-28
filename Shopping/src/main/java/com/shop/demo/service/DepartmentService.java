package com.shop.demo.service;

import com.shop.demo.model.Department;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Optional;

public interface DepartmentService {
    Page<Department> findAll(Pageable pageable);

    List<Department> findAllDepartment();

    List<Department> search(String key);

    Optional<Department> findOne(Integer id);

    void save(Department department);

    void delete(Department department);
}
