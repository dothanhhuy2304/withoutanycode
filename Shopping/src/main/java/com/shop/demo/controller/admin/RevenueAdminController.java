package com.shop.demo.controller.admin;

import com.shop.demo.model.OrderDetail;
import com.shop.demo.service.OrderDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Date;

@Controller
@RequestMapping(value = "/Shopping.com/admin/revenue", method = RequestMethod.GET)
public class RevenueAdminController {

    @Autowired
    private OrderDetailService orderDetailService;

    @RequestMapping(value = "by-category.htm", method = RequestMethod.POST)
    public String byCategory(Model model, @RequestParam(defaultValue = "01/01/2019") Date min,
                             @RequestParam(defaultValue = "31/12/2900") Date max) {
        Iterable<OrderDetail> orderDetails = orderDetailService.findByCategory(min, max);
        model.addAttribute("arrays", orderDetails);
        return "admin/revenue";
    }

    @RequestMapping(value = "by-producer.htm", method = RequestMethod.POST)
    public String byProducer(Model model, @RequestParam(defaultValue = "01/01/2019") Date min,
                             @RequestParam(defaultValue = "31/12/2900") Date max) {
        model.addAttribute("arrays", orderDetailService.findByProducer(min, max));
        return "admin/revenue";
    }

    @RequestMapping(value = "by-customer.htm", method = RequestMethod.POST)
    public String byCustomer(Model model, @RequestParam(defaultValue = "01/01/2019") Date min,
                             @RequestParam(defaultValue = "31/12/2900") Date max) {
        model.addAttribute("arrays", orderDetailService.findByCustomer(min, max));
        return "admin/revenue";
    }

    @RequestMapping(value = "by-product.htm", method = RequestMethod.POST)
    public String byProduct(Model model, @RequestParam(defaultValue = "01/01/2019") Date min,
                            @RequestParam(defaultValue = "31/12/2900") Date max) {
        model.addAttribute("arrays", orderDetailService.findByProduct(min, max));
        return "admin/revenue";
    }

    @RequestMapping(value = "by-quarter.htm", method = RequestMethod.POST)
    public String byQuarter(Model model, @RequestParam(defaultValue = "01/01/2019") Date min,
                            @RequestParam(defaultValue = "31/12/2900") Date max) {
        model.addAttribute("arrays", orderDetailService.findByQuarter(min, max));
        return "admin/revenue";
    }

    @RequestMapping(value = "by-month.htm", method = RequestMethod.POST)
    public String byMonth(Model model, @RequestParam(defaultValue = "01/01/2019") Date min,
                          @RequestParam(defaultValue = "31/12/2900") Date max) {
        model.addAttribute("arrays", orderDetailService.findByMonth(min, max));
        return "admin/revenue";
    }

    @RequestMapping(value = "by-year.htm", method = RequestMethod.POST)
    public String byYear(Model model, @RequestParam(defaultValue = "01/01/2019") Date min,
                         @RequestParam(defaultValue = "31/12/2900") Date max) {
        model.addAttribute("arrays", orderDetailService.findByYear(min, max));
        return "admin/revenue";
    }

    @RequestMapping(value = "by-today.htm", method = RequestMethod.POST)
    public String byToday(Model model) {
        model.addAttribute("arrays", orderDetailService.findByToday());
        return "admin/revenue";
    }

}
