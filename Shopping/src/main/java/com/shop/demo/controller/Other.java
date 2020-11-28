package com.shop.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/Shopping.com/user", method = RequestMethod.GET)
public class Other {

    @RequestMapping("/about")
    public String aboutUs() {
        return "views/about-us";
    }

    @RequestMapping("/contact")
    public String contact() {
        return "views/contact";
    }

}
