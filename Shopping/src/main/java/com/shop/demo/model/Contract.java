package com.shop.demo.model;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "Contracts", schema = "dbo")
public class Contract implements java.io.Serializable {


    @GenericGenerator(name = "generator", strategy = "foreign", parameters = @Parameter(name = "property", value = "employee"))
    @Id
    @GeneratedValue(generator = "generator")
    @Column(name = "ID", unique = true, nullable = false, length = 20)
    private Long id;

    @OneToOne(fetch = FetchType.LAZY)
    @PrimaryKeyJoinColumn
    private Employee employee;

    @Column(name = "NameContract", nullable = false)
    private String nameContract;

    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    @Column(name = "StartTime", nullable = false, length = 23)
    private Date startTime;

    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    @Column(name = "EndTime", length = 23)
    private Date endTime;

    @Column(name = "Subsidize")
    private Integer subsidize;
    @NotNull
    @Min(1000000)
    @Max(30000000)
    @Column(name = "Salary", precision = 53, scale = 0)
    private Double salary;
    @Column(name = "Status", nullable = false)
    private Integer status;

    public Contract() {
    }

    public Contract(Employee employee, String nameContract, Date startTime, Integer status) {
        this.employee = employee;
        this.nameContract = nameContract;
        this.startTime = startTime;
        this.status = status;
    }

    public Contract(Employee employee, String nameContract, Date startTime, Date endTime, Integer subsidize,
                    Double salary, Integer status) {
        this.employee = employee;
        this.nameContract = nameContract;
        this.startTime = startTime;
        this.endTime = endTime;
        this.subsidize = subsidize;
        this.salary = salary;
        this.status = status;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Employee getEmployee() {
        return this.employee;
    }


    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public String getNameContract() {
        return this.nameContract;
    }

    public void setNameContract(String nameContract) {
        this.nameContract = nameContract;
    }

    public Date getStartTime() {
        return this.startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return this.endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public Integer getSubsidize() {
        return this.subsidize;
    }

    public void setSubsidize(Integer subsidize) {
        this.subsidize = subsidize;
    }

    public Double getSalary() {
        return this.salary;
    }

    public void setSalary(Double salary) {
        this.salary = salary;
    }

    public Integer getStatus() {
        return this.status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

}
