package com.shop.demo.service.impl;

import com.shop.demo.model.Admin;
import com.shop.demo.repository.AdminRepository;
import com.shop.demo.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminRepository adminRepository;

    @Override
    public Page<Admin> findAllAdmin(Pageable pageable) {
        return adminRepository.findAll(pageable);
    }

    @Override
    public List<Admin> findAll() {
        return adminRepository.findAll();
    }

    @Override
    public Page<Admin> searchByAdmin(String key, Pageable pageable) {
        return adminRepository.searchByAdmin(key, pageable);
    }

    @Override
    public Admin findOneAdmin(String id) {
        return adminRepository.findByUsername(id);
    }

    @Override
    public void save(Admin admin) {
        adminRepository.save(admin);
    }

    @Override
    public void delete(Admin admin) {
        adminRepository.delete(admin);
    }

    @Override
    public String checkAdminPassword(String id) {
        return adminRepository.checkAdminPassword(id);
    }

    @Override
    public Admin checkLogin(String username, String password) {
        return adminRepository.checkLogin(username, password);
    }

    @Override
    public String checkId(String username) {
        return adminRepository.checkId(username);
    }
}
