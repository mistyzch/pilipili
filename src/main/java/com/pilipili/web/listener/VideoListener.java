package com.pilipili.web.listener;

import com.pilipili.entity.Video;
import com.pilipili.service.Impl.VideoServiceImpl;
import com.pilipili.service.VideoService;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.util.List;

/**
 * Create by misty on 2019/12/25 19:48
 */

public class VideoListener implements ServletContextListener, ApplicationContextAware {

    @Autowired
    private VideoService videoService = new VideoServiceImpl();
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        //获取servletcontext对象
        ServletContext sc = sce.getServletContext();
        List<Video> hotVideos = videoService.selectHotVides(6);
        sc.setAttribute("hotVideos", hotVideos);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {

    }

    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {

    }
}
