package com.shop.demo.controller.employee;

import com.shop.demo.model.Category;
import com.shop.demo.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping(value = "/Shopping.com/employee/category", method = RequestMethod.GET)
public class CategoryManager {

    @Autowired
    private CategoryService categoryService;

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String index(Model model, Pageable pageable, HttpServletResponse response) {
        response.setHeader("list", "/Shopping.com/employee/category");
        Page<Category> page = categoryService.findAll(pageable);
        model.addAttribute("number", page.getNumber());
        model.addAttribute("totalPages", page.getTotalPages());
        model.addAttribute("totalElements", page.getTotalElements());
        model.addAttribute("size", page.getSize());
        model.addAttribute("categorys", page.getContent());
        return "employee/category";
        //${pageContext.response.getHeader("list")}
    }

    @RequestMapping(value = "/add-category.htm", method = RequestMethod.GET)
    public String addCategory(Model model) {
        model.addAttribute("category", new Category());
        return "employee/add-category";
    }

    @RequestMapping(value = "/saveCategory", method = RequestMethod.POST)
    public String saveCategory(@ModelAttribute("category") Category category, BindingResult result, Model model) {
        if (result.hasErrors()) {
            return "/employee/add-category";
        }
        categoryService.saveCategory(category);
        model.addAttribute("message", "Thêm thể loại thành công");
        return "employee/add-category";
    }

    @RequestMapping(value = "/edit-category/{id}.htm")
    public String editCategory(@PathVariable int id, Model model) {
        Category category = categoryService.findOne(id);
        model.addAttribute("category", category);
        return "employee/edit-category";
    }

    @RequestMapping(value = "/saveEditCategory", method = RequestMethod.POST)
    public String saveEditCategory(@ModelAttribute Category category, BindingResult result,
                                   Model model) {
        if (result.hasErrors()) {
            model.addAttribute("message", "Chỉnh sửa thể loại thất bại");
            return "employee/add-category";
        }
        if (category != null) {
            categoryService.saveCategory(category);
            model.addAttribute("message", "Thay đổi thành công");
        }
        return "employee/add-category";

    }

    @RequestMapping(value = "search-category.htm", method = RequestMethod.POST)
    public String searchCategory(@RequestParam String key, Pageable pageable, Model model, HttpServletResponse response) {
        if (key.isEmpty()) {
            return "redirect:/Shopping.com/employee/category";
        }
        Page<Category> page = categoryService.search(key, pageable);
        response.setHeader("list", "Shopping.com/employee/category/search-category.htm");
        model.addAttribute("number", page.getNumber());
        model.addAttribute("totalPages", page.getTotalPages());
        model.addAttribute("totalElements", page.getTotalElements());
        model.addAttribute("size", page.getSize());
        model.addAttribute("categorys", page.getContent());
        return "employee/category";
    }

    @RequestMapping("delete-category/{id}.htm")
    public String deleteCategory(@PathVariable int id, Model model) {
        Category category = categoryService.findOne(id);
        categoryService.deleteCategory(category);
        model.addAttribute("message", "Delete Category Successfully");
        return "redirect:/Shopping.com/employee/category";
    }


}
