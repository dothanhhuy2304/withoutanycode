package com.shop.demo.controller;

import com.shop.demo.model.Product;
import com.shop.demo.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

@Scope(proxyMode = ScopedProxyMode.TARGET_CLASS, value = "session")
public class ShoppingCart {

    @Autowired
    private ProductService productService;


    Map<Integer, Product> map = new HashMap<Integer, Product>();

    /**
     * Bỏ mặt hàng vào giỏ. Nếu mặt hàng đã có thì tăng số lượng lên 1 và ngược
     */
    public void add(Integer id) {
        Product item = map.get(id);
        if (item == null) {
            Product product = productService.findById(id);
            item = (Product) product;
            item.setQuantity(1);
            map.put(id, item);
        } else {
            item.setQuantity(item.getQuantity() + 1);
        }
    }

    public void remove(Integer id) {
        map.remove(id);
    }

    public void clear() {
        map.clear();
    }


    public int getCount() {
        int count = 0;
        Collection<Product> items = map.values();
        for (Product p : items) {
            count += p.getQuantity();
        }
        return count;
    }

    /**
     * Lấy tổng số tiền của giỏ hàng
     */
    public double getAmount() {
        double amount = 0;
        Collection<Product> items = map.values();
        for (Product p : items) {
            amount += p.getQuantity() * p.getUnitPrice() * (1 - p.getDiscount());
        }
        return amount;
    }

    /**
     * Lấy quantity cho ajax
     */
    public int getQuantity() {
        int count = 0;
        Collection<Product> items = map.values();
        for (Product p : items) {
            count += p.getQuantity();
        }
        return count;
    }

    /**
     * Lấy tập các sản phẩm trong giỏ
     */
    public Collection<Product> getItems() {
        return map.values();
    }

    public void incrementUpdate(Integer id) {
        Product item = map.get(id);
        item.setQuantity(item.getQuantity() + 1);
    }


    public void decrementUpdate(Integer id) {
        Product item = map.get(id);
        if (item.getQuantity() <= 1) {
            item.setQuantity(1);
        }
        item.setQuantity(item.getQuantity() - 1);
    }
}
