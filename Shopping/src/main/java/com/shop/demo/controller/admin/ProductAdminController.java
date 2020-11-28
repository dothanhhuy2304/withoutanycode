package com.shop.demo.controller.admin;

import com.shop.demo.export.ProductExcelExport;
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
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Objects;

@Controller
@RequestMapping(value = "/Shopping.com/admin/product", method = RequestMethod.GET)
public class ProductAdminController {

    @Autowired
    private ProductService productService;

    @Autowired
    HttpSession httpSession;

    @Autowired
    ServletContext context;

    //Manager product
    @RequestMapping(value = "")
    public String productIndex(Model model, Pageable pageable, HttpServletResponse response) {
        Page<Product> page = productService.findAlls(pageable);
        response.setHeader("list", "Shopping.com/admin/product");
        model.addAttribute("number", page.getNumber());
        model.addAttribute("totalPages", page.getTotalPages());
        model.addAttribute("totalElements", page.getTotalElements());
        model.addAttribute("size", page.getSize());
        model.addAttribute("productList", page.getContent());
        return "admin/product-list";
    }

    @RequestMapping(value = "accept/{id}.htm")
    public String acceptProduct(@PathVariable int id) {
        Product product = productService.findById(id);
        product.setStatus(true);
        productService.save(product);
        return "redirect:/Shopping.com/admin/product";
    }

    @RequestMapping(value = "reaccept/{id}.htm")
    public String reacceptProduct(@PathVariable int id) {
        Product product = productService.findById(id);
        product.setStatus(false);
        productService.save(product);
        return "redirect:/Shopping.com/admin/product";
    }


    @RequestMapping(value = "add-product.htm", method = RequestMethod.GET)
    public String addProduct(Model model) {
        model.addAttribute("product", new Product());
        return "admin/form-product";
    }

    @RequestMapping(value = "save-product", method = RequestMethod.POST)
    public String saveProduct(@ModelAttribute("product") Product product, BindingResult result,
                              @RequestParam("file_image") MultipartFile photo, Model model) {
        try {
            String filePhoto = StringUtils.cleanPath(Objects.requireNonNull(photo.getOriginalFilename()));
            String path = context.getRealPath("/project/products/" + filePhoto);
            if (result.hasErrors()) {
                return "admin/form-product";
            } else if (!(filePhoto.endsWith(".jpg")) &&
                    !(filePhoto.endsWith(".svg")) && !(filePhoto.endsWith(".png"))
                    && !(filePhoto.endsWith(".jpeg")) && !(filePhoto.endsWith(".PNG"))
                    && !(filePhoto.endsWith(".JPEG")) && !(filePhoto.endsWith(".JPG"))) {
                model.addAttribute("message", "Hình ảnh không dúng dịnh dạng vui lòng thử lại");
            } else {
                photo.transferTo(new File(path));
                product.setStatus(true);
                product.setPhoto(filePhoto);
                productService.save(product);
                model.addAttribute("message", "Thêm sản phẩm thành công");
            }
            return "admin/form-product";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "admin/form-product";
    }


    @RequestMapping(value = "edit-product/{id}.htm")
    public String editProduct(@PathVariable int id, Model model) {
        Product product = productService.findById(id);
        model.addAttribute("product", product);
        return "/admin/form-edit-product";
    }

    @RequestMapping(value = "save-edit-product", method = RequestMethod.POST)
    public String saveEditProduct(@ModelAttribute("product") Product product, BindingResult result,
                                  @RequestParam("file_image") MultipartFile photo, Model model) {
        try {
            String filePhoto = StringUtils.cleanPath(Objects.requireNonNull(photo.getOriginalFilename()));
            String path = context.getRealPath("/project/products/" + filePhoto);
            if (result.hasErrors()) {
                return "admin/form-edit-product";
            } else if (!(filePhoto.endsWith(".jpg")) &&
                    !(filePhoto.endsWith(".svg")) && !(filePhoto.endsWith(".png"))
                    && !(filePhoto.endsWith(".jpeg")) && !(filePhoto.endsWith(".PNG"))
                    && !(filePhoto.endsWith(".JPEG")) && !(filePhoto.endsWith(".JPG"))) {
                model.addAttribute("message", "Ảnh đại diện không đúng định dạng");
                return "/admin/form-edit-product";
            } else if (!photo.isEmpty()) {
                photo.transferTo(new File(path));
                product.setPhoto(filePhoto);
                product.setStatus(true);
            }
            productService.save(product);
            model.addAttribute("message", "Sửa Sản Phẩm Thành Công");
            return "admin/form-edit-product";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "admin/form-edit-product";
    }

    @RequestMapping(value = "filterStatus.htm", method = RequestMethod.POST)
    public String filterStatus(@RequestParam("key") String key, Model model) {
        if (key.isEmpty()) {
            return "redirect:/Shopping.com/admin/product";
        }
        model.addAttribute("productList", productService.searchByStatus(key));
        return "admin/search-product";
    }

    @RequestMapping(value = "filter.htm", method = RequestMethod.POST)
    public String filterStatus(@RequestParam(value = "key") String key, @RequestParam("DM") Integer DM,
                               @RequestParam("HSX") Integer HSX, Model model) {
        if (key.isEmpty() && DM == null && HSX == null) {
            return "redirect:/Shopping.com/admin/product";
        } else if (!key.isEmpty() && DM != null && HSX != null) {
            List<Product> search = productService.searchByAll(key, DM, HSX);
            model.addAttribute("productList", search);
            return "admin/search-product";
        } else if (!key.isEmpty() && DM == null && HSX == null) {
            List<Product> search = productService.searchByKey(key);
            model.addAttribute("productList", search);
            return "admin/search-product";
        } else if (key.isEmpty() && DM != null && HSX != null) {
            List<Product> search = productService.searchBy2(DM, HSX);
            model.addAttribute("productList", search);
            System.out.println("2 here");
            return "admin/search-product";
        } else if (key.isEmpty() && DM != null) {
            List<Product> search = productService.searchByCate(DM);
            model.addAttribute("productList", search);
            System.out.println("cate here");
            return "admin/search-product";
        } else if (key.isEmpty() && HSX != null) {
            List<Product> search = productService.searchByPro(HSX);
            model.addAttribute("productList", search);
            System.out.println("pro here");
            return "admin/search-product";
        } else if (!key.isEmpty() && DM != null && HSX == null) {
            List<Product> search = productService.searchByNameAndCate(key, DM);
            model.addAttribute("productList", search);
            System.out.println("nam and cate here");
            return "admin/search-product";
        } else if (!key.isEmpty() && DM == null && HSX != null) {
            List<Product> search = productService.searchByNameAndPro(key, HSX);
            model.addAttribute("productList", search);
            System.out.println("nam and pro here");
            return "admin/search-product";
        }
        return "admin/search-product";
    }

    @RequestMapping(value = "delete/{id}.htm", method = RequestMethod.POST)
    public String deleteProduct(@PathVariable int id) {
        Product product = productService.findById(id);
        productService.delete(product);
        return "redirect:/Shopping.com/admin/product";
    }

    @RequestMapping(value = "detail/{id}.htm", method = RequestMethod.POST)
    public String productDetail(@PathVariable int id, Model model) {
        Product product = productService.findById(id);
        model.addAttribute("product", product);
        return "admin/product-detail";
    }

    @RequestMapping(value = "change-detail/{id}.htm", method = RequestMethod.POST)
    public String changeDetail(@ModelAttribute("product") Product product) {
        productService.save(product);
        return "admin/product-detail";
    }

    @RequestMapping(value = "changePhoto-detail/{id}.htm", method = RequestMethod.POST)
    public String changePhoto(@ModelAttribute("product") Product product, @RequestParam("file_image") MultipartFile photo,
                              Model model) {
        try {
            String filePhoto = StringUtils.cleanPath(Objects.requireNonNull(photo.getOriginalFilename()));
            String path = context.getRealPath("/project/products/" + filePhoto);
            if (!(filePhoto.endsWith(".jpg")) &&
                    !(filePhoto.endsWith(".svg")) && !(filePhoto.endsWith(".png"))
                    && !(filePhoto.endsWith(".jpeg")) && !(filePhoto.endsWith(".PNG"))
                    && !(filePhoto.endsWith(".JPEG")) && !(filePhoto.endsWith(".JPG"))) {
                model.addAttribute("message", "Ảnh đại diện không đúng định dạng");
            } else if (!filePhoto.isEmpty()) {
                photo.transferTo(new File(path));
                product.setPhoto(filePhoto);
                productService.save(product);
                model.addAttribute("message", "Chỉnh sửa sản phẩm thành công");
                return "admin/product-detail";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "admin/product-detail";
    }

    @RequestMapping(value = "excel-export", method = RequestMethod.POST)
    public void excelExport(HttpServletResponse response) throws IOException {
        response.setContentType("application/octet-stream");
        String headerKey = "Content-Disposition";
        DateFormat dateFormat = new SimpleDateFormat("yy/MM/dd_HH:mm:ss");
        String currentDateTime = dateFormat.format(new Date());
        String fileName = "Product_" + currentDateTime + ".xlsx";
        String headerValue = "attachment;filename=" + fileName;
        response.setHeader(headerKey, headerValue);
        List<Product> productList = productService.findAllProduct();
        ProductExcelExport excelExport = new ProductExcelExport(productList);
        excelExport.export(response);
    }

}
