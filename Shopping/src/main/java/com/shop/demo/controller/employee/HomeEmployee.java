package com.shop.demo.controller.employee;

import com.shop.demo.model.Employee;
import com.shop.demo.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
@RequestMapping(value = "/Shopping.com/employee", method = RequestMethod.GET)
public class HomeEmployee {

    @Autowired
    private EmployeeService employeeService;

    @Autowired
    private ServletContext context;

    @Autowired
    BCryptPasswordEncoder bCryptPasswordEncoder;

    @Autowired
    HttpSession httpSession;

    //Home
    @RequestMapping("/home")
    public String homeEmployee() {
        return "/employee/home-page";
    }

    //Form đăng ký
    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String registerEmployee(Model model) {
        model.addAttribute("employee", new Employee());
        return "/employee/register";
    }

    //Tạo employee
    @RequestMapping(value = {"/saveEmployee"}, method = RequestMethod.POST)
    public String saveEmployee(@ModelAttribute("employee") @Valid Employee employee,
                               BindingResult result, Model model,
                               @RequestParam("file_image") MultipartFile photo,
                               @RequestParam("username") String username,
                               RedirectAttributes redirect) {

        try {
            if (result.hasErrors()) {
                System.out.println("Error");
                return "employee/register";
            }
            //Check Exist
            String userExist = employeeService.checkUserName(employee.getUsername());
            //Attention must set before checking for conditions
            String filePhoto = StringUtils.cleanPath(Objects.requireNonNull(photo.getOriginalFilename()));
            String path = context.getRealPath("/project/employees/" + filePhoto);

            photo.transferTo(new File(path));
            employee.setDepartment(employee.getDepartment());
            employee.setPhoto(filePhoto);
            employee.setActivated(false);
            employee.setPassword(bCryptPasswordEncoder.encode(employee.getPassword()));
            if (!(filePhoto.endsWith(".jpg")) &&
                    !(filePhoto.endsWith(".svg")) && !(filePhoto.endsWith(".png"))
                    && !(filePhoto.endsWith(".jpeg")) && !(filePhoto.endsWith(".PNG"))
                    && !(filePhoto.endsWith(".JPEG")) && !(filePhoto.endsWith(".JPG"))) {
                redirect.addAttribute("Đăng kí thất bại");
                redirect.addFlashAttribute("status_note_login", "Đăng kí thất bại");
                System.out.println("Image");
                return "redirect:/Shopping.com/employee/register";
            } else if (userExist != null || Objects.equals(userExist, username)) {
                model.addAttribute("status_note_login", "Tài khoản đã tồn tại");
                return "employee/register";
            }
            employeeService.save(employee);
            String text = "Xin chào \t " + employee.getUsername() + "<br>đã đăng kí thành công";
            model.addAttribute("status_note_login", text);
            System.out.println("Save");
            return "/employee/register";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/employee/register";
    }

    //Login form
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String Login(Model model) {
        model.addAttribute("employee", new Employee());
        return "/employee/login";
    }

    //Kiểm tra đăng nhập
    @RequestMapping(value = "/checkLogin", method = RequestMethod.POST)
    public String checkLogin(@Valid @ModelAttribute("employee") Employee employee,
                             BindingResult result, @RequestParam(defaultValue = "false") boolean remember,
                             Model model, HttpServletResponse response, RedirectAttributes redirect) {
        if (result.hasErrors()) {
            System.out.println("Error");
            return "/employee/login";
        }
        Employee employeeExist = employeeService.findByUserEmployee(employee.getUsername());
        if (employeeExist == null) {
            model.addAttribute("message", "Tài khoản hoặc mật khẩu không chính xác");
        } else if (employeeExist.getAccess() == -1) {
            model.addAttribute("message", "Tài khoản của bạn đã bị khóa vui lòng liên hệ với admin để biết thêm chi tiết");
        } else if (!employeeExist.getActivated()) {
            System.out.println("Login Failure");
            model.addAttribute("Login Failure");
            String text = "Tài khoản của bạn chưa kích hoạt hoặc đang bị khóa" +
                    "<br> Liên hệ với <a href='https://www.facebook.com/%C4%90%E1%BB%97-Th%C3%A0nh-Huy-C9-102950021596807' title='Đỗ Huy'>Đỗ Huy</a>";
            model.addAttribute("message", text);
            return "/employee/login";
        } else {
            String employeeEncoderPassword = employeeService.findEmployeePassword(employee.getUsername());
            boolean checkPassStatus = bCryptPasswordEncoder.matches(employee.getPassword(), employeeEncoderPassword);
            if (checkPassStatus) {
                employee = employeeService.checkLogin(employee.getUsername(), employeeEncoderPassword);
                if (employee != null) {
                    httpSession.setAttribute("employee", employee);
                    // Nhận cookie 7 ngày
                    Cookie ckUser = new Cookie("id", employee.getUsername());
                    Cookie ckPass = new Cookie("pw", employee.getPassword());
                    int expiry = 7 * 24 * 60 * 60;
                    if (!remember) {
                        expiry = 0;
                    }
                    ckUser.setMaxAge(expiry);
                    ckPass.setMaxAge(expiry);

                    response.addCookie(ckUser);
                    response.addCookie(ckPass);
                    return "/employee/home-page";
                } else {
                    model.addAttribute("message", "Tài khoản hoặc mật khẩu không chính xác");
                }
            } else {
                redirect.addFlashAttribute("message", "Password doesn't match ");
                return "redirect:/Shopping.com/employee/login";
            }
        }
        return "/employee/login";
    }

    //Đăng xuất
    @RequestMapping(value = {"/logout"}, method = RequestMethod.POST)
    public String logout() {
        httpSession.removeAttribute("employee");
        return "redirect:/Shopping.com/employee/login";
    }

    @RequestMapping(value = "/change-info/{id}.htm", method = RequestMethod.GET)
    public String changeInfo(@PathVariable Long id, Model model) {
        Employee employee = employeeService.findByIdEmployee(id);
        model.addAttribute("employee", employee);
        return "/employee/change-info";
    }


    @RequestMapping(value = "/save-change", method = RequestMethod.POST)
    public String saveChange(@Valid @ModelAttribute("employee") Employee employee,
                             BindingResult result,
                             @RequestParam("file_image") MultipartFile photo, Model model,
                             RedirectAttributes redirect) {
        try {
            if (result.hasErrors()) {
                result.rejectValue("error", "error.employee.password", "Password failure");
                return "/employee/change-info";
            }
            String filePhoto = StringUtils.cleanPath(Objects.requireNonNull(photo.getOriginalFilename()));
            if (!(filePhoto.endsWith(".jpg")) &&
                    !(filePhoto.endsWith(".svg")) && !(filePhoto.endsWith(".png"))
                    && !(filePhoto.endsWith(".jpeg")) && !(filePhoto.endsWith(".PNG"))
                    && !(filePhoto.endsWith(".JPEG")) && !(filePhoto.endsWith(".JPG"))) {
                redirect.addAttribute("Change Failure");
                model.addAttribute("status_note_login", "Thay đổi thất bại");
                return "/employee/change-info";
            }
            if (!photo.isEmpty()) {
                String path = context.getRealPath("/project/employees/" + filePhoto);
                photo.transferTo(new File(path));
                employee.setPhoto(filePhoto);
            }
            employeeService.save(employee);
            model.addAttribute("status_note_login", "Thay đổi thành công");
            httpSession.setAttribute("employee", employee);
            return "/employee/change-info";
        } catch (Exception e) {
            e.printStackTrace();
            redirect.addAttribute("Register Failure");
        }
        return "/employee/change-info";
    }

    @RequestMapping(value = "change-pass/{id}.htm", method = RequestMethod.GET)
    public String changePass(@PathVariable long id, Model model) {
        Employee employee = (Employee) employeeService.findByIdEmployee(id);
        model.addAttribute("employee", employee);
        return "employee/change-pass";
    }

    @RequestMapping(value = "/savechange-pass", method = RequestMethod.POST)
    public String saveChange(@ModelAttribute Employee employee,
                             BindingResult result, @RequestParam("password") String password,
                             @RequestParam(value = "password1", required = false) String password1,
                             @RequestParam(value = "password2", required = false) String password2,
                             Model model) {
        Employee oldPass = (Employee) httpSession.getAttribute("employee");
        String passwordEncoder = employeeService.findEmployeePassword(oldPass.getUsername());
        boolean checkPassword = bCryptPasswordEncoder.matches(employee.getPassword(), passwordEncoder);
        if (!checkPassword) {
            model.addAttribute("message", "Mật khẩu không chính xác");
            return "employee/change-pass";
        } else if (!password1.equals(password2)) {
            model.addAttribute("message", "Xác nhận mật khẩu thất bại");
            return "employee/change-pass";
        }
        employee.setPassword(bCryptPasswordEncoder.encode(password1));
        employeeService.save(employee);
        httpSession.setAttribute("employee", employee);
        String text = "Xin chào " + employee.getUsername() + " bạn đã thay đổi mật khẩu thành công";
        model.addAttribute("message", text);
        return "employee/change-pass";
    }


}