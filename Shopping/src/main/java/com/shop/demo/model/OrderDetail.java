package com.shop.demo.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "OrderDetails", schema = "dbo")
public class OrderDetail implements java.io.Serializable {

    private static final long serialVersionUID = 2488915218386039039L;
    @Id
    @GeneratedValue
    @Column(name = "ID", unique = true, nullable = false)
    private Integer id;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "OrderID", nullable = false)
    private Order order;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "ProductID", nullable = false)
    private Product product;
    @Column(name = "Quantity", nullable = false)
    private Integer quantity;
    @Column(name = "Amount", nullable = false, precision = 53, scale = 0)
    private Double amount;
    @Column(name = "Discount", nullable = false, precision = 53, scale = 0)
    private Double discount;

    public OrderDetail() {
    }

    public OrderDetail(Integer id, Order order, Product product, Integer quantity, Double amount, Double discount) {
        this.id = id;
        this.order = order;
        this.product = product;
        this.quantity = quantity;
        this.amount = amount;
        this.discount = discount;
    }

    public Integer getId() {
        return this.id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Order getOrder() {
        return this.order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public Product getProduct() {
        return this.product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Integer getQuantity() {
        return this.quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Double getAmount() {
        return this.amount;
    }

    public void setAmount(Double amount) {
        this.amount = amount;
    }

    public Double getDiscount() {
        return this.discount;
    }

    public void setDiscount(Double discount) {
        this.discount = discount;
    }

}
