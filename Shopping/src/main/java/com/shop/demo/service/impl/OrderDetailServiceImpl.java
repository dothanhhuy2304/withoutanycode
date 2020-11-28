package com.shop.demo.service.impl;

import com.shop.demo.model.OrderDetail;
import com.shop.demo.repository.OrderDetailRepository;
import com.shop.demo.service.OrderDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class OrderDetailServiceImpl implements OrderDetailService {

    @Autowired
    private OrderDetailRepository orderDetailRepository;

    @Override
    public Page<OrderDetail> findAllOrderDetail(Pageable pageable) {
        return orderDetailRepository.findAll(pageable);
    }

    @Override
    public List<OrderDetail> findAll() {
        return orderDetailRepository.findAll();
    }

    @Override
    public List<OrderDetail> search(String key) {
        return orderDetailRepository.search(key);
    }

    @Override
    public OrderDetail findById(int id) {
        return orderDetailRepository.findById(id).get();
    }

    @Override
    public void save(OrderDetail orderDetail) {
        orderDetailRepository.save(orderDetail);
    }

    @Override
    public void delete(OrderDetail orderDetail) {
        orderDetailRepository.delete(orderDetail);
    }

    @Override
    public void removeAll() {
        orderDetailRepository.deleteAll();
    }

    @Override
    public OrderDetail findByIds(int id) {
        return orderDetailRepository.findByIds(id);
    }

    //revenue

    @Override
    public Iterable<OrderDetail> findByCategory(Date min, Date max) {
        return orderDetailRepository.findByCategory(min, max);
    }

    @Override
    public Iterable<OrderDetail> findByProducer(Date min, Date max) {
        return orderDetailRepository.findByProducer(min, max);
    }

    @Override
    public Iterable<OrderDetail> findByCustomer(Date min, Date max) {
        return orderDetailRepository.findByCustomer(min, max);
    }

    @Override
    public Iterable<OrderDetail> findByProduct(Date min, Date max) {
        return orderDetailRepository.findByProduct(min, max);
    }

    @Override
    public Iterable<OrderDetail> findByQuarter(Date min, Date max) {
        return orderDetailRepository.findByQuarter(min, max);
    }

    @Override
    public Iterable<OrderDetail> findByMonth(Date min, Date max) {
        return orderDetailRepository.findByMonth(min, max);
    }

    @Override
    public Iterable<OrderDetail> findByYear(Date min, Date max) {
        return orderDetailRepository.findByYear(min, max);
    }

    @Override
    public Iterable<OrderDetail> findByToday() {
        return orderDetailRepository.findByToday();
    }
}
