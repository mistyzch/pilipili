package com.pilipili.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class Video implements Serializable {
    private Integer id;
    private String name;
    private String desc;
    private String releaseDate;
    private Integer clickTimes;
    private String pictureUrls;
    private String videoUrl;
    private Date video_length;
    private Integer state;
    private Integer user_id;
    private Integer category_id;
    private Integer likeCount;
    private Integer collectionCount;
    private Integer commentCount;
    private String fileName;
    private User user;
    private Category category;
    private List<Comments> comments;
    private Integer likeState;
    private Integer collectionState;

    public Video() {
    }

    public Video(Integer id, String name, String desc, String releaseDate,
                 Integer clickTimes, String pictureUrls, String videoUrl, Integer collectionState,
                 Date video_length, Integer state, Integer user_id, Integer likeState,
                 Integer category_id, Integer likeCount, Integer collectionCount, String fileName,
                 Integer commentCount, User user, Category category, List<Comments> comments) {
        this.fileName = fileName;
        this.likeState = likeState;
        this.collectionState = collectionState;
        this.id = id;
        this.name = name;
        this.desc = desc;
        this.releaseDate = releaseDate;
        this.clickTimes = clickTimes;
        this.pictureUrls = pictureUrls;
        this.videoUrl = videoUrl;
        this.video_length = video_length;
        this.state = state;
        this.user_id = user_id;
        this.category_id = category_id;
        this.likeCount = likeCount;
        this.collectionCount = collectionCount;
        this.commentCount = commentCount;
        this.user = user;
        this.category = category;
        this.comments = comments;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public Integer getLikeState() {
        return likeState;
    }

    public void setLikeState(Integer likeState) {
        this.likeState = likeState;
    }

    public Integer getCollectionState() {
        return collectionState;
    }

    public void setCollectionState(Integer collectionState) {
        this.collectionState = collectionState;
    }

    public Date getVideo_length() {
        return video_length;
    }

    public void setVideo_length(Date video_length) {
        this.video_length = video_length;
    }

    public List<Comments> getComments() {
        return comments;
    }

    public void setComments(List<Comments> comments) {
        this.comments = comments;
    }

    public Integer getLikeCount() {
        return likeCount;
    }

    public void setLikeCount(Integer likeCount) {
        this.likeCount = likeCount;
    }

    public Integer getCollectionCount() {
        return collectionCount;
    }

    public void setCollectionCount(Integer collectionCount) {
        this.collectionCount = collectionCount;
    }

    public Integer getCommentCount() {
        return commentCount;
    }

    public void setCommentCount(Integer commentCount) {
        this.commentCount = commentCount;
    }

    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
    }

    public Integer getCategory_id() {
        return category_id;
    }

    public void setCategory_id(Integer category_id) {
        this.category_id = category_id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public String getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(String releaseDate) {
        this.releaseDate = releaseDate;
    }

    public Integer getClickTimes() {
        return clickTimes;
    }

    public void setClickTimes(Integer clickTimes) {
        this.clickTimes = clickTimes;
    }

    public String getPictureUrls() {
        return pictureUrls;
    }

    public void setPictureUrls(String pictureUrls) {
        this.pictureUrls = pictureUrls;
    }

    public String getVideoUrl() {
        return videoUrl;
    }

    public void setVideoUrl(String videoUrl) {
        this.videoUrl = videoUrl;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }
}
