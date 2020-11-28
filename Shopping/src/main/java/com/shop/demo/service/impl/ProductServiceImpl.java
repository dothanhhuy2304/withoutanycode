package com.shop.demo.service.impl;

import com.shop.demo.model.Product;
import com.shop.demo.repository.ProductRepository;
import com.shop.demo.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductRepository productRepository;


    @Override
    public List<Product> findAllProduct() {
        return productRepository.findAll();
    }

    //List
    @Override
    public Page<Product> findAlls(final Pageable pageable) {
        return productRepository.findAll(pageable);
    }

    //Tìm kiếm theo tên
    @Override
    public Page<Product> search(final String key, final Pageable pageable) {
        return productRepository.search(key, pageable);
    }

    @Override
    public Product findById(final int id) {
        return productRepository.findById(id).get();
    }

    @Override
    public Optional<Product> findOne(final int id) {
        return productRepository.findById(id);
    }

    @Override
    public void save(final Product product) {
        productRepository.save(product);
    }

    @Override
    public void delete(final Product product) {
        productRepository.delete(product);
    }

    // Find theo thể loại
    @Override
    public Page<Product> searchByCategory(final Integer id, final Pageable pageable) {
        return productRepository.searchByCategory(id, pageable);
    }
    //Find theo hãng sản xuất

    @Override
    public Page<Product> searchByProducer(final Integer id, final Pageable pageable) {
        return productRepository.searchByProducer(id, pageable);
    }

    //Find hàng mới nhất
    @Override
    public Page<Product> searchByNews(final Pageable pageable) {
        return productRepository.searchByNews(pageable);
    }

    //Find hàng giảm giá
    @Override
    public Page<Product> searchBySales(final Pageable pageable) {
        return productRepository.searchBySales(pageable);
    }
    //Find theo lượt xem

    @Override
    public Page<Product> searchByViews(final Pageable pageable) {
        return productRepository.searchByViews(pageable);
    }
    //Find theo hàng đặc biệt

    @Override
    public Page<Product> searchBySpecial(Pageable pageable) {
        return productRepository.searchBySpecial(pageable);
    }

    @Override
    public Page<Product> searchBySaleNews(Pageable pageable) {
        return productRepository.searchBySaleNews(pageable);
    }

    @Override
    public Page<Product> searchByBuy(Pageable pageable) {
        return productRepository.searchByBuy(pageable);
    }

    //Employee
    @Override
    public List<Product> searchByStatus(String key) {
        return productRepository.searchByStatus(key);
    }

    @Override
    public List<Product> searchByAll(String key, Integer DM, Integer HSX) {
        return productRepository.searchByAll(key, DM, HSX);
    }

    @Override
    public List<Product> searchByKey(String key) {
        return productRepository.searchByKey(key);
    }

    @Override
    public List<Product> searchBy2(Integer DM, Integer HSX) {
        return productRepository.searchBy2(DM, HSX);
    }

    @Override
    public List<Product> searchByCate(Integer DM) {
        return productRepository.searchByCate(DM);
    }

    @Override
    public List<Product> searchByPro(Integer HSX) {
        return productRepository.searchByPro(HSX);
    }

    @Override
    public List<Product> searchByNameAndCate(String key, Integer DM) {
        return productRepository.searchByNameAndCate(key, DM);
    }

    @Override
    public List<Product> searchByNameAndPro(String key, Integer HSX) {
        return productRepository.searchByNameAndPro(key, HSX);
    }
    //Inventory

    @Override
    public List<Product> ProductInventory() {
        return productRepository.ProductInventory();
    }

    @Override
    public Page<Product> findTotalSumProduct(Pageable pageable) {
        return productRepository.findTotalSumProduct(pageable);
    }

    @Override
    public Page<Product> findTotalSumProducer(Pageable pageable) {
        return productRepository.findTotalSumProducer(pageable);
    }

    @Override
    public Page<Product> findTotal2(Pageable pageable) {
        return productRepository.findTotal2(pageable);
    }

    @Override
    public List<Product> findTotalByCategoryByProducer() {
        return productRepository.findTotalByCategoryByProducer();
    }
}
