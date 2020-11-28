package com.shop.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/Shopping.com/shopping-cart")
public class UserCartController extends ShopController {

    @RequestMapping("/index")
    public String index() {
        return "views/shopping-cart";
    }

    // Xử lý thêm giỏ hàng
    @RequestMapping("add/{id}")
    public String addToCart(@PathVariable Integer id) {
        cart.add(id);
        return "redirect:/Shopping.com/shopping-cart/index";
    }

    //Xóa 1 sản phẩm
    @RequestMapping(value = "remove-ajax/{id}")
    public void removeFromCartAjax(HttpServletResponse response, @PathVariable Integer id) {
        cart.remove(id);
        Json.writePairs(response, "count", cart.getCount(), "amount", String.format("%.3f", cart.getAmount()));
    }

    // Xử lý xóa hết giỏ hàng
    @RequestMapping("/clear")
    public String clearCart() {
        cart.clear();
        return "views/shopping-cart";
    }

    @RequestMapping(value = "iUpdate/{id}", method = RequestMethod.GET)
    public void incrementUpdate(@PathVariable int id, HttpServletResponse response) {
        cart.incrementUpdate(id);
        Json.writePairs(response, "count", cart.getCount(), "amount", cart.getAmount(), "quantity", cart.getQuantity());
    }

    @RequestMapping(value = "dUpdate/{id}", method = RequestMethod.GET)
    public void decrementUpdate(@PathVariable int id, HttpServletResponse response) {
        cart.decrementUpdate(id);
        Json.writePairs(response, "count", cart.getCount(), "amount", cart.getAmount(), "quantity", cart.getQuantity());
    }


}
