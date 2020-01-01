package com.pilipili.service.Impl;

import com.pilipili.common.util.MD5;
import com.pilipili.dao.UserDao;
import com.pilipili.dao.VideoDao;
import com.pilipili.entity.Category;
import com.pilipili.entity.User;
import com.pilipili.entity.Video;
import com.pilipili.entity.VideoUpload;
import com.pilipili.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * Create by misty on 2019/12/25 23:27
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Autowired
    private VideoDao videoDao;

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
        userDao.insertUserLike(video_id,user_id);
    }

    @Override
    public void updateUserLike(Integer video_id, Integer user_id, int state) {
        userDao.updateUserLike(video_id,user_id,state);
    }

    @Override
    public void insertUserCollection(Integer video_id, Integer user_id) {
        userDao.insertUserCollection(video_id,user_id);
    }

    @Override
    public void updateUserCollection(Integer video_id, Integer user_id, int state) {
        userDao.updateUserCollection(video_id,user_id,state);
    }

    @Override
    public void insertComment(Integer user_id, Integer video_id, String comment) {
        userDao.insertComment(user_id,video_id,comment);
    }

    @Override
    public void addComment(Integer user_id, Integer video_id, String comment, Integer parent_id) {

    }

    @Override
    public Integer selectLikeStateByUidAndVid(Integer user_id, Integer video_id) {
        return userDao.selectLikeStateByUidAndVid(user_id,video_id);
    }

    @Override
    public Integer selectCollectionStateByUidAndVid(Integer user_id, Integer video_id) {
        return userDao.selectCollectionStateByUidAndVid(user_id,video_id);
    }

    @Override
    public User selectUserById(Integer user_id) {
        return userDao.selectUserById(user_id);
    }



    @Override
    public void insertVideo(Video video, Integer user_id, String category_name) {
        Category category = videoDao.selectCategoryByCategoryName(category_name);
        Integer category_id = category.getId();
        userDao.insertVideo(video, user_id, category_id);//插入video表中
        User user = userDao.selectUserById(user_id);
        List<Video> videoList = videoDao.selectVideosByUserId(user_id);
        VideoUpload videoUpload = new VideoUpload(user, videoList.get(videoList.size()-1), new Date());
        userDao.insertVideoUpload(videoUpload);//插入video_upload表中

    }

    @Override
    public int updateUserById(User user, Integer id) {
        int result = userDao.updateUserById(user, id);
        return result;
    }


}
