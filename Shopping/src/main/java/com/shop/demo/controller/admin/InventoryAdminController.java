package com.shop.demo.controller.admin;

import com.shop.demo.model.Product;
import com.shop.demo.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping(value = "/Shopping.com/admin/inventory", method = RequestMethod.GET)
public class InventoryAdminController {

    @Autowired
    private ProductService productService;

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String productInventory(Model model, Pageable pageable, HttpServletResponse response) {
        //Thống kê danh mục
        Page<Product> page = productService.findTotalSumProduct(pageable);
        response.setHeader("listProduct", "/Shopping.com/admin/inventory");
        model.addAttribute("number", page.getNumber());
        model.addAttribute("totalPages", page.getTotalPages());
        model.addAttribute("totalElements", page.getTotalElements());
        model.addAttribute("size", page.getSize());
        model.addAttribute("totalProduct", page.getContent());
        //Thống kê nhà cung cấp
        Page<Product> page1 = productService.findTotalSumProducer(pageable);
        response.setHeader("listProducer", "Shopping.com/admin/inventory");
        model.addAttribute("number", page1.getNumber());
        model.addAttribute("totalPages", page1.getTotalPages());
        model.addAttribute("totalElements", page1.getTotalElements());
        model.addAttribute("size", page1.getSize());
        model.addAttribute("totalProducer", page1.getContent());
        //Thốnng kê Danh Mục và Nhà Cung Cấp
        Page<Product> page2 = productService.findTotal2(pageable);
        response.setHeader("list2", "Shopping.com/admin/inventory");
        model.addAttribute("number", page2.getNumber());
        model.addAttribute("totalPages", page2.getTotalPages());
        model.addAttribute("totalElements", page2.getTotalElements());
        model.addAttribute("size", page2.getSize());
        model.addAttribute("total2", page2.getContent());
        return "/admin/inventory";
    }


}
