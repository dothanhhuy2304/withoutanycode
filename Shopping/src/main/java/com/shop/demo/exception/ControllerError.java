package com.shop.demo.exception;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class ControllerError implements ErrorController {

    @RequestMapping("/error")
    public String handleError(HttpServletRequest request, Model model) {
        Integer statusCode = (Integer) request.getAttribute("javax.servlet.error.status_code");
        Exception exception = (Exception) request.getAttribute("javax.servlet.error.exception");
        model.addAttribute("statusCode", statusCode);
        if (statusCode == 404) {
            String exceptionValue = "The page you are looking for might have been removed had its name changed or is temporarily unavailable.";
            model.addAttribute("exception", exceptionValue);
            return "error/error-404";
        } else {
            model.addAttribute("exception", exception);
            return "error/error-500";
        }
    }

    @Override
    public String getErrorPath() {
        return "error/error-500";
    }

}
