package com.shop.demo.controller.admin;

import com.shop.demo.model.Admin;
import com.shop.demo.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Objects;

@Controller
@RequestMapping(value = "/Shopping.com/admin", method = RequestMethod.GET)
public class HomeController {

    @Autowired
    private AdminService adminService;

    @Autowired
    BCryptPasswordEncoder bCryptPasswordEncoder;

    @Autowired
    HttpSession httpSession;

    @RequestMapping(value = "home", method = RequestMethod.GET)
    public String index() {
        return "admin/home-admin";
    }


    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String register(Model model) {
        model.addAttribute("admin", new Admin());
        return "admin/page-register";
    }

    ////Cần sửa lại
    @RequestMapping(value = "/saveRegister", method = RequestMethod.POST)
    public String saveRegister(@ModelAttribute("admin") Admin admin, Model model,
                               @RequestParam("username") String username) {
        String adminExist = adminService.checkId(admin.getUsername());
        admin.setPassword(bCryptPasswordEncoder.encode(admin.getPassword()));
        admin.setAccess(0);
        if (adminExist != null || Objects.equals(adminExist, username)) {
            model.addAttribute("message", "Tài khoản đã tồn tại");
        } else {
            adminService.save(admin);
            String text = "Đã đăng kí thành công tài khoản " + admin.getUsername()
                    + "<br> để kích hoạt tài khoản hãy liên Hệ Với " +
                    "<span style='color: blue;text-decoration: blue'>" +
                    " <a href='https://www.facebook.com/people/%C4%90%E1%BB%97-Huy/100010618027265' target='_blank' class='ui-icon-link'>" +
                    "Đỗ Thành Huy</a></span> Để Mở Khóa";
            model.addAttribute("message", text);
            return "admin/page-register";
        }
        return "admin/page-register";
    }

    @RequestMapping(value = "login", method = RequestMethod.GET)
    public String loginPage(Model model) {
        model.addAttribute("admin", new Admin());
        return "admin/page-login";
    }


    @RequestMapping(value = "checkLogin", method = RequestMethod.POST)
    public String checkLogin(@ModelAttribute("admin") Admin admin, Model model,
                             @RequestParam(defaultValue = "false") boolean remember, HttpServletResponse response) {
        String employeeEncoderPassword = adminService.checkAdminPassword(admin.getUsername());
        boolean checkStatus = bCryptPasswordEncoder.matches(admin.getPassword(), employeeEncoderPassword);
        Admin adminStatus = adminService.findOneAdmin(admin.getUsername());
        if (adminStatus == null) {
            model.addAttribute("message", "Tài khoản hoặc mật khẩu không chính xác");
            System.out.println("Tài khoản chưa kích hoạt");
            return "admin/page-login";
        } else if (adminStatus.getAccess() == -1) {
            model.addAttribute("message", "Xin lỗi tài khoản của bạn đang bị khóa<br>" +
                    "Rất mong được phục vụ bạn trong tương lai");
            System.out.println("Tài khoản bị khóa");
            return "admin/page-login";
        } else if (adminStatus.getAccess() == 0) {
            model.addAttribute("message", "Tài khoản của bạn chưa được kích hoạt<br>" +
                    "liên hệ với Đỗ Thành Huy để kích hoạt tại khoản");
            System.out.println("Tài khoản chưa kích hoạt");
            return "admin/page-login";
        } else {
            if (checkStatus) {
                admin = adminService.checkLogin(admin.getUsername(), employeeEncoderPassword);
                if (admin != null) {
                    httpSession.setAttribute("admin", admin);
                    Cookie ckuser = new Cookie("id", admin.getUsername());
                    Cookie ckpass = new Cookie("pw", admin.getPassword());
                    int expiry = 7 * 24 * 60 * 60;
                    if (!remember) {
                        expiry = 0;
                    }
                    ckuser.setMaxAge(expiry);
                    ckpass.setMaxAge(expiry);
                    response.addCookie(ckuser);
                    response.addCookie(ckpass);
                    return "admin/home-admin";
                } else {
                    model.addAttribute("message", "Đăng nhập thất bại");
                    return "admin/page-login";
                }
            }
        }
        return "admin/page-login";
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout() {
        httpSession.removeAttribute("admin");
        return "redirect:/Shopping.com/admin/login";
    }

    //Chưa viết font end
    @RequestMapping(value = "change-info/{id}.htm", method = RequestMethod.GET)
    public String changeInfo(@PathVariable String id, Model model) {
        Admin admin = adminService.findOneAdmin(id);
        model.addAttribute("admin", admin);
        return "admin/change-info";
    }

    @RequestMapping(value = "save-change", method = RequestMethod.POST)
    public String saveChange(@ModelAttribute("admin") Admin admin, BindingResult result, Model model) {
        if (result.hasErrors()) {
            model.addAttribute("message", "Thay đổi thông tin thất bại");
            return "admin/change-info";
        }
        if (admin != null) {
            admin.setAccess(1);
            adminService.save(admin);
            model.addAttribute("message", "Thay đổi thông tin thành công");
            return "admin/change-info";
        }
        model.addAttribute("message", "Thay đổi thông tin thất bại");
        return "admin/change-info";
    }

    @RequestMapping(value = "change-pass/{id}.htm", method = RequestMethod.GET)
    public String changePassword(@PathVariable String id, Model model) {
        model.addAttribute("admin", adminService.findOneAdmin(id));
        return "admin/change-pass";
    }

    @RequestMapping(value = "save-pass", method = RequestMethod.POST)
    public String changePassword(@ModelAttribute("admin") Admin admin, Model model,
                                 @RequestParam("password") String password, @RequestParam("password1") String password1,
                                 @RequestParam("password2") String password2) {
        Admin oldPassword = (Admin) httpSession.getAttribute("admin");
        String passwordEncoder = adminService.checkAdminPassword(oldPassword.getUsername());
        boolean checkStatus = bCryptPasswordEncoder.matches(admin.getPassword(), passwordEncoder);
        if (!checkStatus) {
            model.addAttribute("message", "Tài mật khẩu không chính xác");
            return "admin/change-pass";
        } else if (!password1.equals(password2)) {
            model.addAttribute("message", "Xác nhận mật khẩu thất bại");
            return "admin/change-pass";
        }
        admin.setPassword(bCryptPasswordEncoder.encode(password1));
        adminService.save(admin);
        httpSession.setAttribute("admin", admin);
        String text = "Xin chào" + admin.getUsername() + "<br>bạn đã thay đổi mật khẩu thành công";
        model.addAttribute("message", text);
        return "admin/change-pass";
    }

}