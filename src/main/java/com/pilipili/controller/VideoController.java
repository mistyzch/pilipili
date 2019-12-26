package com.pilipili.controller;

import com.pilipili.entity.Video;
import com.pilipili.service.Impl.VideoServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Create by misty on 2019/12/25 22:58
 */
@Controller
@RequestMapping("video")
public class VideoController {

    @Autowired
    private VideoServiceImpl videoService;

    @RequestMapping("watchvideo")
    public String watchVideo(Integer id, Model model){
        Video video = videoService.selectVideoById(id);
        model.addAttribute("video",video);
        return "watchvideo";
    }


}
