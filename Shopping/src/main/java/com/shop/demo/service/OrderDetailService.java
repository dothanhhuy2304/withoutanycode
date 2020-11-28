package com.shop.demo.service;

import com.shop.demo.model.OrderDetail;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.Date;
import java.util.List;

public interface OrderDetailService {

    Page<OrderDetail> findAllOrderDetail(Pageable pageable);

    List<OrderDetail> findAll();

    List<OrderDetail> search(String key);

    OrderDetail findById(int id);

    void save(OrderDetail orderDetail);

    void delete(OrderDetail orderDetail);


    void removeAll();

    OrderDetail findByIds(int id);

    //revenue
    Iterable<OrderDetail> findByCategory(Date min, Date max);

    Iterable<OrderDetail> findByProducer(Date min, Date max);

    Iterable<OrderDetail> findByCustomer(Date min, Date max);

    Iterable<OrderDetail> findByProduct(Date min, Date max);

    Iterable<OrderDetail> findByQuarter(Date min, Date max);

    Iterable<OrderDetail> findByMonth(Date min, Date max);

    Iterable<OrderDetail> findByYear(Date min, Date max);

    Iterable<OrderDetail> findByToday();

}
