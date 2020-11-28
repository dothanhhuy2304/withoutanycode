package com.shop.demo.controller.employee;

import com.shop.demo.model.Customer;
import com.shop.demo.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.util.Objects;

@Controller
@RequestMapping(value = "/Shopping.com/employee/customer", method = RequestMethod.GET)
public class CustomerManager {

    @Autowired
    private CustomerService customerService;

    @Autowired
    ServletContext context;

    @RequestMapping(value = "")
    public String customerManger(Model model, Pageable pageable, HttpServletResponse response) {
        Page<Customer> page = customerService.findAll(pageable);
        response.setHeader("list", "/Shopping.com/employee/customer");
        model.addAttribute("number", page.getNumber());
        model.addAttribute("totalPages", page.getTotalPages());
        model.addAttribute("totalElements", page.getTotalElements());
        model.addAttribute("size", page.getSize());
        model.addAttribute("customerList", page.getContent());
        return "/employee/customer-list";
    }


    @RequestMapping("/detailCustomer/{id}.htm")
    public String detailCustomer(@PathVariable String id, Model model) {
        Customer customer = customerService.findByIdCustomer(id);
        model.addAttribute("customers", customer);
        return "employee/detail-customer";
    }


    @RequestMapping(value = "/editCustomer/{id}.htm", method = RequestMethod.GET)
    public String editCustomer(@PathVariable String id, Model model) {
        Customer customer = customerService.findByIdCustomer(id);
        model.addAttribute("customer", customer);
        return "employee/edit-customer";
    }

    @RequestMapping(value = "/saveCustomer", method = RequestMethod.POST)
    public String saveCustomer(@ModelAttribute("customer") Customer customer, BindingResult result,
                               @RequestParam("file_image") MultipartFile photo, Model model) {
        try {
            String filePhoto = StringUtils.cleanPath(Objects.requireNonNull(photo.getOriginalFilename()));
            String path = context.getRealPath("/project/customers/" + filePhoto);
            if (!(filePhoto.endsWith(".jpg")) &&
                    !(filePhoto.endsWith(".svg")) && !(filePhoto.endsWith(".png"))
                    && !(filePhoto.endsWith(".jpeg")) && !(filePhoto.endsWith(".PNG"))
                    && !(filePhoto.endsWith(".JPEG")) && !(filePhoto.endsWith(".JPG"))) {
                model.addAttribute("message", "Ảnh đại diện không đúng định dạng");
                return "/employee/edit-customer";
            } else if (!photo.isEmpty()) {
                photo.transferTo(new File(path));
                customer.setPhoto(filePhoto);
                customerService.saveCustomer(customer);
                model.addAttribute("message", "Thay đổi thông tin khách" + customer.getId() + " thành công");
                return "/employee/edit-customer";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "employee/edit-customer";

    }


    @RequestMapping(value = "/customer-search", method = RequestMethod.POST)
    public String searchCustomer(@RequestParam(value = "key", required = false) String key, Pageable pageable,
                                 Model model, HttpServletResponse response) {
        if (key.isEmpty()) {
            return "redirect:/Shopping.com/employee/customer";
        } else {
            Page<Customer> page = customerService.searchCustomer(key, pageable);
            response.getHeader("/Shopping.com/employee/customer-search");
            model.addAttribute("number", page.getNumber());
            model.addAttribute("totalPages", page.getTotalPages());
            model.addAttribute("totalElements", page.getTotalElements());
            model.addAttribute("size", page.getSize());
            model.addAttribute("customerList", page.getContent());
            return "employee/customer-list";
        }
    }

    @RequestMapping(value = "/block/{id}.htm")
    public String blockCustomer(@PathVariable("id") String id) {
        Customer customer = customerService.findByIdCustomer(id);
        customer.setAccess(-1);
        customerService.saveCustomer(customer);
        return "redirect:/Shopping.com/employee/customer";
    }

    @RequestMapping(value = "/restore/{id}.htm")
    public String restoreCustomer(@PathVariable("id") String id, Model model) {
        Customer customer = customerService.findByIdCustomer(id);
        customer.setAccess(1);
        customerService.saveCustomer(customer);
        return "redirect:/Shopping.com/employee/customer";
    }
}
