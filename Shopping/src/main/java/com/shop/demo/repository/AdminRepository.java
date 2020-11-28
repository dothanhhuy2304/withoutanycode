package com.shop.demo.repository;

import com.shop.demo.model.Admin;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface AdminRepository extends JpaRepository<Admin, String> {

    @Query(value = "select c from Admin c where c.username like ?1 or c.fullName like ?1")
    Page<Admin> searchByAdmin(String key, Pageable pageable);

    Admin findByUsername(String id);

    @Query(value = "select c.password from  Admin c where c.username like ?1")
    String checkAdminPassword(String id);

    @Query(value = "select c from Admin c where c.username like ?1 and c.password like ?2")
    Admin checkLogin(String username, String password);

    @Query(value = "select c.username from Admin c where c.username like ?1")
    String checkId(String username);

}
