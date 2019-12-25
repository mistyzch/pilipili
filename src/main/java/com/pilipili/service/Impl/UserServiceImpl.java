package com.pilipili.service.Impl;

import com.pilipili.entity.User;
import com.pilipili.entity.Video;
import com.pilipili.service.UserService;
import org.springframework.stereotype.Service;

/**
 * Create by misty on 2019/12/25 23:27
 */
@Service
public class UserServiceImpl implements UserService {

    @Override
    public User selectUserByAccountAndPwd(String account, String password) {
        return null;
    }

    @Override
    public int insertUser(User user) {
        return 0;
    }

    @Override
    public int updateUserByAccount(User user, String account) {
        return 0;
    }

    @Override
    public User selectUserByAccount(String account) {
        return null;
    }

    @Override
    public void insertVideo(Video video, Integer user_id, Integer video_id) {

    }

    @Override
    public void insertUserLike(Integer video_id, Integer user_id) {

    }

    @Override
    public void updateUserLike(Integer video_id, Integer user_id, int state) {

    }

    @Override
    public void insertUserCollection(Integer video_id, Integer user_id) {

    }

    @Override
    public void updateUserCollection(Integer video_id, Integer user_id, int state) {

    }

    @Override
    public void insertComment(Integer user_id, Integer video_id, String comment) {

    }

    @Override
    public void addComment(Integer user_id, Integer video_id, String comment, Integer parent_id) {

    }
}
