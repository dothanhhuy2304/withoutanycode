package com.shop.demo.service;

import com.shop.demo.model.Customer;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface CustomerService {
    List<Customer> findAllCustomer();

    List<Customer> search(String key);

    Customer findOneId(String id);

    void saveCustomer(Customer customer);

    void delete(Customer customer);

    void deleteAll();

    Customer checkLogin(String id, String password);

    String findCustomerPassword(String id);

    Page<Customer> findAll(Pageable pageable);

    Customer findByIdCustomer(String id);

    Page<Customer> searchCustomer(String key, Pageable page);

    String checkId(String id);


}
