package com.shop.demo.repository;

import com.shop.demo.model.Department;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Optional;

public interface DepartmentRepository extends JpaRepository<Department, Integer> {
    Optional<Department> findById(Integer id);

    @Query(value = "select c from Department c where c.id like '%' || :key || '%' or c.code like '%' || :key || '%'  or c.nameDepartment like '%' || :key || '%' ")
    List<Department> searchDepartment(String key);
}
