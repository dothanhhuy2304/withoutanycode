package com.shop.demo.model;

import java.util.Collection;
import java.util.Date;

import javax.persistence.*;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "Orders", schema = "dbo")
public class Order implements java.io.Serializable {

    private static final long serialVersionUID = -1000948805752937489L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID", unique = true, nullable = false)
    private Integer id;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "CustomerID", nullable = false)
    private Customer customer;
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    @Column(name = "OrderDate", nullable = false, length = 23)
    private Date orderDate;
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    @Column(name = "RequireDate", nullable = false, length = 23)
    private Date requireDate;
    @Column(name = "Amount", nullable = false, precision = 53, scale = 0)
    private Double amount;
    @Column(name = "Receiver", nullable = false)
    private String receiver;
    @Column(name = "Address", nullable = false)
    private String address;
    @Column(name = "Description")
    private String description;
    @Column(name = "numberPhone", nullable = false)
    private String numberPhone;
    @Column(name = "Status", nullable = false)
    private Integer status;
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "order")
    private Collection<OrderDetail> orderDetail;

    public Order() {
    }

    public Order(Integer id, Customer customer, Date orderDate, Date requireDate, Double amount, String receiver,
                 String address, String description, String numberPhone, Integer status) {
        this.id = id;
        this.customer = customer;
        this.orderDate = orderDate;
        this.requireDate = requireDate;
        this.amount = amount;
        this.receiver = receiver;
        this.address = address;
        this.description = description;
        this.numberPhone = numberPhone;
        this.status = status;
    }

    public Order(Integer id, Customer customer, Date orderDate, Date requireDate, Double amount, String receiver,
                 String address, String description, String numberPhone, Integer status,
                 Collection<OrderDetail> orderDetail) {
        this.id = id;
        this.customer = customer;
        this.orderDate = orderDate;
        this.requireDate = requireDate;
        this.amount = amount;
        this.receiver = receiver;
        this.address = address;
        this.description = description;
        this.numberPhone = numberPhone;
        this.status = status;
        this.orderDetail = orderDetail;
    }

    public Integer getId() {
        return this.id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Customer getCustomer() {
        return this.customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public Date getOrderDate() {
        return this.orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public Date getRequireDate() {
        return this.requireDate;
    }

    public void setRequireDate(Date requireDate) {
        this.requireDate = requireDate;
    }

    public Double getAmount() {
        return this.amount;
    }

    public void setAmount(Double amount) {
        this.amount = amount;
    }

    public String getReceiver() {
        return this.receiver;
    }

    public void setReceiver(String receiver) {
        this.receiver = receiver;
    }

    public String getAddress() {
        return this.address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getDescription() {
        return this.description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getNumberPhone() {
        return this.numberPhone;
    }

    public void setNumberPhone(String numberPhone) {
        this.numberPhone = numberPhone;
    }

    public Integer getStatus() {
        return this.status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Collection<OrderDetail> getOrderDetail() {
        return orderDetail;
    }

    public void setOrderDetail(Collection<OrderDetail> orderDetail) {
        this.orderDetail = orderDetail;
    }
}
