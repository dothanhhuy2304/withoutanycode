package com.shop.demo.service.impl;

import com.shop.demo.model.Customer;
import com.shop.demo.repository.CustomerRepository;
import com.shop.demo.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CustomerServiceImpl implements CustomerService {

    @Autowired
    private CustomerRepository customerRepository;

    @Override
    public List<Customer> findAllCustomer() {
        return customerRepository.findAll();
    }

    @Override
    public List<Customer> search(String key) {
        return null;
    }

    @Override
    public Customer findOneId(String id) {
        return customerRepository.findById(id).get();
    }

    @Override
    public void saveCustomer(Customer customer) {
        customerRepository.save(customer);
    }

    @Override
    public void delete(Customer customer) {
        customerRepository.delete(customer);
    }

    @Override
    public Customer checkLogin(String id, String password) {
        return customerRepository.checkLogin(id, password);
    }

    @Override
    public String findCustomerPassword(String id) {
        return customerRepository.findCustomerPassword(id);
    }

    @Override
    public void deleteAll() {
        customerRepository.deleteAll();
    }

    @Override
    public Page<Customer> findAll(Pageable pageable) {
        return customerRepository.findAll(pageable);
    }

    @Override
    public Customer findByIdCustomer(String id) {
        return customerRepository.findByIdCustomer(id);
    }

    @Override
    public Page<Customer> searchCustomer(String key, Pageable page) {
        return customerRepository.searchCustomer(key, page);
    }

    @Override
    public String checkId(String id) {
        return customerRepository.checkId(id);
    }
}
