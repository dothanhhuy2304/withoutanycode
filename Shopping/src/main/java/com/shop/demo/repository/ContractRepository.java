package com.shop.demo.repository;

import com.shop.demo.model.Contract;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ContractRepository extends JpaRepository<Contract, Long> {
    @Query(value = "select c from  Contract c where  c.employee.department.id like '%' || :id || '%' ")
    List<Contract> search(String id);

    @Query(value = "select  c from  Contract  c where c.employee.department.id like  '%' || :id || '%' " +
            "and c.employee.id like '%' || :key || '%'")
    List<Contract> searchBy2(String key, String id);

    //    @Query(value = "select c from Contract  c where c.status like ?1 ")
    List<Contract> findContractByStatus(Integer filter);
}
