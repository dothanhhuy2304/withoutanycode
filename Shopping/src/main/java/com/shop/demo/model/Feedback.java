package com.shop.demo.model;

import javax.persistence.*;
import javax.validation.constraints.Email;


@Entity
@Table(name = "feedback")
public class Feedback implements java.io.Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;
    @Column(name = "name", nullable = false)
    private String name;
    @Email
    @Column(name = "email", nullable = false)
    private String email;
    @Column(name = "theme")
    private String theme;
    @Column(name = "description", nullable = false)
    private String description;

    public Feedback() {
        super();
    }

    public Feedback(Integer id, String name, @Email String email, String theme, String description) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.theme = theme;
        this.description = description;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTheme() {
        return theme;
    }

    public void setTheme(String theme) {
        this.theme = theme;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
