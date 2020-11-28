package com.shop.demo.controller.employee;

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
@RequestMapping(value = "/Shopping.com/employee/inventory")
public class InventoryController {
    @Autowired
    private ProductService productService;

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String productInventory(Model model, Pageable pageable, HttpServletResponse response) {
        //Thống kê danh mục
        Page<Product> page = productService.findTotalSumProduct(pageable);
        response.setHeader("listProduct", "/Shopping.com/employee/inventory");
        model.addAttribute("number1", page.getNumber());
        model.addAttribute("totalPages1", page.getTotalPages());
        model.addAttribute("totalElements1", page.getTotalElements());
        model.addAttribute("size1", page.getSize());
        model.addAttribute("totalProduct1", page.getContent());
        //Thống kê nhà cung cấp
        Page<Product> page1 = productService.findTotalSumProducer(pageable);
        response.setHeader("listProducer", "Shopping.com/employee/inventory");
        model.addAttribute("number2", page1.getNumber());
        model.addAttribute("totalPages2", page1.getTotalPages());
        model.addAttribute("totalElements2", page1.getTotalElements());
        model.addAttribute("size2", page1.getSize());
        model.addAttribute("totalProducer2", page1.getContent());
        //Thốnng kê Danh Mục và Nhà Cung Cấp
        Page<Product> page2 = productService.findTotal2(pageable);
        response.setHeader("list2", "Shopping.com/employee/inventory");
        model.addAttribute("number3", page2.getNumber());
        model.addAttribute("totalPages3", page2.getTotalPages());
        model.addAttribute("totalElements3", page2.getTotalElements());
        model.addAttribute("size3", page2.getSize());
        model.addAttribute("total2", page2.getContent());
        return "/employee/inventory";
    }


}
