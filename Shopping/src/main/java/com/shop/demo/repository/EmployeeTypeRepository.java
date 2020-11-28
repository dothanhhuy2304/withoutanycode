package com.shop.demo.repository;

import com.shop.demo.model.EmployeeType;
import org.springframework.data.jpa.repository.JpaRepository;

public interface EmployeeTypeRepository extends JpaRepository<EmployeeType, String> {
}
