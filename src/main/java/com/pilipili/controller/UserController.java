package com.pilipili.controller;

import com.pilipili.entity.User;
import com.pilipili.entity.Video;
import com.pilipili.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;
import java.util.List;

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

    @RequestMapping("logout")
    public String logout(HttpSession session){
        if(session.getAttribute("user")!=null){
            session.removeAttribute("user");
        }
        return "redirect:login";
    }

    @RequestMapping("userinfo")
    public String userInfo(){

        return "";//个人信息页面
    }

    @RequestMapping("search")
    public String search(String key,Model model){
        //返回一个视频集合
        List<Video> videos = null;
        model.addAttribute("videos",videos);
        return "search";//搜索页面
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
        if(user.getAccount()!=null
                &&user.getPassword()!=null
                &&user.getTel()!=null
                &&user.getTel()!=""
                &&user.getAccount()!=""
                &&user.getPassword()!=""){
            User user1 = userService.selectUserByAccount(user.getAccount());
            if(user1!=null){
                //提示该用户已存在
                return "redirect:register";
            }else {
                userService.insertUser(user);
                return "redirect:login";
            }
        }else{
            //提示信息未填写全
            return "redirect:register";
        }
    }

}
