package com.shop.demo.repository;

import com.shop.demo.model.Customer;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface CustomerRepository extends JpaRepository<Customer, String> {


    @Query(value = "select c from Customer c where c.id like ?1 and c.password like ?2")
    Customer checkLogin(String id, String password);

    @Query(value = "select c.password from Customer c where c.id like ?1")
    String findCustomerPassword(String id);

    @Query(value = "select c from Customer c where c.id like ?1")
    Customer findByIdCustomer(String id);


    @Query(value = "select c from  Customer c where  c.id like '%' || :key || '%' " +
            "or c.email like '%' || :key || '%' " +
            "or c.fullName like '%' || :key || '%' " +
            "or c.address like '%' || :key || '%' ")
    Page<Customer> searchCustomer(String key, Pageable page);

    @Query(value = "select c.id from Customer  c where c.id like ?1")
    String checkId(String id);

}
