package com.shop.demo.model;

import javax.persistence.*;

@Entity
@Table(name = "Admin")
public class Admin {
    @Id
    @Column(name = "UserName")
    private String username;
    @Column(name = "PassWord")
    private String password;
    @Column(name = "FullName")
    private String fullName;
    @Column(name = "Access")
    private int access;

    public Admin() {
        super();
    }

    public Admin(String username, String password, String fullName, int access) {
        this.username = username;
        this.password = password;
        this.fullName = fullName;
        this.access = access;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public int getAccess() {
        return access;
    }

    public void setAccess(int access) {
        this.access = access;
    }
}
