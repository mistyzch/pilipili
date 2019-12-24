package com.pilipili.dao;

import com.pilipili.entity.User;
import com.pilipili.entity.Video;

/**
 * Create by misty on 2019/12/24 11:37
 */
public interface UserDao {

    /**
     * 根据账号和密码查询用户信息
     * @param account  账号
     * @param password  密码
     * @return
     */
    public User selectUserByAccountAndPwd(String account, String password);

    /**
     * 插入一条用户信息
     * @param user  封装的用户信息
     * @return
     */
    public int insertUser(User user);

    /**
     * 根据用户账号修改信息
     * @param user  用户信息
     * @param account  账号
     * @return
     */
    public int updateUserByAccount(User user,String account);

    /**
     * 根据账号寻找用户
     * @param account  账号
     * @return
     */
    public User selectUserByAccount(String account);

    /**
     * 用户发布视频
     * @param video  视频
     * @param user_id  用户id
     * @param video_id  视频id
     */
    public void insertVide(Video video,Integer user_id,Integer video_id);

    /**
     * 新增用户喜欢/点赞
     * @param video_id  视频id
     * @param user_id  用户id
     */
    public void insertUserLike(Integer video_id, Integer user_id);

    /**
     * 更新用户点赞
     * @param video_id  视频id
     * @param user_id  用户id
     * @param state  点赞状态
     */
    public void updateUserLike(Integer video_id, Integer user_id, int state);

    /**
     * 新增用户收藏
     * @param video_id  视频id
     * @param user_id  用户id
     */
    public void insertUserCollection(Integer video_id, Integer user_id);

    /**
     * 更新用户点赞状态
     * @param video_id  视频id
     * @param user_id  用户id
     * @param state  收藏状态
     */
    public void updateUserCollection(Integer video_id, Integer user_id, int state);

}
