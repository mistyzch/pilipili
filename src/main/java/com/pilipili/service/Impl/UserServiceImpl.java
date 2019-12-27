package com.pilipili.service.Impl;

import com.pilipili.common.util.MD5;
import com.pilipili.dao.UserDao;
import com.pilipili.entity.User;
import com.pilipili.entity.Video;
import com.pilipili.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Create by misty on 2019/12/25 23:27
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Override
    public User selectUserByAccountAndPwd(String account, String password) {
        password = MD5.getMD5Str(password);
        return userDao.selectUserByAccountAndPwd(account,password);
    }

    @Override
    public int insertUser(User user) {
        user.setPassword(MD5.getMD5Str(user.getPassword()));
        user.setPortraitUrl("static/images/akari.jpg");
        user.setAge(12);
        user.setGender(0);
        int state = userDao.insertUser(user);
        return state;
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
