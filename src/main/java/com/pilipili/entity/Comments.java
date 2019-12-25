package com.pilipili.entity;
/**
 * @author: ABKing
 * @Date: 2019/12/24 17:15
 * @Description: 评论
 **/
import java.io.Serializable;
import java.util.Date;


public class Comments implements Serializable {
    private Integer id;
    private User user;
    private Video video;
    private Date commentDate;
    private String comment;
    private Integer parentId;

    public Comments() {
    }

    public Comments(User user, Video video, Date commentDate, String comment, Integer parentId) {
        this.user = user;
        this.video = video;
        this.commentDate = commentDate;
        this.comment = comment;
        this.parentId = parentId;
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

    public Date getCommentDate() {
        return commentDate;
    }

    public void setCommentDate(Date commentDate) {
        this.commentDate = commentDate;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }
}
