package com.pilipili.controller;

import com.pilipili.entity.User;
import com.pilipili.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
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
    @Autowired
    private UserService userService;

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
        if(user.getAccount()!=null
                &&user.getPassword()!=null
                &&user.getAccount()!=""
                &&user.getPassword()!=""){
            User user1 = userService.selectUserByAccountAndPwd(user.getAccount(),user.getPassword());
            if(user1!=null){
                session.setAttribute("user",user1);
                return "redirect:/";
            }else {
                return "redirect:login";
            }
        }else {
            return "redirect:login";
        }
    }

    @RequestMapping(value = "doregister",method = RequestMethod.POST)
    public String doRegister(User user,Model model){
        return "redirect:login";
    }

}
