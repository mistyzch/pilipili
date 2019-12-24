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
    private User user;
    private Category category;

    public Video() {
    }

    public Video(String name, String desc, Date releaseDate, Integer clickTimes, String pictureUrls, String videoUrl, Integer state, User user, Category category) {
        this.name = name;
        this.desc = desc;
        this.releaseDate = releaseDate;
        this.clickTimes = clickTimes;
        this.pictureUrls = pictureUrls;
        this.videoUrl = videoUrl;
        this.state = state;
        this.user = user;
        this.category = category;
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
