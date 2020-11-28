package com.shop.demo.service;

import com.shop.demo.model.Contract;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface ContractService {

    Page<Contract> findAll(Pageable pageable);

    List<Contract> findAllContract();

    List<Contract> search(String id);

    Contract findOne(Long id);

    void save(Contract contract);

    void delete(Contract contract);

    List<Contract> searchBy2(String key, String id);

    List<Contract> findContractByStatus(Integer filter);

}
