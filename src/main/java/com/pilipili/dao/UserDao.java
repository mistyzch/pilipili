package com.pilipili.dao;

import com.pilipili.entity.User;
import com.pilipili.entity.Video;
import com.pilipili.entity.VideoUpload;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

/**
 * Create by misty on 2019/12/24 11:37
 */
@Component
public interface UserDao {
    /**
     * 根据账号和密码查询用户信息
     * @param account  账号
     * @param password  密码
     * @return
     */
    public User selectUserByAccountAndPwd(@Param("account") String account, @Param("password") String password);

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
    public int updateUserByAccount(@Param("user") User user,@Param("account") String account);

    /**
     * 根据账号寻找用户
     * @param account  账号
     * @return
     */
    public User selectUserByAccount(@Param("account") String account);

    /**
     * 根据用户id和视频id获取点赞状态
     * @param user_id
     * @param video_id
     * @return
     */
    public Integer selectLikeStateByUidAndVid(@Param("user_id") Integer user_id,@Param("video_id") Integer video_id);

    /**
     * 根据用户id和视频id获取收藏状态
     * @param user_id
     * @param video_id
     * @return
     */
    public Integer selectCollectionStateByUidAndVid(@Param("user_id") Integer user_id,@Param("video_id") Integer video_id);

    /**
     * 用户发布视频
     * @param video  视频
     * @param user_id  用户id
     * @param category_id  视频id
     */
    public void insertVideo(@Param("video") Video video,@Param("user_id") Integer user_id,@Param("category_id") Integer category_id);

    /**
     * 新增用户喜欢/点赞
     * @param video_id  视频id
     * @param user_id  用户id
     */
    public void insertUserLike(@Param("video_id") Integer video_id, @Param("user_id") Integer user_id);

    /**
     * 更新用户点赞
     * @param video_id  视频id
     * @param user_id  用户id
     * @param state  点赞状态
     */
    public void updateUserLike(@Param("video_id") Integer video_id, @Param("user_id") Integer user_id, @Param("state") int state);

    /**
     * 新增用户收藏
     * @param video_id  视频id
     * @param user_id  用户id
     */
    public void insertUserCollection(@Param("video_id") Integer video_id, @Param("user_id") Integer user_id);

    /**
     * 更新用户点赞状态
     * @param video_id  视频id
     * @param user_id  用户id
     * @param state  收藏状态
     */
    public void updateUserCollection(@Param("video_id") Integer video_id, @Param("user_id") Integer user_id, @Param("state") int state);

    /**
     * 用户给视频添加评论
     * @param user_id  用户id
     * @param video_id 视频id
     * @param comment  评论
     */
    public void insertComment(@Param("user_id") Integer user_id, @Param("video_id") Integer video_id, @Param("comment") String comment);

    /**
     * 回复评论
     * @param user_id  用户id
     * @param video_id  视频id
     * @param comment  评论
     * @param parent_id  要回复评论的id
     */
    public void addComment(@Param("user_id") Integer user_id, @Param("video_id") Integer video_id, @Param("comment") String comment, @Param("parent_id") Integer parent_id);

    /**
     * 根据用户id查询用户信息
     * @param user_id
     * @return
     */
    public User selectUserById(@Param("user_id") Integer user_id);


    /**
     * 用户发布视频（写入上传表中）
     */
    public void insertVideoUpload(@Param("videoUpload") VideoUpload videoUpload);


    /**
     * 根据用户id修改信息
     * @param user  用户信息
     * @param id  账号
     * @return
     */
    public int updateUserById(@Param("user") User user,@Param("id") Integer id);



}
