package com.shop.demo.model;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;


@Entity
@Table(name = "EmployeeTypes", schema = "dbo")
public class EmployeeType implements java.io.Serializable {

    private static final long serialVersionUID = -4250837235320825545L;
    @Id
    @Column(name = "ID", unique = true, nullable = false, length = 12)
    private String id;
    @Column(name = "NameEmployeeType", nullable = false)
    private String nameEmployeeType;
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "employeeType")
    private Set<Employee> employee = new HashSet<Employee>(0);

    public EmployeeType() {
    }

    public EmployeeType(String id, String nameEmployeeType) {
        this.id = id;
        this.nameEmployeeType = nameEmployeeType;
    }

    public EmployeeType(String id, String nameEmployeeType, Set<Employee> employee) {
        this.id = id;
        this.nameEmployeeType = nameEmployeeType;
        this.employee = employee;
    }

    public String getId() {
        return this.id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getNameEmployeeType() {
        return this.nameEmployeeType;
    }

    public void setNameEmployeeType(String nameEmployeeType) {
        this.nameEmployeeType = nameEmployeeType;
    }

    public Set<Employee> getEmployee() {
        return this.employee;
    }

    public void setEmployee(Set<Employee> employee) {
        this.employee = employee;
    }

}
