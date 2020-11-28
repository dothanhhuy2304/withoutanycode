package com.shop.demo.controller.employee;

import com.shop.demo.model.Product;
import com.shop.demo.service.ProductService;
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
import java.util.List;
import java.util.Objects;


@Controller
@RequestMapping(value = "/Shopping.com/employee/product", method = RequestMethod.GET)
public class ProductManager {

    @Autowired
    private ProductService productService;
    @Autowired
    ServletContext context;

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String index(Model model, Pageable pageable, HttpServletResponse response) {
        Page<Product> page = productService.findAlls(pageable);
        response.setHeader("list", "Shopping.com/employee/product");
        model.addAttribute("number", page.getNumber());
        model.addAttribute("totalPages", page.getTotalPages());
        model.addAttribute("totalElements", page.getTotalElements());
        model.addAttribute("size", page.getSize());
        model.addAttribute("productList", page.getContent());
        return "employee/product-list";
    }

    @RequestMapping(value = "add-product.htm", method = RequestMethod.GET)
    public String addProduct(Model model) {
        model.addAttribute("product", new Product());
        return "employee/add-product";
    }

    @RequestMapping(value = "save-product", method = RequestMethod.POST)
    public String saveProduct(@ModelAttribute("product") Product product, BindingResult result,
                              @RequestParam("file_image") MultipartFile photo, Model model) {
        try {
            String filePhoto = StringUtils.cleanPath(Objects.requireNonNull(photo.getOriginalFilename()));
            String path = context.getRealPath("/project/products/" + filePhoto);
            if (result.hasErrors()) {
                return "employee/add-product";
            } else if (!(filePhoto.endsWith(".jpg")) &&
                    !(filePhoto.endsWith(".svg")) && !(filePhoto.endsWith(".png"))
                    && !(filePhoto.endsWith(".jpeg")) && !(filePhoto.endsWith(".PNG"))
                    && !(filePhoto.endsWith(".JPEG")) && !(filePhoto.endsWith(".JPG"))) {
                model.addAttribute("message", "Ảnh đại diện không đúng định dạng");
                return "/employee/add-product";
            } else if (!photo.isEmpty()) {
                photo.transferTo(new File(path));
                product.setPhoto(filePhoto);
                product.setStatus(false);
            }
            productService.save(product);
            model.addAttribute("message", "Save Product Successfully");
            return "employee/add-product";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "employee/add-product";
    }


    @RequestMapping(value = "edit-product/{id}.htm")
    public String editProduct(@PathVariable int id, Model model) {
        Product product = productService.findById(id);
        model.addAttribute("product", product);
        return "/employee/edit-product";
    }

    @RequestMapping(value = "save-edit-product", method = RequestMethod.POST)
    public String saveEditProduct(@ModelAttribute("product") Product product, BindingResult result,
                                  @RequestParam("file_image") MultipartFile photo, Model model) {
        try {
            String filePhoto = StringUtils.cleanPath(Objects.requireNonNull(photo.getOriginalFilename()));
            String path = context.getRealPath("/project/products/" + filePhoto);
            if (result.hasErrors()) {
                return "employee/edit-product";
            } else if (!(filePhoto.endsWith(".jpg")) &&
                    !(filePhoto.endsWith(".svg")) && !(filePhoto.endsWith(".png"))
                    && !(filePhoto.endsWith(".jpeg")) && !(filePhoto.endsWith(".PNG"))
                    && !(filePhoto.endsWith(".JPEG")) && !(filePhoto.endsWith(".JPG"))) {
                model.addAttribute("message", "Ảnh đại diện không đúng định dạng");
                return "/employee/edit-product";
            } else if (!photo.isEmpty()) {
                photo.transferTo(new File(path));
                product.setPhoto(filePhoto);
                product.setStatus(false);
            }
            productService.save(product);
            model.addAttribute("message", "Edit Product Successfully");
            return "employee/edit-product";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "employee/edit-product";
    }

    @RequestMapping(value = "detail/{id}.htm", method = RequestMethod.POST)
    public String productDetail(@PathVariable int id, Model model) {
        Product product = productService.findById(id);
        model.addAttribute("product", product);
        return "employee/product-detail";
    }

    @RequestMapping(value = "change-detail/{id}.htm", method = RequestMethod.POST)
    public String changeDetail(@ModelAttribute("product") Product product) {
        productService.save(product);
        return "employee/product-detail";
    }

    @RequestMapping(value = "changePhoto-detail/{id}.htm", method = RequestMethod.POST)
    public String changePhoto(@ModelAttribute("product") Product product, @RequestParam("file_image") MultipartFile photo, Model model) {
        try {
            String filePhoto = StringUtils.cleanPath(Objects.requireNonNull(photo.getOriginalFilename()));
            String path = context.getRealPath("/project/products/" + filePhoto);
            if (!(filePhoto.endsWith(".jpg")) &&
                    !(filePhoto.endsWith(".svg")) && !(filePhoto.endsWith(".png"))
                    && !(filePhoto.endsWith(".jpeg")) && !(filePhoto.endsWith(".PNG"))
                    && !(filePhoto.endsWith(".JPEG")) && !(filePhoto.endsWith(".JPG"))) {
                model.addAttribute("message", "Ảnh đại diện không đúng định dạng");
                return "/employee/edit-customer";
            } else if (!photo.isEmpty()) {
                photo.transferTo(new File(path));
                product.setPhoto(filePhoto);
            }
            productService.save(product);
            model.addAttribute("message", "Update Product Successfully");
            return "employee/product-detail";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "employee/product-detail";
    }

    @RequestMapping(value = "filterStatus.htm", method = RequestMethod.POST)
    public String filterStatus(@RequestParam(value = "key") String key, Model model) {
        if (key.isEmpty()) {
            return "redirect:/Shopping.com/employee/product";
        }
        List<Product> search = productService.searchByStatus(key);
        model.addAttribute("productList", search);
        return "employee/search-product";
    }

    @RequestMapping(value = "filter.htm", method = RequestMethod.POST)
    public String filterStatus(@RequestParam(value = "key") String key, @RequestParam("DM") Integer DM,
                               @RequestParam("HSX") Integer HSX, Model model) {
        if (key.isEmpty() && DM == null && HSX == null) {
            return "redirect:/Shopping.com/employee/product";
        } else if (!key.isEmpty() && DM != null && HSX != null) {
            List<Product> search = productService.searchByAll(key, DM, HSX);
            model.addAttribute("productList", search);
            return "employee/search-product";
        } else if (!key.isEmpty() && DM == null && HSX == null) {
            List<Product> search = productService.searchByKey(key);
            model.addAttribute("productList", search);
            return "employee/search-product";
        } else if (key.isEmpty() && DM != null && HSX != null) {
            List<Product> search = productService.searchBy2(DM, HSX);
            model.addAttribute("productList", search);
            System.out.println("2 here");
            return "employee/search-product";
        } else if (key.isEmpty() && DM != null) {
            List<Product> search = productService.searchByCate(DM);
            model.addAttribute("productList", search);
            System.out.println("cate here");
            return "employee/search-product";
        } else if (key.isEmpty() && HSX != null) {
            List<Product> search = productService.searchByPro(HSX);
            model.addAttribute("productList", search);
            System.out.println("pro here");
            return "employee/search-product";
        } else if (!key.isEmpty() && DM != null && HSX == null) {
            List<Product> search = productService.searchByNameAndCate(key, DM);
            model.addAttribute("productList", search);
            System.out.println("nam and cate here");
            return "employee/search-product";
        } else if (!key.isEmpty() && DM == null && HSX != null) {
            List<Product> search = productService.searchByNameAndPro(key, HSX);
            model.addAttribute("productList", search);
            System.out.println("nam and pro here");
            return "employee/search-product";
        }
        return "employee/search-product";
    }
}
