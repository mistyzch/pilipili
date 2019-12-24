package com.pilipili.entity;

import java.io.Serializable;
import java.util.Date;

public class Video implements Serializable {
    private Integer id;
    private String name;
    private String desc;
    private Date releaseDate;
    private Integer clickTimes;
    private String pictureUrls;
    private String videoUrl;
    private Integer state;
    private User user_id;
    private Category category_id;


    public Video() {
    }

    public Video(String name, String desc, Date releaseDate, Integer clickTimes, String pictureUrls, String videoUrl, Integer state, User user_id, Category category_id) {
        this.name = name;
        this.desc = desc;
        this.releaseDate = releaseDate;
        this.clickTimes = clickTimes;
        this.pictureUrls = pictureUrls;
        this.videoUrl = videoUrl;
        this.state = state;
        this.user_id = user_id;
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

    public Date getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(Date releaseDate) {
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

    public User getUser_id() {
        return user_id;
    }

    public void setUser_id(User user_id) {
        this.user_id = user_id;
    }

    public Category getCategory_id() {
        return category_id;
    }

    public void setCategory_id(Category category_id) {
        this.category_id = category_id;
    }
}
