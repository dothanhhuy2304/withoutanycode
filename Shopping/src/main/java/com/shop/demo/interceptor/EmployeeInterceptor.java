package com.shop.demo.interceptor;

import com.shop.demo.model.Employee;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Component
public class EmployeeInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        Employee employee = (Employee) request.getSession().getAttribute("employee");
        if (employee == null) {
            response.sendRedirect(request.getContextPath() + "/Shopping.com/employee/login");
            System.out.println("PreHandler mothod employee is sleep :))");
            return false;
        }
        System.out.println("PreHandle method employee is Calling");
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
