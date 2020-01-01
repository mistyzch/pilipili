package com.pilipili.service;

import com.pilipili.entity.Comments;
import com.pilipili.entity.Video;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Create by misty on 2019/12/25 13:06
 */
public interface VideoService {
    /**
     * 找出当前用户点击最高的前num个视频
     * @param num  视频个数
     * @param user_id  用户id
     * @return
     */
    public List<Video> selectVideosByClickTimes(int num, Integer user_id);

    /**
     * 找出每个栏目下点击次数前num个
     * @param num  个数
     * @param category_id  栏目id
     * @return
     */
    public List<Video> selectVideosByCategoryId(int num,Integer category_id);

    /**
     * 视频点赞量加一
     * @param video_id
     * @param addClickTimes
     */
    public void updateVideoClickTimes(Integer video_id, Integer addClickTimes);

    /**
     * 查询用户发表的额视频
     * @param user_id  用户id
     * @return
     */
    public List<Video> selectVideosByUserId(Integer user_id);

    /**
     * 查询用户点赞的所有视频,按时间倒序排序
     * @param user_id  用户id
     * @return
     */
    public List<Video> selectLikeVideosByUserId(Integer user_id);

    /**
     * 根据视频id删除视频
     * @param video_id  视频id
     */
    public void deleteVideoById(Integer video_id);

    /**
     * 获取热度前num的视频信息
     * @param num
     */
    public List<Video> selectHotVideos(Integer num);

    /**
     * 根据视频id获取视频
     * @param id
     * @return
     */
    public Video selectVideoById(Integer id);

    /**
     * 根据栏目（类型）查视频
     * @param category_id
     * @param num 要查的数量
     * @return
     */
    public List<Video> selectVideoByCategory(Integer category_id,Integer num);


    /**
     * 获取该视频点赞人数
     * @param video_id
     * @return
     */
    public Integer getLikeCount(Integer video_id);

    /**
     * 获取该视频收藏人数
     * @param video_id
     * @return
     */
    public Integer getCollectionCount(Integer video_id);

    /**
     * 根据key模糊查询
     * @param key
     * @param num
     * @return
     */
    public List<Video> selectVideoByKey(String key, Integer num);


    /**
     * 获取该视频的评论数
     * @param video_id
     * @return
     */
    public Integer getCommentCount(@Param("video_id") Integer video_id);

    /**
     * 获取该视频的评论
     * @param video_id
     * @return
     */
    public List<Comments> selectVideoCommentsByVideoId(@Param("video_id") Integer video_id);

}
