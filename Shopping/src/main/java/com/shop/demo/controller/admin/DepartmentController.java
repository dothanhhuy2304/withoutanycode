package com.shop.demo.controller.admin;

import com.shop.demo.model.Department;
import com.shop.demo.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;


@Controller
@RequestMapping(value = "/Shopping.com/admin/department", method = RequestMethod.GET)
public class DepartmentController {

    @Autowired
    private DepartmentService departmentService;

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String index(Model model, Pageable pageable, HttpServletResponse response) {
        Page<Department> page = departmentService.findAll(pageable);
        response.setHeader("list", "/Shopping.com/admin/department");
        model.addAttribute("number", page.getNumber());
        model.addAttribute("totalPages", page.getTotalPages());
        model.addAttribute("totalElements", page.getTotalElements());
        model.addAttribute("size", page.getSize());
        model.addAttribute("departmentList", page.getContent());
        return "admin/department-list";
    }

    @RequestMapping(value = "add-department.htm", method = RequestMethod.GET)
    public String addDepartment(Model model) {
        model.addAttribute("department", new Department());
        return "admin/add-department";
    }

    @RequestMapping(value = "save-department", method = RequestMethod.POST)
    public String saveAddDepartment(@Valid @ModelAttribute("department") Department department, BindingResult result,
                                    Model model) throws Exception, RuntimeException {
        try {

            if (result.hasErrors()) {
                return "admin/add-department";
            }
            if (department != null) {
                departmentService.save(department);
                model.addAttribute("message", "Thêm phòng ban thành công");
                return "admin/add-department";
            }
            return "admin/add-department";
        } catch (Exception e) {
            model.addAttribute("message", "Phòng ban đã tồn tại");
        }
        return "admin/add-department";
    }

    @RequestMapping(value = "edit-department/{id}.htm", method = RequestMethod.GET)
    public String editDepartment(@PathVariable int id, Model model) {
        model.addAttribute("department", departmentService.findOne(id));
        return "admin/edit-department";
    }

    @RequestMapping(value = "save-edit-department", method = RequestMethod.POST)
    public String saveEditDepartment(@Valid @ModelAttribute("department") Department department, BindingResult result, Model model) {
        if (result.hasErrors()) {
            return "admin/edit-department";
        }
        if (department != null) {
            departmentService.save(department);
            model.addAttribute("message", "Chỉnh sửa phòng ban thành công");
            return "admin/edit-department";
        }
        return "admin/edit-department";
    }


    @RequestMapping(value = "filter.htm", method = RequestMethod.POST)
    public String filterDepartment(@RequestParam("key") String key, Model model) {
        if (key.isEmpty()) {
            return "redirect:/Shopping.com/admin/department";
        }
        model.addAttribute("department", departmentService.search(key));
        return "admin/department-s";
    }

}
