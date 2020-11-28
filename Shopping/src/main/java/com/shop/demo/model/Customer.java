package com.shop.demo.model;

import java.util.Collection;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Email;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "Customers", schema = "dbo")
public class Customer implements java.io.Serializable {

    private static final long serialVersionUID = 6592837700550083314L;
    @Id
    @Column(name = "ID", unique = true, nullable = false, length = 20)
    private String id;
    @Column(name = "Code", unique = true, nullable = false)
    private String code;
    @Email
    @Column(name = "Email", nullable = false)
    private String email;
    @Column(name = "Password", nullable = false)
    private String password;
    @Column(name = "FullName", nullable = false)
    private String fullName;
    @Column(name = "Photo")
    private String photo;
    @Column(name = "Address", nullable = false)
    private String address;
    @Column(name = "NumberPhone", nullable = false)
    private String numberPhone;
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    @Column(name = "Birthday", nullable = false, length = 23)
    private Date birthday;
    @Column(name = "Gender", nullable = false)
    private Integer gender;
    @Column(name = "access", nullable = false)
    private Integer access;
    @Column(name = "Activated", nullable = false)
    private Boolean activated;
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "customer")
    private Collection<Order> order;

    public Customer() {
    }

    public Customer(String id, String code, String email, String password, String fullName, String address, String numberPhone,
                    Date birthday, Boolean activated, Integer gender) {
        this.id = id;
        this.code = code;
        this.email = email;
        this.password = password;
        this.fullName = fullName;
        this.address = address;
        this.numberPhone = numberPhone;
        this.birthday = birthday;
        this.activated = activated;
        this.gender = gender;
    }

    public Customer(String id, String code, String email, String password, String fullName, String photo, String address,
                    String numberPhone, Date birthday, Boolean activated, Integer gender, Collection<Order> order) {
        this.id = id;
        this.code = code;
        this.email = email;
        this.password = password;
        this.fullName = fullName;
        this.photo = photo;
        this.address = address;
        this.numberPhone = numberPhone;
        this.birthday = birthday;
        this.activated = activated;
        this.gender = gender;
        this.order = order;
    }


    public String getId() {
        return this.id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getEmail() {
        return this.email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return this.password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullName() {
        return this.fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPhoto() {
        return this.photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getAddress() {
        return this.address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getNumberPhone() {
        return this.numberPhone;
    }

    public void setNumberPhone(String numberPhone) {
        this.numberPhone = numberPhone;
    }

    public Date getBirthday() {
        return this.birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public Boolean getActivated() {
        return this.activated;
    }

    public void setActivated(Boolean activated) {
        this.activated = activated;
    }

    public Integer getGender() {
        return this.gender;
    }

    public void setGender(Integer gender) {
        this.gender = gender;
    }

    public Integer getAccess() {
        return access;
    }

    public void setAccess(Integer access) {
        this.access = access;
    }

    public Collection<Order> getOrder() {
        return order;
    }

    public void setOrder(Collection<Order> order) {
        this.order = order;
    }

}
