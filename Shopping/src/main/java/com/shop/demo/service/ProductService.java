package com.shop.demo.service;

import com.shop.demo.model.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Optional;

public interface ProductService {

    List<Product> findAllProduct();

    Page<Product> search(final String key, final Pageable pageable);

    Product findById(final int id);

    Optional<Product> findOne(final int id);

    void save(final Product product);

    void delete(final Product product);

    Page<Product> findAlls(final Pageable pageable);

    Page<Product> searchByCategory(final Integer id, final Pageable pageable);

    Page<Product> searchByProducer(final Integer id, final Pageable pageable);

    Page<Product> searchByNews(final Pageable pageable);

    Page<Product> searchBySales(final Pageable pageable);

    Page<Product> searchByViews(final Pageable pageable);

    Page<Product> searchBySpecial(final Pageable pageable);

    Page<Product> searchBySaleNews(final Pageable pageable);

    Page<Product> searchByBuy(final Pageable pageable);

    //Employee
    List<Product> searchByStatus(String key);

    List<Product> searchByAll(String key, Integer DM, Integer HSX);

    List<Product> searchByKey(String key);

    List<Product> searchBy2(Integer DM, Integer HSX);

    List<Product> searchByCate(Integer DM);

    List<Product> searchByPro(Integer HSX);

    List<Product> searchByNameAndCate(String key, Integer DM);

    List<Product> searchByNameAndPro(String key, Integer HSX);

    //Inventory
    List<Product> ProductInventory();

    Page<Product> findTotalSumProduct(Pageable pageable);

    Page<Product> findTotalSumProducer(Pageable pageable);

    Page<Product> findTotal2(Pageable pageable);

    List<Product> findTotalByCategoryByProducer();

}
