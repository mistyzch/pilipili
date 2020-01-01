package com.pilipili.controller;

import com.pilipili.common.Interface.Impl.DoCollectionMessage;
import com.pilipili.common.Interface.Impl.DoLikeMessage;
import com.pilipili.entity.User;
import com.pilipili.service.Impl.UserServiceImpl;
import com.pilipili.service.Impl.VideoServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

/**
 * Create by misty on 2020/1/1 18:42
 */
@Controller
public class CommonController {
    @Autowired
    private UserServiceImpl userService;
    @Autowired
    private VideoServiceImpl videoService;

    @RequestMapping("register")
    public String register(){
        return "register";
    }

    @RequestMapping("login")
    public String login(){
        return "login";
    }

    @RequestMapping(value = "doregister",method = RequestMethod.POST)
    public String doRegister(User user, Model model){
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



    @RequestMapping("doLike")
    @ResponseBody
    public Map<String ,String> doLike(Integer video_id, HttpSession session){
        String message = null;
        Map<String ,String> map = new HashMap<>();
        User user = (User) session.getAttribute("user");
        if(user==null){
            map.put("msg","2");//2代表用户未登录
        }else{
            Integer likeState = userService.selectLikeStateByUidAndVid(user.getId(),video_id);//获取当前用户的点赞状态
            if(likeState==null){
                //首次点赞
                //插入点赞数据
                userService.insertUserLike(video_id,user.getId());
                message = DoLikeMessage.Success;
            }else {
                if(likeState==1){
                    //取消点赞，把状态变为0
                    userService.updateUserLike(video_id,user.getId(),0);
                    message = DoLikeMessage.Fail;
                }else {
                    //恢复点赞，把状态变为1
                    userService.updateUserLike(video_id,user.getId(),1);
                    message = DoLikeMessage.Success;
                }
            }
            String likeCount = videoService.getLikeCount(video_id).toString();
            map.put("msg",message);
            map.put("likeCount",likeCount);
        }
        return map;
    }

    @RequestMapping("doCollection")
    @ResponseBody
    public Map<String,String> doCollection(Integer video_id,HttpSession session){
        Map<String ,String> map = new HashMap<>();
        String message = null;
        User user = (User) session.getAttribute("user");
        if(user==null){
            map.put("msg","2");//2代表用户未登录
        }else{
            Integer collectionState = userService.selectCollectionStateByUidAndVid(user.getId(),video_id);
            if(collectionState==null){
                //首次点赞
                //插入点赞数据
                userService.insertUserCollection(video_id,user.getId());
                message = DoLikeMessage.Success;
            }else {
                if(collectionState==1){
                    //取消点赞，把状态变为0
                    userService.updateUserCollection(video_id,user.getId(),0);
                    message = DoCollectionMessage.Fail;
                }else {
                    //恢复点赞，把状态变为1
                    userService.updateUserCollection(video_id,user.getId(),1);
                    message = DoCollectionMessage.Success;
                }
            }
            String collectionCount = videoService.getCollectionCount(video_id).toString();
            map.put("msg",message);
            map.put("collectionCount",collectionCount);
        }
        return map;
    }

    @RequestMapping("commitComment")
    @ResponseBody
    public Map<String,Object> commitComment(String myComment,Integer video_id,HttpSession session){
        Map<String,Object> map = new HashMap<>();
        User user = (User) session.getAttribute("user");
        if(user==null){
            map.put("msg",2);
        }else{
            if(myComment==null||myComment.equals("")){
                map.put("msg",0);
            }else{
                userService.insertComment(user.getId(),video_id,myComment);
                map.put("msg",1);//1代表提交成功0代表失败
            }
            Integer commentCount = videoService.getCommentCount(video_id);
            map.put("commentCount",commentCount);
        }
        return map;
    }

    @RequestMapping("logout")
    public String logout(HttpSession session){
        if(session.getAttribute("user")!=null){
            session.removeAttribute("user");
        }
        return "redirect:login";
    }


//    @RequestMapping("search")
//    public String search(String key,Model model){
//        //返回一个视频集合
//        List<Video> searchVideos = videoService.selectVideoByKey(key,10);
//        model.addAttribute("searchVideos",searchVideos);
//        return "search";//搜索页面
//    }



}
