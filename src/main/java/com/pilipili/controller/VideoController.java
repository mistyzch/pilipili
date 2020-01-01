package com.pilipili.controller;

import com.pilipili.entity.Comments;
import com.pilipili.entity.User;
import com.pilipili.entity.Video;
import com.pilipili.service.Impl.UserServiceImpl;
import com.pilipili.service.Impl.VideoServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Create by misty on 2019/12/25 22:58
 */
@Controller
@RequestMapping("video")
public class VideoController {

    @Autowired
    private VideoServiceImpl videoService;
    @Autowired
    private UserServiceImpl userService;

    @RequestMapping("watchvideo")
    public String watchVideo(Integer id, Model model,HttpSession session){
        videoService.updateVideoClickTimes(id,1);//点击量加-
        Video video = videoService.selectVideoById(id);
        //User user = userService.selectUserById(video.getUser_id());//视频作者信息
        //video.setUser(user);
        User user = (User) session.getAttribute("user");
        if(user!=null){
            Integer collectionState = userService.selectCollectionStateByUidAndVid(user.getId(),id);
            Integer likeState = userService.selectLikeStateByUidAndVid(user.getId(),id);//获取当前用户的点赞状态
            video.setLikeState(likeState);
            video.setCollectionState(collectionState);
        }
        Integer likeCount = videoService.getLikeCount(id);
        Integer collectionCount = videoService.getCollectionCount(id);
        Integer commentCount = videoService.getCommentCount(id);
        List<Comments> comments = videoService.selectVideoCommentsByVideoId(id);
        video.setLikeCount(likeCount);
        video.setCollectionCount(collectionCount);
        video.setCommentCount(commentCount);
        video.setComments(comments);
        List<Video> recommendVideos = videoService.selectVideosByCategoryId(6,video.getCategory_id());
        System.out.println(recommendVideos.get(0).getId());
        model.addAttribute("video",video);
        model.addAttribute("recommendVideos",recommendVideos);//推荐
        return "watchvideo";
    }

    @RequestMapping("search")
    public String search(String key,Model model){
        //返回一个视频集合
        List<Video> searchVideos = videoService.selectVideoByKey(key,10);
        model.addAttribute("searchVideos",searchVideos);
        return "search";//搜索页面
    }


}
