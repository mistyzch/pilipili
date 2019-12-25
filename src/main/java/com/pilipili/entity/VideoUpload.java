package com.pilipili.entity;
/**
 * @author: ABKing
 * @Date: 2019/12/24 17:19
 * @Description: 用户上传视频
 **/
import java.io.Serializable;
import java.util.Date;


public class VideoUpload implements Serializable {
    private Integer id;
    private User user;
    private Video video;
    private Date uploadDate;

    public VideoUpload() {
    }

    public VideoUpload(User user, Video video, Date uploadDate) {
        this.user = user;
        this.video = video;
        this.uploadDate = uploadDate;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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

    public Date getUploadDate() {
        return uploadDate;
    }

    public void setUploadDate(Date uploadDate) {
        this.uploadDate = uploadDate;
    }
}
