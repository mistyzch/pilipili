package com.pilipili.entity;
/**
 * @author: ABKing
 * @Date: 2019/12/24 15:42
 * @Description: 收藏
 **/
import java.io.Serializable;


public class User implements Serializable {
    private Integer id;
    private String account;
    private String password;
    private Integer gender;
    private Integer age;
    private String tel;
    private String portraitUrl;


    public User() {
    }

    public User(String account, String password, Integer gender, Integer age, String tel, String portraitUrl) {
        this.account = account;
        this.password = password;
        this.gender = gender;
        this.age = age;
        this.tel = tel;
        this.portraitUrl = portraitUrl;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getGender() {
        return gender;
    }

    public void setGender(Integer gender) {
        this.gender = gender;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getPortraitUrl() {
        return portraitUrl;
    }

    public void setPortraitUrl(String portraitUrl) {
        this.portraitUrl = portraitUrl;
    }
}
