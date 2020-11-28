package com.shop.demo.controller.admin;

import com.shop.demo.model.Admin;
import com.shop.demo.model.Customer;
import com.shop.demo.model.Employee;
import com.shop.demo.service.AdminService;
import com.shop.demo.service.CustomerService;
import com.shop.demo.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletResponse;


@Controller
@RequestMapping(value = "/Shopping.com/admin/account", method = RequestMethod.GET)
public class AccountManager {

    @Autowired
    private EmployeeService employeeService;

    @Autowired
    private AdminService adminService;

    @Autowired
    private CustomerService customerService;

    @RequestMapping(value = "", method = RequestMethod.POST)
    public String index(Pageable pageable, Model model, HttpServletResponse response) {
        //Admin
        Page<Admin> admins = adminService.findAllAdmin(pageable);
        response.setHeader("admins", "/Shopping.com/admin/account");
        model.addAttribute("number", admins.getNumber());
        model.addAttribute("totalPages", admins.getTotalPages());
        model.addAttribute("totalElements", admins.getTotalElements());
        model.addAttribute("size", admins.getSize());
        model.addAttribute("adminList", admins.getContent());
        //Employee
        Page<Employee> employees = employeeService.findAlls(pageable);
        response.setHeader("employees", "/Shopping.com/admin/account");
        model.addAttribute("number1", employees.getNumber());
        model.addAttribute("totalPages1", employees.getTotalPages());
        model.addAttribute("totalElements1", employees.getTotalElements());
        model.addAttribute("size1", employees.getSize());
        model.addAttribute("employeeList", employees.getContent());
        //Customer
        Page<Customer> customers = customerService.findAll(pageable);
        response.setHeader("customers", "/Shopping.com/admin/account");
        model.addAttribute("number2", customers.getNumber());
        model.addAttribute("totalPages2", customers.getTotalPages());
        model.addAttribute("totalElements2", customers.getTotalElements());
        model.addAttribute("size2", customers.getSize());
        model.addAttribute("customerList", customers.getContent());
        return "admin/account-list";
    }

    @RequestMapping(value = "blockAdmin/{id}.htm", method = RequestMethod.POST)
    public String blockAdmin(@PathVariable String id) {
        Admin admin = adminService.findOneAdmin(id);
        admin.setAccess(-1);
        adminService.save(admin);
        return "redirect:/Shopping.com/admin/account";
    }

    @RequestMapping(value = "restoreAdmin/{id}.htm", method = RequestMethod.POST)
    public String restoreAdmin(@PathVariable String id) {
        Admin admin = adminService.findOneAdmin(id);
        admin.setAccess(1);
        adminService.save(admin);
        return "redirect:/Shopping.com/admin/account";
    }

    @RequestMapping(value = "blockEmployee/{id}.htm", method = RequestMethod.POST)
    public String blocksEmployee(@PathVariable Long id, RedirectAttributes redirect) {
        Employee employee = employeeService.findByIdEmployee(id);
        System.out.println(employee);
        employee.setAccess(-1);
        employeeService.save(employee);
        redirect.addAttribute("message", "Khóa tài khoản thành công");
        return "redirect:/Shopping.com/admin/account";
    }

    @RequestMapping(value = "restoreEmployee/{id}.htm", method = RequestMethod.POST)
    public String restoreEmployees(@PathVariable Long id, RedirectAttributes redirect) {
        Employee employee = employeeService.findByIdEmployee(id);
        employee.setAccess(1);
        employeeService.save(employee);
        redirect.addAttribute("message", "Khôi phục tài khoản thành công");
        return "redirect:/Shopping.com/admin/account";
    }

    @RequestMapping(value = "active-account/{id}.htm", method = RequestMethod.POST)
    public String activeAccount(@PathVariable Long id, Model model) {
        Employee employee = employeeService.findByIdEmployee(id);
        employee.setActivated(true);
        employeeService.save(employee);
        model.addAttribute("message", "Kích hoạt tài khoản thành công");
        return "redirect:/Shopping.com/admin/account";
    }

    @RequestMapping(value = "blockCustomer/{id}.htm")
    public String blockCustomer(@PathVariable("id") String id, RedirectAttributes redirect) {
        Customer customer = customerService.findByIdCustomer(id);
        customer.setAccess(-1);
        customerService.saveCustomer(customer);
        redirect.addAttribute("message", "Khóa tài khoản thành công");
        return "redirect:/Shopping.com/admin/account";
    }

    @RequestMapping(value = "restoreCustomer/{id}.htm", method = RequestMethod.POST)
    public String restoreCustomers(@PathVariable String id, RedirectAttributes redirect) {
        Customer customer = customerService.findByIdCustomer(id);
        customer.setAccess(1);
        customerService.saveCustomer(customer);
        redirect.addAttribute("message", "Khôi phục tài khoản thành công");
        return "redirect:/Shopping.com/admin/account";
    }

    @RequestMapping(value = "search-by-customer.htm", method = RequestMethod.POST)
    public String searchByCustomer(@RequestParam("key") String key, Pageable pageable, Model model, HttpServletResponse response) {
        if (key.isEmpty()) {
            return "redirect:/Shopping.com/admin/account";
        }
        Page<Customer> customers = customerService.searchCustomer(key, pageable);
        response.setHeader("customers", "/Shopping.com/admin/account");
        model.addAttribute("number2", customers.getNumber());
        model.addAttribute("totalPages2", customers.getTotalPages());
        model.addAttribute("totalElements2", customers.getTotalElements());
        model.addAttribute("size2", customers.getSize());
        model.addAttribute("customerList", customers.getContent());
        //load page
        //Admin
        Page<Admin> admins = adminService.findAllAdmin(pageable);
        response.setHeader("admins", "/Shopping.com/admin/account");
        model.addAttribute("number", admins.getNumber());
        model.addAttribute("totalPages", admins.getTotalPages());
        model.addAttribute("totalElements", admins.getTotalElements());
        model.addAttribute("size", admins.getSize());
        model.addAttribute("adminList", admins.getContent());
        //Employee
        Page<Employee> employees = employeeService.findAlls(pageable);
        response.setHeader("employees", "/Shopping.com/admin/account");
        model.addAttribute("number1", employees.getNumber());
        model.addAttribute("totalPages1", employees.getTotalPages());
        model.addAttribute("totalElements1", employees.getTotalElements());
        model.addAttribute("size1", employees.getSize());
        model.addAttribute("employeeList", employees.getContent());
        return "admin/account-list";
    }

    @RequestMapping(value = "search-by-employee.htm", method = RequestMethod.POST)
    public String searchByEmployee(@RequestParam("key") String key, Model model, Pageable pageable, HttpServletResponse response) {
        if (key.isEmpty()) {
            return "redirect:/Shopping.com/admin/account";
        }
        Page<Employee> employees = employeeService.searchByEmployee(key, pageable);
        response.setHeader("employees", "/Shopping.com/admin/account");
        model.addAttribute("number1", employees.getNumber());
        model.addAttribute("totalPages1", employees.getTotalPages());
        model.addAttribute("totalElements1", employees.getTotalElements());
        model.addAttribute("size1", employees.getSize());
        model.addAttribute("employeeList", employees.getContent());
        //load page
        Page<Customer> customers = customerService.searchCustomer(key, pageable);
        response.setHeader("customers", "/Shopping.com/admin/account");
        model.addAttribute("number2", customers.getNumber());
        model.addAttribute("totalPages2", customers.getTotalPages());
        model.addAttribute("totalElements2", customers.getTotalElements());
        model.addAttribute("size2", customers.getSize());
        model.addAttribute("customerList", customers.getContent());
        //load page
        //Admin
        Page<Admin> admins = adminService.findAllAdmin(pageable);
        response.setHeader("admins", "/Shopping.com/admin/account");
        model.addAttribute("number", admins.getNumber());
        model.addAttribute("totalPages", admins.getTotalPages());
        model.addAttribute("totalElements", admins.getTotalElements());
        model.addAttribute("size", admins.getSize());
        model.addAttribute("adminList", admins.getContent());
        return "admin/account-list";
    }

    @RequestMapping(value = "search-by-admin.htm", method = RequestMethod.POST)
    public String searchByAdmin(@RequestParam("key") String key, Model model, Pageable pageable, HttpServletResponse response) {
        if (key.isEmpty()) {
            return "redirect:/Shopping.com/admin/account";
        }
        Page<Admin> admins = adminService.searchByAdmin(key, pageable);
        response.setHeader("admins", "/Shopping.com/admin/account");
        model.addAttribute("number", admins.getNumber());
        model.addAttribute("totalPages", admins.getTotalPages());
        model.addAttribute("totalElements", admins.getTotalElements());
        model.addAttribute("size", admins.getSize());
        model.addAttribute("adminList", admins.getContent());
        //load page
        Page<Employee> employees = employeeService.searchByEmployee(key, pageable);
        response.setHeader("employees", "/Shopping.com/admin/account");
        model.addAttribute("number1", employees.getNumber());
        model.addAttribute("totalPages1", employees.getTotalPages());
        model.addAttribute("totalElements1", employees.getTotalElements());
        model.addAttribute("size1", employees.getSize());
        model.addAttribute("employeeList", employees.getContent());
        //load page
        Page<Customer> customers = customerService.searchCustomer(key, pageable);
        response.setHeader("customers", "/Shopping.com/admin/account");
        model.addAttribute("number2", customers.getNumber());
        model.addAttribute("totalPages2", customers.getTotalPages());
        model.addAttribute("totalElements2", customers.getTotalElements());
        model.addAttribute("size2", customers.getSize());
        model.addAttribute("customerList", customers.getContent());
        return "admin/account-list";

    }

}
