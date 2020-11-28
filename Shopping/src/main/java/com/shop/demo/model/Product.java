package com.shop.demo.model;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Collection;
import java.util.Date;

@Entity
@Table(name = "Products", schema = "dbo")
public class Product implements java.io.Serializable {

    private static final long serialVersionUID = 4208468054445602750L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID", unique = true, nullable = false)
    private Integer id;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "CategoryID", nullable = false)
    private Category category;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "ProducerID", nullable = false)
    private Producer producer;
    @Column(name = "name_product", nullable = false)
    private String nameProduct;
    @Column(name = "Photo")
    private String photo;
    @Column(name = "Quantity", nullable = false)
    private Integer quantity;
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    @Column(name = "ProductDate", nullable = false, length = 23)
    private Date productDate;
    @Column(name = "UnitBrief", nullable = false)
    private String unitBrief;
    @Column(name = "UnitPrice", nullable = false, precision = 53, scale = 0)
    private Double unitPrice;
    @Column(name = "Discount", precision = 53, scale = 0)
    private Double discount;
    @Column(name = "Description")
    private String description;
    @Column(name = "Views")
    private Integer views;
    @Column(name = "Available")
    private Boolean available;
    @Column(name = "Special")
    private Boolean special;
    @Column(name = "New")
    private Boolean news;
    @Column(name = "Status", nullable = false)
    private Boolean status;
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "product")
    private Collection<OrderDetail> orderDetail;

    public Product() {
    }

    public Product(Integer id, Category category, Producer producer, String nameProduct, Integer quantity,
                   Date productDate, String unitBrief, Double unitPrice) {
        this.id = id;
        this.category = category;
        this.producer = producer;
        this.nameProduct = nameProduct;
        this.quantity = quantity;
        this.productDate = productDate;
        this.unitBrief = unitBrief;
        this.unitPrice = unitPrice;
    }

    public Product(Integer id, Category category, Producer producer, String nameProduct,
                   String photo, Integer quantity, Date productDate, String unitBrief,
                   Double unitPrice, Double discount, String description, Integer views,
                   Boolean available, Boolean special, Boolean news, Boolean status,
                   Collection<OrderDetail> orderDetail) {
        this.id = id;
        this.category = category;
        this.producer = producer;
        this.nameProduct = nameProduct;
        this.photo = photo;
        this.quantity = quantity;
        this.productDate = productDate;
        this.unitBrief = unitBrief;
        this.unitPrice = unitPrice;
        this.discount = discount;
        this.description = description;
        this.views = views;
        this.available = available;
        this.special = special;
        this.news = news;
        this.status = status;
        this.orderDetail = orderDetail;
    }


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public Producer getProducer() {
        return producer;
    }

    public void setProducer(Producer producer) {
        this.producer = producer;
    }

    public String getNameProduct() {
        return nameProduct;
    }

    public void setNameProduct(String nameProduct) {
        this.nameProduct = nameProduct;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Date getProductDate() {
        return productDate;
    }

    public void setProductDate(Date productDate) {
        this.productDate = productDate;
    }

    public String getUnitBrief() {
        return unitBrief;
    }

    public void setUnitBrief(String unitBrief) {
        this.unitBrief = unitBrief;
    }

    public Double getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(Double unitPrice) {
        this.unitPrice = unitPrice;
    }

    public Double getDiscount() {
        return discount;
    }

    public void setDiscount(Double discount) {
        this.discount = discount;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getViews() {
        return views;
    }

    public void setViews(Integer views) {
        this.views = views;
    }

    public Boolean getAvailable() {
        return available;
    }

    public void setAvailable(Boolean available) {
        this.available = available;
    }

    public Boolean getSpecial() {
        return special;
    }

    public void setSpecial(Boolean special) {
        this.special = special;
    }

    public Boolean getNews() {
        return news;
    }

    public void setNews(Boolean news) {
        this.news = news;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public Collection<OrderDetail> getOrderDetail() {
        return orderDetail;
    }

    public void setOrderDetail(Collection<OrderDetail> orderDetail) {
        this.orderDetail = orderDetail;
    }

}
