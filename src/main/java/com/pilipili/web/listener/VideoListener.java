package com.pilipili.web.listener;

import com.pilipili.entity.Video;
import com.pilipili.service.VideoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.context.ServletContextAware;

import javax.servlet.ServletContext;
import java.util.List;

/**
 * Create by misty on 2019/12/25 19:48
 */
@Controller
public class VideoListener implements ServletContextAware {

    @Autowired
    private VideoService videoService;


    @Override
    public void setServletContext(ServletContext sc) {
        //获取servletcontext对象
        //ServletContext sc = sce.getServletContext();
        List<Video> hotVideos = videoService.selectHotVideos(6);
        sc.setAttribute("hotVideos", hotVideos);
        List<Video> ghostVideos = videoService.selectVideoByCategory(1,8);//鬼畜cate_id为1，获取鬼畜的前8条记录
        sc.setAttribute("ghostVideos",ghostVideos);
        List<Video> games = videoService.selectVideoByCategory(2,8);//游戏
        sc.setAttribute("games",games);
        List<Video> films = videoService.selectVideoByCategory(3,8);//电影
        sc.setAttribute("films",films);
        List<Video> animations = videoService.selectVideoByCategory(4,8);//动画
        sc.setAttribute("animations",animations);
        List<Video> dances = videoService.selectVideoByCategory(5,8);//舞蹈
        sc.setAttribute("dances",dances);
        List<Video> extensions = videoService.selectHotVideos(6);//推广
        sc.setAttribute("extensions",extensions);
    }
}
