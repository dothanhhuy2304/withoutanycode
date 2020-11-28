package com.shop.demo.service;

import com.shop.demo.model.Admin;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface AdminService {

    Page<Admin> findAllAdmin(Pageable pageable);

    List<Admin> findAll();

    Page<Admin> searchByAdmin(String key, Pageable pageable);

    Admin findOneAdmin(String id);

    void save(Admin admin);

    void delete(Admin admin);

    //Login
    String checkAdminPassword(String id);

    Admin checkLogin(String username, String password);

    String checkId(String username);


}
