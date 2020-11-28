package com.shop.demo.config;

import com.shop.demo.interceptor.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

//Có thể sử dụng @Component Trong trường hợp này
@Configuration
//không còn được hỗ trợ WebMvcConfigurerAdapter
public class GlobalInterceptor implements WebMvcConfigurer {
    @Autowired
    private ProductInterceptor productInterceptor;
    @Autowired
    private UserAuthorizeInterceptor userAuthorizeInterceptor;
    @Autowired
    private EmployeeInterceptor employeeInterceptor;
    @Autowired
    private ProductManagerInterceptor productManagerInterceptor;
    @Autowired
    private AdminInterceptor adminInterceptor;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        //Menu
        registry.addInterceptor(productInterceptor);
        //User
        registry.addInterceptor(userAuthorizeInterceptor).
                addPathPatterns("/Shopping.com/user/change-pass/{id}.htm")
                .addPathPatterns("/Shopping.com/order/**")
                .addPathPatterns("/Shopping.com/user/change-info/{id}.htm")
                .addPathPatterns("/Shopping.com/user/change-pass/{id}.htm");
        //Employee
        registry.addInterceptor(employeeInterceptor)
                .addPathPatterns("/Shopping.com/employee/home/**")
                .addPathPatterns("/Shopping.com/employee/customer/**")
                .addPathPatterns("/Shopping.com/employee/category/**")
                .addPathPatterns("/Shopping.com/employee/producer/**")
                .addPathPatterns("/Shopping.com/employee/product/**")
                .addPathPatterns("/Shopping.com/employee/order/**")
                .addPathPatterns("/Shopping.com/employee/inventory/**")
                .addPathPatterns("/Shopping.com/employee/revenue/**")
                .addPathPatterns("/Shopping.com/employee/change-info/{id}.htm")
                .addPathPatterns("/Shopping.com/employee/change-pass/{id}.htm");
        registry.addInterceptor(productManagerInterceptor);
        //Admin
        registry.addInterceptor(adminInterceptor)
                .addPathPatterns("/Shopping.com/admin/register/**")
                .addPathPatterns("/Shopping.com/admin/home/**")
                .addPathPatterns("/Shopping.com/admin/department/**")
                .addPathPatterns("/Shopping.com/admin/contract/**")
                .addPathPatterns("/Shopping.com/admin/account/**")
                .addPathPatterns("/Shopping.com/admin/product/**")
                .addPathPatterns("/Shopping.com/admin/orderDetail/**")
                .addPathPatterns("/Shopping.com/admin/inventory/**")
                .addPathPatterns("/Shopping.com/admin/revenue/**");
    }
}
