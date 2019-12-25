package com.pilipili.controller;

import com.pilipili.entity.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;

/**
 * Create by misty on 2019/12/25 17:38
 */
@Controller
@RequestMapping("user")
public class UserController {

    @RequestMapping("login")
    public String login(){
        return "login";
    }

    @RequestMapping("register")
    public String register(){
        return "register";
    }

    @RequestMapping(value = "checkuser",method = RequestMethod.POST)
    public String checkUser(User user, Model model, HttpSession session){
        if(user!=null){
            System.out.println(user.getPassword());
        }
        return "redirect:/";
    }

    @RequestMapping(value = "doregister",method = RequestMethod.POST)
    public String doRegister(User user,Model model){
        return "redirect:login";
    }

}
