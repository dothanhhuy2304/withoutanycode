package com.shop.demo.controller.employee;

import com.shop.demo.model.Order;
import com.shop.demo.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;


@Controller
@RequestMapping(value = "/Shopping.com/employee/order", method = RequestMethod.GET)
public class OrderManager {

    @Autowired
    private OrderService orderService;

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String index(Model model, Pageable pageable, HttpServletResponse response) {
        Page<Order> page = orderService.findAll(pageable);
        response.setHeader("list", "/Shopping.com/employee/order");
        model.addAttribute("number", page.getNumber());
        model.addAttribute("totalPages", page.getTotalPages());
        model.addAttribute("totalElements", page.getTotalElements());
        model.addAttribute("size", page.getSize());
        model.addAttribute("orderList", page.getContent());
        return "employee/order-list";
    }

    @RequestMapping(value = "detail-order/{id}.htm", method = RequestMethod.POST)
    public String orderDetail(@PathVariable int id, Model model) {
        Order order = orderService.findOneId(id);
        model.addAttribute("order", order);
        return "employee/order-detail";
    }

    @RequestMapping(value = "edit-order/{id}.htm", method = RequestMethod.GET)
    public String editOrder(@PathVariable int id, Model model) {
        Order order = orderService.findOneId(id);
        model.addAttribute("order", order);
        return "employee/edit-order";
    }

    @RequestMapping(value = "/saveEditOrder", method = RequestMethod.POST)
    public String saveEditOrder(@ModelAttribute("order") Order order, BindingResult result, Model model) {
        if (result.hasErrors()) {
//            result.rejectValue("error",null,"Chỉnh Sửa Đơn Hàng Thất Bại");
            return "employee/edit-order";
        }
        orderService.saveOrder(order);
        model.addAttribute("message", "Chình Sửa Đơn Hàng Thành Công");
        return "employee/edit-order";
    }

    //Sửa lại ajax
    //Xác nhận đơn hàng
    @RequestMapping(value = "/handling-order/{id}.htm", method = RequestMethod.POST)
    public String handlingOrder(@PathVariable int id, Model model) {
        Order order = orderService.findOneId(id);
        if (order != null) {
            order.setStatus(3);
            orderService.saveOrder(order);
            model.addAttribute("message", "Xác Nhận Đơn Hàng Thành Công");
            return "redirect:/Shopping.com/employee/order";
        }
        model.addAttribute("message", "Xác Nhận Đơn Hàng Thất Bại");
        return "redirect:/Shopping.com/employee/order-list";
    }

    //Hủy đơn hàng
    @RequestMapping(value = "/cancel-order/{id}.htm", method = RequestMethod.POST)
    public String cancelOrder(@PathVariable int id, Model model) {
        Order order = orderService.findOneId(id);
        if (order != null) {
            order.setStatus(2);
            orderService.saveOrder(order);
            model.addAttribute("message", "Xác nhận đơn hàng thành công");
            return "redirect:/Shopping.com/employee/order";
        }
        return "redirect:/Shopping.com/employee/order";
    }

    //Xác nhận đã giao
    @RequestMapping(value = "confirm-order/{id}.htm", method = RequestMethod.POST)
    public String confirmOrder(@PathVariable int id, Model model) {
        Order order = orderService.findOneId(id);
        if (order != null) {
            order.setStatus(4);
            orderService.saveOrder(order);
            model.addAttribute("message", "Save Product SuccessFully");
            return "redirect:/Shopping.com/employee/order";
        }
        return "redirect:/Shopping.com/employee/order";
    }

    @RequestMapping(value = "/search.htm", method = RequestMethod.POST)
    public String searchOrderByKey(@RequestParam("key") String key, Model model) {
        if (key.isEmpty()) {
            return "redirect:/Shopping.com/employee/order";
        }
        model.addAttribute("orderList", orderService.searchByAll(key));
        return "employee/search-order";
    }

    @RequestMapping(value = "/filter.htm", method = RequestMethod.POST)
    public String filterByStatus(@RequestParam("key") Integer key, Model model) {
        if (key == null) {
            return "redirect:/Shopping.com/employee/order";
        }
        model.addAttribute("orderList", orderService.searchByStatus(key));
        return "employee/search-order";
    }

}
