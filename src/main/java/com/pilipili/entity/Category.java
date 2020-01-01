package com.pilipili.entity;
/**
 * @author: ABKing
 * @Date: 2019/12/24 15:42
 * @Description: 导航目录
 **/
import java.io.Serializable;

public class Category implements Serializable {
    private Integer id;
    private String name;
    private String description;
    private Integer parent_id;
    private String englishName;

    public Category() {
    }

    public Category(String name, String description, Integer parent_id,String englishName) {
        this.name = name;
        this.description = description;
        this.parent_id = parent_id;
        this.englishName = englishName;
    }

    public String getEnglishName() {
        return englishName;
    }

    public void setEnglishName(String englishName) {
        this.englishName = englishName;
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getParent_id() {
        return parent_id;
    }

    public void setParent_id(Integer parent_id) {
        this.parent_id = parent_id;
    }
}
