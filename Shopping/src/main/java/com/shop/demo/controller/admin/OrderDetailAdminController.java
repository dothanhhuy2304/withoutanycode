package com.shop.demo.controller.admin;

import com.shop.demo.export.OrderByDay;
import com.shop.demo.export.OrderByMonth;
import com.shop.demo.export.OrderByYear;
import com.shop.demo.export.OrderDetailExcelExport;
import com.shop.demo.model.Order;
import com.shop.demo.model.OrderDetail;
import com.shop.demo.service.OrderDetailService;
import com.shop.demo.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping(value = "/Shopping.com/admin/orderDetail", method = RequestMethod.GET)
public class OrderDetailAdminController {

    @Autowired
    private OrderDetailService orderDetailService;

    @Autowired
    private OrderService orderService;

    @RequestMapping("")
    public String orderDetail(Model model, Pageable pageable, HttpServletResponse response) {
        Page<OrderDetail> page = orderDetailService.findAllOrderDetail(pageable);
        response.setHeader("list", "Shopping.com/admin/orderDetail");
        model.addAttribute("number", page.getNumber());
        model.addAttribute("totalPages", page.getTotalPages());
        model.addAttribute("totalElements", page.getTotalElements());
        model.addAttribute("size", page.getSize());
        model.addAttribute("orderDetailList", page.getContent());
        return "admin/order-detail-list";
    }

    @RequestMapping(value = "delete-orderDetail/{id}.htm")
    public String deleteOrderDetail(@PathVariable int id, Pageable pageable, HttpServletResponse response, Model model) {
        OrderDetail orderDetail = orderDetailService.findById(id);
        orderDetailService.delete(orderDetail);
        Page<OrderDetail> page = orderDetailService.findAllOrderDetail(pageable);
        response.setHeader("list", "Shopping.com/admin/orderDetail");
        model.addAttribute("number", page.getNumber());
        model.addAttribute("totalPages", page.getTotalPages());
        model.addAttribute("totalElements", page.getTotalElements());
        model.addAttribute("size", page.getSize());
        model.addAttribute("orderDetailList", page.getContent());
        return "admin/order-detail-list";
    }

    @RequestMapping(value = "search.htm", method = RequestMethod.GET)
    public String filterOrderDetail(@RequestParam("key") String key, Model model) {
        if (key.isEmpty()) {
            return "redirect:/Shopping.com/admin/orderDetail";
        }
        model.addAttribute("orderDetailList", orderDetailService.search(key));
        return "admin/search-orderdetail";
    }

    @RequestMapping(value = "excel-orderDetail", method = RequestMethod.POST)
    public void excelExportOrderDetail(HttpServletResponse response) throws IOException {
        response.setContentType("application/octet-stream");
        String headerKey = "Content-Disposition";
        DateFormat dateFormat = new SimpleDateFormat("yy/MM/dd-HH:mm:ss");
        String currentDatetime = dateFormat.format(new Date());
        String filename = "OrderDetail_" + currentDatetime + ".xlsx";
        String headerValue = "attachment;filename=" + filename;
        response.setHeader(headerKey, headerValue);
        List<OrderDetail> orderDetails = orderDetailService.findAll();
        OrderDetailExcelExport export = new OrderDetailExcelExport(orderDetails);
        export.export(response);
    }

    @RequestMapping(value = "excel-orderDetail-byDay", method = RequestMethod.POST)
    public void excelExportOrderDetailByDay(HttpServletResponse response) throws IOException {
        response.setContentType("application/octet-stream");
        String headerKey = "Content-Disposition";
        DateFormat dateFormat = new SimpleDateFormat("yy/MM/dd-HH:mm:ss");
        String currentDatetime = dateFormat.format(new Date());
        String filename = "OrderDetail_" + currentDatetime + ".xlsx";
        String headerValue = "attachment;filename=" + filename;
        response.setHeader(headerKey, headerValue);
        List<OrderDetail> orderDetails = orderDetailService.findAll();
        OrderByDay export = new OrderByDay(orderDetails);
        export.export(response);
    }

    @RequestMapping(value = "excel-orderDetail-byYear", method = RequestMethod.POST)
    public void excelExportOrderDetailByYear(HttpServletResponse response) throws IOException {
        response.setContentType("application/octet-stream");
        String headerKey = "Content-Disposition";
        DateFormat dateFormat = new SimpleDateFormat("yy/MM/dd-HH:mm:ss");
        String currentDatetime = dateFormat.format(new Date());
        String filename = "OrderDetail_" + currentDatetime + ".xlsx";
        String headerValue = "attachment;filename=" + filename;
        response.setHeader(headerKey, headerValue);
        List<OrderDetail> orderDetails = orderDetailService.findAll();
        OrderByYear export = new OrderByYear(orderDetails);
        export.export(response);
    }

    @RequestMapping(value = "excel-orderDetail-byMonth", method = RequestMethod.POST)
    public void excelExportOrderDetailByMonth(HttpServletResponse response) throws IOException {
        response.setContentType("application/octet-stream");
        String headerKey = "Content-Disposition";
        DateFormat dateFormat = new SimpleDateFormat("yy/MM/dd-HH:mm:ss");
        String currentDatetime = dateFormat.format(new Date());
        String filename = "OrderDetail_" + currentDatetime + ".xlsx";
        String headerValue = "attachment;filename=" + filename;
        response.setHeader(headerKey, headerValue);
        List<OrderDetail> orderDetails = orderDetailService.findAll();
        OrderByMonth export = new OrderByMonth(orderDetails);
        export.export(response);
    }


    @RequestMapping(value = "handling-order/{id}.htm", method = RequestMethod.POST)
    public String handlingOrder(@PathVariable int id) {
        Order order = orderService.findOneId(id);
        order.setStatus(3);
        orderService.saveOrder(order);
        return "redirect:/Shopping.com/admin/orderDetail";
    }

    @RequestMapping(value = "confirm-order/{id}.htm", method = RequestMethod.POST)
    public String confirmOrder(@PathVariable int id) {
        Order order = orderService.findOneId(id);
        order.setStatus(4);
        orderService.saveOrder(order);
        return "redirect:/Shopping.com/admin/orderDetail";
    }
}
