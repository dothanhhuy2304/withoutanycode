package com.shop.demo.controller;

import com.shop.demo.exception.ResourceNotFoundException;
import com.shop.demo.model.Product;
import com.shop.demo.service.CategoryService;
import com.shop.demo.service.ProductService;
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

@Controller
@RequestMapping(value = "/Shopping.com/user/product", method = RequestMethod.GET)
public class ProductController {
    @Autowired
    private ProductService productService;

    @Autowired
    private CategoryService categoryService;

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String index(Model model, Pageable pageable, HttpServletResponse response) {
        response.setHeader("list", "Shopping.com/user/product");
        Page<Product> pages = productService.findAlls(pageable);
        model.addAttribute("number", pages.getNumber());
        model.addAttribute("totalPages", pages.getTotalPages());
        model.addAttribute("totalElements", pages.getTotalElements());
        model.addAttribute("size", pages.getSize());
        model.addAttribute("products", pages.getContent());
        model.addAttribute("category", categoryService.findAllCategory());
        return "views/index-page";
    }

    //Chi tiết đơn hàng
    @RequestMapping(value = "/detail/{id}.htm", method = RequestMethod.POST)
    public String productDetail(@PathVariable int id, Model model) throws ResourceNotFoundException {
        try {
            Product product = productService.findById(id);
            product.setViews(product.getViews() + 1);
            productService.save(product);
            model.addAttribute("product", product);
            return "views/product-detail";
        } catch (Exception e) {
            throw new ResourceNotFoundException("Sorry Can't Found:" + id);
        }
    }

    //Tìm kiếm theo tên sản phẩm
    @RequestMapping(value = "/search-product.htm", method = RequestMethod.GET)
    public String searchProduct(@RequestParam(value = "key", required = false) String key, Model model,
                                Pageable pageable, HttpServletResponse response) throws ResourceNotFoundException {
        try {
            if (key.equals("")) {
                return "redirect:/Shopping.com/user/product";
            }
            response.setHeader("list", "Shopping.com/user/product/search-product.htm?key=" + key);
            Page<Product> pages = productService.search(key, pageable);
            model.addAttribute("number", pages.getNumber());
            model.addAttribute("totalPages", pages.getTotalPages());
            model.addAttribute("totalElements", pages.getTotalElements());
            model.addAttribute("size", pages.getSize());
            model.addAttribute("products", pages.getContent());
            return "/views/index-page";
        } catch (Exception e) {
            throw new ResourceNotFoundException("Sorry,Can't Found :" + key);
        }
    }

    //Find Theo thể loại
    @RequestMapping(value = "/list-by-category/{id}.htm", method = RequestMethod.POST)
    public String findByCategory(@PathVariable Integer id, Model model, Pageable pageable, HttpServletResponse response) {
        response.setHeader("list", "Shopping.com/user/product/list-by-category/" + id + ".htm");
        response.encodeRedirectURL("UTF-8");
        Page<Product> pages = productService.searchByCategory(id, pageable);
        model.addAttribute("number", pages.getNumber());
        model.addAttribute("totalPages", pages.getTotalPages());
        model.addAttribute("totalElements", pages.getTotalElements());
        model.addAttribute("size", pages.getSize());
        model.addAttribute("products", pages.getContent());
        return "views/index-page";
    }

    //Find theo nhà cung cấp
    @RequestMapping(value = "/list-by-producer/{id}.htm", method = RequestMethod.POST)
    public String findByProducer(@PathVariable Integer id, Model model, Pageable pageable, HttpServletResponse response) {
        response.setHeader("list", "Shopping.com/user/product/list-by-producer/" + id + ".htm");
        Page<Product> pages = productService.searchByProducer(id, pageable);
        model.addAttribute("number", pages.getNumber());
        model.addAttribute("totalPages", pages.getTotalPages());
        model.addAttribute("totalElements", pages.getTotalElements());
        model.addAttribute("size", pages.getSize());
        model.addAttribute("products", pages.getContent());
        return "views/index-page";
    }

    //Find theo hàng mới
    @RequestMapping(value = "/type/news.htm", method = RequestMethod.POST)
    public String findByNews(Model model, Pageable pageable, HttpServletResponse response) {
        response.setHeader("list", "Shopping.com/user/product/type/news.htm");
        Page<Product> pages = productService.searchByNews(pageable);
        model.addAttribute("number", pages.getNumber());
        model.addAttribute("totalPages", pages.getTotalPages());
        model.addAttribute("totalElements", pages.getTotalElements());
        model.addAttribute("size", pages.getSize());
        model.addAttribute("products", pages.getContent());
        return "views/index-page";
    }

    //Tìm theo sales
    @RequestMapping(value = "/type/sales.htm", method = RequestMethod.POST)
    public String findBySales(Model model, Pageable pageable, HttpServletResponse response) {
        response.setHeader("list", "Shopping.com/user/product/type/sales.htm");
        Page<Product> pages = productService.searchBySales(pageable);
        model.addAttribute("number", pages.getNumber());
        model.addAttribute("totalPages", pages.getTotalPages());
        model.addAttribute("totalElements", pages.getTotalElements());
        model.addAttribute("size", pages.getSize());
        model.addAttribute("products", pages.getContent());
        return "views/index-page";
    }

    //Tìm theo lượt xem
    @RequestMapping(value = "/type/views.htm", method = RequestMethod.POST)
    public String findByViews(Model model, Pageable pageable, HttpServletResponse response) {
        response.setHeader("list", "Shopping.com/user/product/type/views.htm");
        Page<Product> pages = productService.searchByViews(pageable);
        model.addAttribute("number", pages.getNumber());
        model.addAttribute("totalPages", pages.getTotalPages());
        model.addAttribute("totalElements", pages.getTotalElements());
        model.addAttribute("size", pages.getSize());
        model.addAttribute("products", pages.getContent());
        return "views/index-page";
    }

    //Tìm theo lượt xem
    @RequestMapping(value = "/type/special.htm", method = RequestMethod.POST)
    public String findBySpecial(Model model, Pageable pageable, HttpServletResponse response) {
        response.setHeader("list", "Shopping.com/user/product/type/special.htm");
        Page<Product> pages = productService.searchBySpecial(pageable);
        model.addAttribute("number", pages.getNumber());
        model.addAttribute("totalPages", pages.getTotalPages());
        model.addAttribute("totalElements", pages.getTotalElements());
        model.addAttribute("size", pages.getSize());
        model.addAttribute("products", pages.getContent());
        return "views/index-page";
    }

    //Tìm theo giảm giá mới nhất
    @RequestMapping(value = "/type/salesnew.htm", method = RequestMethod.POST)
    public String findBySaleNew(Model model, Pageable pageable, HttpServletResponse response) {
        response.setHeader("list", "Shopping.com/user/product/type/salesnew.htm");
        Page<Product> pages = productService.searchBySaleNews(pageable);
        model.addAttribute("number", pages.getNumber());
        model.addAttribute("totalPages", pages.getTotalPages());
        model.addAttribute("totalElements", pages.getTotalElements());
        model.addAttribute("size", pages.getSize());
        model.addAttribute("products", pages.getContent());
        return "views/index-page";
    }

    @RequestMapping(value = "/type/buy.htm", method = RequestMethod.POST)
    public String findByBuy(Model model, Pageable pageable, HttpServletResponse response) {
        response.setHeader("list", "Shopping.com/user/product/type/buy.htm");
        Page<Product> pages = productService.searchByBuy(pageable);
        model.addAttribute("number", pages.getNumber());
        model.addAttribute("totalPages", pages.getTotalPages());
        model.addAttribute("totalElements", pages.getTotalElements());
        model.addAttribute("size", pages.getSize());
        model.addAttribute("products", pages.getContent());
        return "views/index-page";
    }

}
