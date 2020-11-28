package com.shop.demo.repository;

import com.shop.demo.model.OrderDetail;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.Date;
import java.util.List;

public interface OrderDetailRepository extends JpaRepository<OrderDetail, Integer> {
    @Query(value = "select c from OrderDetail c where c.id like ?1")
    OrderDetail findByIds(Integer id);

    @Query(value = "select c from OrderDetail c where  c.id like '%' || :key || '%'" +
            "or c.order.customer.fullName like '%' || :key ||  '%' " +
            "or c.order.receiver like '%' || :key || '%' " +
            "or c.order.address like '%' || :key || '%'")
    List<OrderDetail> search(String key);

    //revenue
    //By Category
    @Query(value = "select od.product.category.nameCategory,sum(od.quantity),sum(od.quantity * od.amount * (1 - od.discount)),min(od.amount), max(od.amount)," +
            "avg(od.amount) from OrderDetail od where od.order.status = 4 and od.order.orderDate between :min and :max group by od.product.category.nameCategory")
    Iterable<OrderDetail> findByCategory(Date min, Date max);

    //By producer
    @Query(value = "select od.product.producer.nameProducer,sum(od.quantity),sum(od.quantity * od.amount * (1 - od.discount)),min(od.amount),max(od.amount)," +
            "avg(od.amount) from OrderDetail od where od.order.status = 4 and od.order.orderDate between :min and :max group by od.product.producer.nameProducer")
    Iterable<OrderDetail> findByProducer(Date min, Date max);

    //By Customer
    @Query(value = "select od.order.customer.id ,sum(od.quantity),sum(od.quantity * od.amount * (1 - od.discount)),min(od.amount),max(od.amount)," +
            "avg(od.amount) from OrderDetail od where od.order.status = 4 and od.order.orderDate between :min and :max group by od.order.customer.id")
    Iterable<OrderDetail> findByCustomer(Date min, Date max);

    //By Product
    @Query(value = "select od.product.nameProduct,sum(od.quantity),sum(od.quantity * od.amount * (1 - od.discount)),min(od.amount) ,max(od.amount)," +
            "avg(od.amount),od.product.id from OrderDetail od where od.order.status = 4 and od.order.orderDate between :min and :max group by od.product.nameProduct,od.product.id")
    Iterable<OrderDetail> findByProduct(Date min, Date max);

    //By Quarter
    @Query(value = "select CAST(CEILING(MONTH(od.order.orderDate)/3.0) as int),sum(od.quantity),sum(od.quantity * od.amount*(1 - od.discount)),min(od.amount),max(od.amount)," +
            " avg(od.amount) from OrderDetail od where od.order.status=4 and od.order.orderDate between :min and :max " +
            " group by CAST(CEILING(MONTH(od.order.orderDate)/3.0) as int)")
    Iterable<OrderDetail> findByQuarter(Date min, Date max);

    //By Month
    @Query(value = "select month(od.order.orderDate),sum(od.quantity),sum(od.quantity * od.amount * (1 - od.discount)),min(od.amount),max(od.amount)," +
            "avg(od.amount) from OrderDetail od where od.order.status = 4 and od.order.orderDate between :min and :max group by month(od.order.orderDate)")
    Iterable<OrderDetail> findByMonth(Date min, Date max);

    @Query(value = "select year(od.order.orderDate),sum(od.quantity),sum(od.quantity * od.amount *(1 -od.discount)),min(od.amount),max(od.amount)," +
            "avg(od.amount) from OrderDetail od where od.order.status = 4 and od.order.orderDate between :min and :max group by year(od.order.orderDate)")
    Iterable<OrderDetail> findByYear(Date min, Date max);

    @Query(value = "select CAST(getdate()as date),sum(od.quantity),sum(od.quantity * od.amount *(1 -od.discount)),min(od.amount),max(od.amount)," +
            "avg(od.amount)  from OrderDetail od where od.order.status = 4 and CAST(getdate()as date) like CAST(od.order.orderDate as date)")
    Iterable<OrderDetail> findByToday();

}
