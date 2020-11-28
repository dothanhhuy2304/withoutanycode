package com.shop.demo.repository;


import com.shop.demo.model.Category;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface CategoryRepository extends JpaRepository<Category, Integer> {

    @Query(value = "select c from Category c where c.nameCategory like '%' || :key || '%'" +
            "or c.nameCategoryEN like '%' || :key || '%'")
    Page<Category> search(@Param("key") String key, Pageable pageable);

}
