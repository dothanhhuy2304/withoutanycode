package com.shop.demo.repository;

import com.shop.demo.model.Order;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface OrderRepository extends JpaRepository<Order, Integer> {
    @Query(value = "select c from Order c where c.customer.id like '%' || :key || '%' " +
            "or c.receiver like '%' || :key || '%' " +
            "or c.numberPhone like '%' || :key || '%'" +
            "or c.address  like '%' || :key ||  '%'  ")
    List<Order> searchByAll(@Param("key") String key);

    @Query(value = "select c from Order c where c.status like ?1 ")
    List<Order> searchByStatus(@Param("key") Integer key);

}
