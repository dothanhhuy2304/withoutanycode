package com.shop.demo.service;

import com.shop.demo.model.Category;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface CategoryService {

    Page<Category> findAll(Pageable pageable);

    List<Category> findAllCategory();

    Page<Category> search(String key, Pageable pageable);

    Category findOne(Integer id);

    void saveCategory(Category category);

    void deleteCategory(Category category);

}
