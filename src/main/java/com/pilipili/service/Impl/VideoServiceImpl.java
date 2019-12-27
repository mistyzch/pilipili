package com.pilipili.service.Impl;

import com.pilipili.entity.Video;
import com.pilipili.service.VideoService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Create by misty on 2019/12/25 20:00
 */
@Service
public class VideoServiceImpl implements VideoService {
    @Override
    public List<Video> selectVideosByClickTimes(int num, Integer user_id) {
        return null;
    }

    @Override
    public List<Video> selectVideosByCategoryId(int num, Integer category_id) {
        return null;
    }

    @Override
    public void updateVideoClickTimes(Integer video_id, Integer addClickTimes) {

    }

    @Override
    public List<Video> selectVideosByUserId(Integer user_id) {
        return null;
    }

    @Override
    public List<Video> selectLikeVideosByUserId(Integer user_id) {
        return null;
    }

    @Override
    public void deleteVideoById(Integer video_id) {

    }

    @Override
    public List<Video> selectHotVides(Integer num) {
        return null;
    }

    @Override
    public Video selectVideoById(Integer id) {
        return null;
    }
}
