package com.shop.demo.model;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "departments", schema = "dbo")
public class Department implements java.io.Serializable {

    private static final long serialVersionUID = 8281057723158888384L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID", nullable = false, length = 12)
    private Integer id;
    @Column(name = "Code", nullable = false, length = 12)
    private String code;
    @Column(name = "NameDepartment", nullable = false)
    private String nameDepartment;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "department")
    private Set<Employee> employee = new HashSet<Employee>(0);

    public Department() {
    }

    public Department(Integer id, String code, String nameDepartment) {
        this.id = id;
        this.code = code;
        this.nameDepartment = nameDepartment;
    }

    public Department(Integer id, String code, String nameDepartment, Set<Employee> employee) {
        this.id = id;
        this.code = code;
        this.nameDepartment = nameDepartment;
        this.employee = employee;
    }


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getNameDepartment() {
        return nameDepartment;
    }

    public void setNameDepartment(String nameDepartment) {
        this.nameDepartment = nameDepartment;
    }

    public Set<Employee> getEmployee() {
        return employee;
    }

    public void setEmployee(Set<Employee> employee) {
        this.employee = employee;
    }
}
