package com.pilipili.controller;

import com.pilipili.common.util.MD5;
import com.pilipili.common.util.SaveVideoAndPic;
import com.pilipili.entity.User;
import com.pilipili.entity.Video;
import com.pilipili.service.UserService;
import com.pilipili.service.VideoService;
import org.apache.commons.fileupload.util.Streams;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.ParseException;
import java.util.Date;
import java.util.Map;

/**
 * Create by misty on 2019/12/25 17:38
 */
@Controller
@RequestMapping("user")
public class UserController {
    @Autowired
    private UserService userService;

    @Autowired
    private VideoService videoService;







    @RequestMapping("userinfo")
    public String userInfo(){

        return "myInfo";//个人信息页面
    }

    //==========
    @RequestMapping("upload")
    public String upload(){
        return "upload";
    }

    @PostMapping("doUpload")
    public String doUpload(HttpSession session, HttpServletRequest request, @RequestParam("video") MultipartFile file) throws IOException, ParseException {
        Logger logger = LoggerFactory.getLogger(UserController.class);
        Map<String, String> map = SaveVideoAndPic.saveVideo(request, file);
        String path = map.get("path");
        String filename = map.get("filename");
        String categroyType = map.get("categroyType");
        String title = map.get("title");
        String desc = map.get("desc");
        String pictureUrls = SaveVideoAndPic.SavePic(map);//图片路径
        Date strDate = SaveVideoAndPic.getVideoLength(map);//视频时长

        Video media = new Video();
        media.setName(title);
        media.setDesc(desc);
        media.setPictureUrls(pictureUrls);
        media.setVideo_length(strDate);
        media.setVideoUrl(path.split("source")[1] + filename);
        media.setFileName(filename);

        User user = (User) session.getAttribute("user");
        userService.insertVideo(media, user.getId(), categroyType);
        return "upload";
    }

    @RequestMapping("myInfo")
    public String myInfo(){
        return "myInfo";
    }

    @PostMapping("changeInfo")
    public String changeInfo(HttpSession session, String name, String gender, String password){
        User user = (User) session.getAttribute("user");
        if(!name.equals("")){
            user.setAccount(name);
        }
        if(!gender.equals("")){
            int flag = 2;
            if(gender.equals("woman")) flag = 0;
            if(gender.equals("man")) flag = 1;
            if(gender.equals("secret")) flag = 2;
            user.setGender(flag);
        }
        if(!password.equals("")) {
            user.setPassword(MD5.getMD5Str(password));
            userService.updateUserById(user, user.getId());
            session.removeAttribute("user");
            return "redirect:login";
        }
        userService.updateUserById(user, user.getId());
        return "myInfo";

    }
    @RequestMapping("myPhoto")
    public String myPhoto(){
        return "myPhoto";
    }


    @PostMapping("changePhoto")
    public String changePhoto(HttpSession session, HttpServletRequest request, @RequestParam("file") MultipartFile file) throws IOException {
        String tempFilename = file.getOriginalFilename();// 获得文件名
        String[] f = tempFilename.split("\\.");
        //String src_path = request.getServletContext().getRealPath("/");
        //String disk = src_path.substring(0, src_path.indexOf(":") + 1);//获取盘符
        //String path = disk + "/source/images/portrait/";
        String path = "E:/source/images/portrait/";
        String filename = f[0] + "-" + new Date().getTime() + "." + f[f.length - 1];
        Streams.copy(file.getInputStream(),new FileOutputStream(path + filename),true);

        User user = (User) session.getAttribute("user");
        user.setPortraitUrl("/imgs/portrait/" + filename);
        userService.updateUserById(user, user.getId());
        return "myPhoto";
    }




}
