package com.shop.demo.repository;

import com.shop.demo.model.Employee;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface EmployeeRepository extends JpaRepository<Employee, Long> {

    @Query(value = "select c from Employee c where c.nameEmployee like ?1 or c.email like ?1")
    Page<Employee> searchByEmployee(String key, Pageable pageable);

    @Query(value = "select c from Employee c where  c.username like ?1 and c.password like ?2")
    Employee checkLogin(String username, String password);

    @Query(value = "select c.password from Employee c where c.username like ?1")
    String findEmployeePassword(String id);

    @Query(value = "select c from Employee  c where  c.username like ?1")
    Employee findByUserEmployee(String username);

    @Query(value = "select c.username from Employee  c where  c.username like ?1")
    String checkUserName(String username);

    @Query(value = "select  c from Employee  c where  c.id like ?1")
    Employee findByIdEmployee(Long id);

    //Find By department
    @Query(value = "select c.id from Employee c where c.department.id like '%' || :key || '%'")
    Employee findEmployeeByDepartmentId(String key);

}
