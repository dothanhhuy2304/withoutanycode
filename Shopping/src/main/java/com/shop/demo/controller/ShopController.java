package com.shop.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;

@Controller
public class ShopController {

    @Autowired
    protected ShoppingCart cart;

    @ModelAttribute("cart")
    public ShoppingCart getShoppingCart() {
        return cart;
    }
}
