package com.pilipili.web.interceptor;

import com.pilipili.entity.User;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Create by misty on 2019/12/27 14:43
 */
public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String uri = request.getRequestURI();
        User user = (User) request.getSession().getAttribute("user");
        if(uri.endsWith("login")){
            if(user==null){
                return true;
            }
            response.sendRedirect("");
            return false;
        }else {
            if(user==null){
                response.sendRedirect("../login");
                return false;
            }
            return true;
        }
    }
}
