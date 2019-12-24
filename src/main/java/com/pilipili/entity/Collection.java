package com.pilipili.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * @author: ABKing
 * @Date: 2019/12/24 15:42
 * @Description: 收藏
 **/
public class Collection implements Serializable {
    private Integer id;
    private Date date;
    private String state;
    private User user;
    private Video video;

    public Collection() {
    }

    public Collection(Date date, String state, User user, Video video) {
        this.date = date;
        this.state = state;
        this.user = user;
        this.video = video;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Video getVideo() {
        return video;
    }

    public void setVideo(Video video) {
        this.video = video;
    }
}
