package com.shop.demo.service.impl;

import com.shop.demo.model.Contract;
import com.shop.demo.repository.ContractRepository;
import com.shop.demo.service.ContractService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ContractServiceImpl implements ContractService {

    @Autowired
    private ContractRepository contractRepository;

    @Override
    public Page<Contract> findAll(Pageable pageable) {
        return contractRepository.findAll(pageable);
    }

    @Override
    public List<Contract> findAllContract() {
        return contractRepository.findAll();
    }

    @Override
    public List<Contract> search(String id) {
        return contractRepository.search(id);
    }

    @Override
    public Contract findOne(Long id) {
        return contractRepository.findById(id).get();
    }

    @Override
    public void save(Contract contract) {
        contractRepository.save(contract);
    }

    @Override
    public void delete(Contract contract) {
        contractRepository.delete(contract);
    }

    @Override
    public List<Contract> searchBy2(String key, String id) {
        return contractRepository.searchBy2(key, id);
    }

    @Override
    public List<Contract> findContractByStatus(Integer filter) {
        return contractRepository.findContractByStatus(filter);
    }
}
