package com.shop.demo.controller;

import com.shop.demo.model.Customer;
import com.shop.demo.service.CustomerService;
import com.shop.demo.utils.Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.File;
import java.util.Objects;

@Controller
@RequestMapping(value = "/Shopping.com/user", method = RequestMethod.GET)
public class CustomerController {

    @Autowired
    private ServletContext context;

    @Autowired
    private CustomerService customerService;

    @Autowired
    Utils utils;

    @Autowired
    HttpSession httpSession;

    @Autowired
    BCryptPasswordEncoder bCryptPasswordEncoder;


    //form đăng kí
    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String register(Model model) {
        model.addAttribute("customer", new Customer());
        return "/views/register";
    }

    //Đăng kí
    @RequestMapping(value = "/saveCustomer", method = RequestMethod.POST)
    public String saveCustomer(@Valid @ModelAttribute("customer") Customer customer,
                               @RequestParam("file_image") MultipartFile photo,
                               @RequestParam("id") String id,
                               BindingResult result, Model model) {
        try {
            if (result.hasErrors()) {
                return "/views/register";
            }
            String username = customer.getId();
            String empID = username.substring(0, 2).toUpperCase() + utils.generateRandomNumber();

            String userExist = customerService.checkId(customer.getId());
            String filePhoto = StringUtils.cleanPath(Objects.requireNonNull(photo.getOriginalFilename()));
            String path = context.getRealPath("/project/customers/" + filePhoto);

            photo.transferTo(new File(path));
            customer.setCode(empID);
            customer.setPhoto(filePhoto);
            customer.setId(customer.getId());
            customer.setAccess(1);
            customer.setPassword(bCryptPasswordEncoder.encode(customer.getPassword()));
            if (!(filePhoto.endsWith(".jpg")) &&
                    !(filePhoto.endsWith(".svg")) && !(filePhoto.endsWith(".png"))
                    && !(filePhoto.endsWith(".jpeg")) && !(filePhoto.endsWith(".PNG"))
                    && !(filePhoto.endsWith(".JPEG")) && !(filePhoto.endsWith(".JPG"))) {
                model.addAttribute("Đăng kí thất bại");
                model.addAttribute("status_note_login", "Đăng kí thất bại");
                return "views/register";
            } else if (userExist != null || Objects.equals(userExist, id)) {
                model.addAttribute("status_note_login", "Tài khoản đã tồn tại");
                return "views/register";
            }
            customerService.saveCustomer(customer);
            String text = "Xin chào \t " + customer.getFullName() + "<br>đã đăng kí thành công";
            model.addAttribute("status_note_login", text);
            return "views/register";
        } catch (Exception e) {
            model.addAttribute("message", "Đăng ký thất bại,vui lòng thử lại!");
        }
        return "/views/register";
    }

    //Form đăng nhập
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String formLogin(ModelMap model) {
        model.addAttribute("user", new Customer());
        return "/views/login";
    }

    //Kiểm tra đăng nhập
    @RequestMapping(value = "checkLogin", method = RequestMethod.POST)
    public String login(@Valid @ModelAttribute("user") Customer user,
                        @RequestParam(defaultValue = "false") boolean remember,
                        Model model, HttpServletResponse response, RedirectAttributes redirect) {
        // Kiểm tra tồn tại
        Customer userExist = customerService.findByIdCustomer(user.getId());
        if (userExist == null) {
            model.addAttribute("message", "Tài khoản hoặc mật khẩu không chính xác");
        } else if (userExist.getAccess() == -1) {
            model.addAttribute("message", "Tài khoản của bạn đã bị khóa liên hệ với nhân viên cửa hàng để biết thêm chi tiết");
        } else if (userExist.getAccess() == 0) {
            System.out.println("Block");
            String text = "Tài khoản của bạn đã bị khóa" +
                    "<br> Liên hệ với <a href='https://www.facebook.com/%C4%90%E1%BB%97-Th%C3%A0nh-Huy-C9-102950021596807' title='Đỗ Huy'>Đỗ Huy</a>";
            model.addAttribute("message", text);
        } else if (!userExist.getActivated()) {
            System.out.println("Not Active");
            String text = "Tài khoản của bạn chưa kích hoạt" +
                    "<br> Liên hệ với <a href='https://www.facebook.com/%C4%90%E1%BB%97-Th%C3%A0nh-Huy-C9-102950021596807' title='Đỗ Huy'>Đỗ Huy</a>";
            model.addAttribute("message", text);
        } else {
            // Kiểm tra nếu mật khẩu phù hợp
            String customerEncodedPassword = customerService.findCustomerPassword(user.getId());
            boolean checkPassStatus = bCryptPasswordEncoder.matches(user.getPassword(), customerEncodedPassword);
            if (checkPassStatus) {
                user = customerService.checkLogin(user.getId(), customerEncodedPassword);
                if (user != null) {
                    httpSession.setAttribute("user", user);
                    // Nhận cookie 7 ngày
                    Cookie ckUser = new Cookie("id", user.getId());
                    Cookie ckPass = new Cookie("pw", user.getPassword());
                    int expiry = 7 * 24 * 60 * 60;
                    if (!remember) {
                        expiry = 0;
                    }
                    ckUser.setMaxAge(expiry);
                    ckPass.setMaxAge(expiry);

                    response.addCookie(ckUser);
                    response.addCookie(ckPass);

                    return "redirect:/Shopping.com/user/product";
                } else {
                    redirect.addAttribute("login-error");
                    redirect.addFlashAttribute("message", "Password doesn't match ");
                }
            } else {
                redirect.addFlashAttribute("message", "Password doesn't match ");
                return "redirect:/Shopping.com/user/login";
            }
        }
        return "/views/login";
    }

    //Logout
    @RequestMapping(value = "/logout", method = RequestMethod.POST)
    public String logout() {
        httpSession.removeAttribute("user");
        return "redirect:/Shopping.com/user/product";
    }

    //Trang thay đổi mật khẩu
    @RequestMapping(value = "change-pass/{id}.htm")
    public String changePass(@PathVariable("id") String id, Model model) {
        Customer customer = customerService.findByIdCustomer(id);
        model.addAttribute("user", customer);
        return "/views/change-pass";
    }

    //Cần chỉnh sửa
    //Thay đổi mật khẩu
    @RequestMapping(value = "/save-pass", method = RequestMethod.POST)
    public String changePass(ModelMap model, @Valid @ModelAttribute("user") Customer user,
                             @RequestParam(value = "password", required = false) String password,
                             @RequestParam(value = "password1", required = false) String password1,
                             @RequestParam(value = "password2", required = false) String password2, RedirectAttributes redirect) {
        Customer oldPass = (Customer) httpSession.getAttribute("user");
        String passwordEncoder = customerService.findCustomerPassword(oldPass.getId());
        boolean checkPassword = bCryptPasswordEncoder.matches(user.getPassword(), passwordEncoder);
        if (!checkPassword) {
            model.addAttribute("message", "Mật khẩu không chính xác");
            return "views/change-pass";
        } else if (!password1.equals(password2)) {
            model.addAttribute(",message", "Xác nhận mật khẩu thất bại");
            System.out.println("Mật khẩu không chính xác");
            return "views/change-pass";
        }
        user.setPassword(bCryptPasswordEncoder.encode(password1));
        customerService.saveCustomer(user);
        httpSession.setAttribute("user", user);
        String text = "Xin chào \t " + user.getFullName() + "<br>đã đăng kí thành công";
        model.addAttribute("message", text);
        return "/views/change-pass";
    }


    //Thay đổi thông tin
    @RequestMapping(value = "/change-info/{id}.htm", method = RequestMethod.GET)
    public String changeInfor(@PathVariable("id") String id, Model model) {
        Customer customer = customerService.findOneId(id);
        model.addAttribute("user", customer);
        return "views/change-infor";
    }

    //Lưu thông tin
    @RequestMapping(value = "/save-change", method = RequestMethod.POST)
    public String saveInfor(@Valid @ModelAttribute("user") Customer user,
                            @RequestParam("file_image") MultipartFile photo,
                            Model model) {
        try {
            String filePhoto = StringUtils.cleanPath(Objects.requireNonNull(photo.getOriginalFilename()));
            String path = context.getRealPath("/project/customers/" + filePhoto);

            if (!(filePhoto.endsWith(".jpg")) &&
                    !(filePhoto.endsWith(".svg")) && !(filePhoto.endsWith(".png"))
                    && !(filePhoto.endsWith(".jpeg")) && !(filePhoto.endsWith(".PNG"))
                    && !(filePhoto.endsWith(".JPEG")) && !(filePhoto.endsWith(".JPG"))) {
                model.addAttribute("message", "Ảnh đại diện không đúng định dạng");
                return "views/change-infor";
            } else if (!photo.isEmpty()) {
                photo.transferTo(new File(path));
                user.setPhoto(filePhoto);
            }
            customerService.saveCustomer(user);

            httpSession.setAttribute("user", user);

            String text = "Xin chào \t " + user.getFullName() + "<br>đã thay đổi thông tin thành công";
            model.addAttribute("message", text);
            return "views/change-infor";
        } catch (Exception e) {
            model.addAttribute("message", "Thay đổi thất bại,vui lòng thử lại!");
        }
        return "views/change-infor";
    }

}



