package com.shop.demo.service;

import com.shop.demo.model.Order;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface OrderService {

    Page<Order> findAll(Pageable pageable);

    List<Order> search(String key);

    Order findOneId(Integer id);

    void deleteOrder(Integer order);

    void saveOrder(Order order);

    //Employee Manager
    List<Order> searchByAll(String key);

    List<Order> searchByStatus(Integer key);

}
