package com.shop.demo.model;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import java.util.Date;

@Entity
@Table(name = "Employees", schema = "dbo")
public class Employee implements java.io.Serializable {

    private static final long serialVersionUID = -366138773887840922L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column(name = "username", unique = true, nullable = false, length = 20)
    private String username;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "DepartmentID", nullable = false)
    private Department department;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "EmployeeTypeID", nullable = false)
    private EmployeeType employeeType;
    @Email(message = "Email không đúng dịnh dạng")
    @Column(name = "Email", nullable = false)
    private String email;
    @NotBlank(message = "Vui lòng nhập mật khẩu")
    @Column(name = "Password", nullable = false)
    private String password;
    @Column(name = "NameEmployee", nullable = false)
    private String nameEmployee;
    //    @NotNull
    @Column(name = "Gender", nullable = false)
    private Integer gender;
    @Column(name = "Photo")
    private String photo;
    @Column(name = "Address", nullable = false)
    private String address;
    @Column(name = "NumberPhone", nullable = false)
    private String numberPhone;
    //    @NotNull
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    @Column(name = "Birthday", nullable = false, length = 23)
    private Date birthday;
    @Column(name = "Access", nullable = false)
    private Integer access;
    @Column(name = "Activated", nullable = false)
    private Boolean activated;
    @OneToOne(fetch = FetchType.LAZY, mappedBy = "employee")
    private Contract contract;

    public Employee() {
    }

    public Employee(Long id, String username, Department department, EmployeeType employeeType, String email, String password,
                    String nameEmployee, Integer gender, String address, String numberPhone, Date birthday, Integer access,
                    Boolean activated) {
        this.id = id;
        this.username = username;
        this.department = department;
        this.employeeType = employeeType;
        this.email = email;
        this.password = password;
        this.nameEmployee = nameEmployee;
        this.gender = gender;
        this.address = address;
        this.numberPhone = numberPhone;
        this.birthday = birthday;
        this.access = access;
        this.activated = activated;
    }

    public Employee(Long id, String username, Department department, EmployeeType employeeType, String email, String password,
                    String nameEmployee, Integer gender, String photo, String address, String numberPhone, Date birthday,
                    Integer access, Boolean activated, Contract contract) {
        this.id = id;
        this.username = username;
        this.department = department;
        this.employeeType = employeeType;
        this.email = email;
        this.password = password;
        this.nameEmployee = nameEmployee;
        this.gender = gender;
        this.photo = photo;
        this.address = address;
        this.numberPhone = numberPhone;
        this.birthday = birthday;
        this.access = access;
        this.activated = activated;
        this.contract = contract;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Department getDepartment() {
        return this.department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    public EmployeeType getEmployeeType() {
        return this.employeeType;
    }

    public void setEmployeeType(EmployeeType employeeType) {
        this.employeeType = employeeType;
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

    public String getNameEmployee() {
        return this.nameEmployee;
    }

    public void setNameEmployee(String nameEmployee) {
        this.nameEmployee = nameEmployee;
    }

    public Integer getGender() {
        return this.gender;
    }

    public void setGender(Integer gender) {
        this.gender = gender;
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

    public Integer getAccess() {
        return this.access;
    }

    public void setAccess(Integer access) {
        this.access = access;
    }

    public Boolean getActivated() {
        return this.activated;
    }

    public void setActivated(Boolean activated) {
        this.activated = activated;
    }

    public Contract getContract() {
        return contract;
    }

    public void setContract(Contract contract) {
        this.contract = contract;
    }
}
