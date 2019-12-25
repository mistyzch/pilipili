package com.pilipili.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Create by misty on 2019/12/25 22:58
 */
@Controller
@RequestMapping("video")
public class VideoController {

    @RequestMapping("watchvideo")
    public String watchVideo(){
        return "watchvideo";
    }


}
