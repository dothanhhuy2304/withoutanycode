package com.shop.demo.service.impl;

import com.shop.demo.model.Order;
import com.shop.demo.repository.OrderRepository;
import com.shop.demo.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderRepository orderRepository;

    @Override
    public Page<Order> findAll(Pageable pageable) {
        return orderRepository.findAll(pageable);
    }

    @Override
    public List<Order> search(String key) {
        return null;
    }

    @Override
    public Order findOneId(Integer id) {
        return orderRepository.findById(id).get();
    }

    @Override
    public void deleteOrder(Integer order) {
        orderRepository.deleteById(order);
    }

    @Override
    public void saveOrder(Order order) {
        orderRepository.save(order);
    }

    @Override
    public List<Order> searchByAll(String key) {
        return orderRepository.searchByAll(key);
    }

    @Override
    public List<Order> searchByStatus(Integer key) {
        return orderRepository.searchByStatus(key);
    }
}
