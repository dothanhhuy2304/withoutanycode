package com.shop.demo.controller;

import com.shop.demo.model.Customer;
import com.shop.demo.model.Order;
import com.shop.demo.model.OrderDetail;
import com.shop.demo.model.Product;
import com.shop.demo.service.CustomerService;
import com.shop.demo.service.OrderDetailService;
import com.shop.demo.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.Date;

@Controller
@RequestMapping("/Shopping.com/order")
public class UserOrderController extends ShoppingCart {


    @Autowired
    private OrderService orderService;

    @Autowired
    private OrderDetailService orderDetailService;

    @Autowired
    HttpSession httpSession;

    @Autowired
    protected ShoppingCart cart;

    @Autowired
    private CustomerService customerService;

    // Kiểm tra lại thông tin đơn hàng
    @RequestMapping("/checkout")
    public String checkout(ModelMap model) {
        try {
            Customer user = (Customer) httpSession.getAttribute("user");
            Order order = new Order();
            order.setCustomer(user);
            order.setOrderDate(new Date());
            order.setAmount(cart.getAmount());
            order.setReceiver(user.getFullName());
            model.addAttribute("order", order);
            return "views/check-out";
        } catch (Exception e) {
            e.printStackTrace();
            return "views/check-out";
        }
    }

    // Đặt hàng
    @RequestMapping("/purchase")
    public String purchase(ModelMap model, @ModelAttribute Order order) {
        try {
            orderService.saveOrder(order);
            for (Product p : cart.getItems()) {
                OrderDetail detail = new OrderDetail();
                detail.setOrder(order);
                detail.setProduct(p);
                detail.setAmount(p.getUnitPrice());
                detail.setQuantity(p.getQuantity());
                detail.setDiscount(p.getDiscount());
//                p.setQuantity(p.getQuantity() - detail.getQuantity());
                orderDetailService.save(detail);
            }
            cart.clear();
            return "redirect:/Shopping.com/order/detail/" + order.getId();
        } catch (Exception e) {
            model.addAttribute("message", "Đặt hàng thất bại");
        }
        return "views/check-out";
    }

    // Show danh sách đơn hàng chi tiết
    @RequestMapping("/detail/{id}")
    public String detailOrder(ModelMap model, @PathVariable("id") Integer id) {
        Customer customer = (Customer) httpSession.getAttribute("user");
        Order order = new Order();
        order.setId(id);
        model.addAttribute("order", orderService.findOneId(id));
        model.addAttribute("details", orderService.findOneId(id).getOrderDetail());
//        double amount = 0;
//        for (OrderDetail orderdetail : orderService.findOneId(id).getOrderDetail()) {
//            amount += ((orderdetail.getAmount() * orderdetail.getQuantity()) * (1 - orderdetail.getDiscount()));
//        }
        String text = customer.getFullName();
        model.addAttribute("status_order", text);
        model.addAttribute("od", order.getId());
//        model.addAttribute("totally", amount);
        return "views/order-detail";
    }

    // Show danh sách đơn hàng
    @RequestMapping("/list")
    public String listOrder(ModelMap model) {
        Customer user = (Customer) httpSession.getAttribute("user");
        Iterable<Order> order = customerService.findOneId(user.getId()).getOrder();
        model.addAttribute("order", order);
        return "views/order-list";
    }

    //Hủy đơn hàng
    @RequestMapping("/cancel-order/{id}")
    public String cannel(ModelMap model, @PathVariable("id") Integer id) {
        Order order = orderService.findOneId(id);
        order.setId(id);
        order.setStatus(2);
        orderService.saveOrder(order);
        model.addAttribute("order", order);
        return "redirect:/Shopping.com/order/list";

    }

}
