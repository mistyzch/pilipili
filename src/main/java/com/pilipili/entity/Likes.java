package com.pilipili.entity;
/**
 * @author: ABKing
 * @Date: 2019/12/24 17:17
 * @Description: 用户点赞
 **/
import java.io.Serializable;
import java.util.Date;


public class Likes implements Serializable {
    private Integer id;
    private Date date;
    private String state;
    private User user;
    private Video video;

    public Likes() {
    }

    public Likes(Date date, String state, User user, Video video) {
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
