package com.pilipili.dao;

import com.pilipili.entity.Category;
import com.pilipili.entity.User;
import com.pilipili.entity.Video;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Before;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.Date;

/**
 * @author: ABKing
 * @Date: 2019/12/25 13:49
 * @Description:
 **/
public class TestUserDao {
    private UserDao userDao;
    private Logger logger = LoggerFactory.getLogger(TestUserDao.class);
    @Before
    public void getUserDao(){
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
        SqlSessionFactory sqlSessionFactory = (SqlSessionFactory) applicationContext.getBean("sqlSessionFactory");
        SqlSession sqlSession = sqlSessionFactory.openSession();
        userDao = sqlSession.getMapper(UserDao.class);
    }

    @Test
    public void testSelectUserByAccountAndPwd(){
        User user = userDao.selectUserByAccountAndPwd("张三", "12345");
        System.out.println(user);
    }
    @Test
    public void testInsertUser(){
        User user = new User("李四", "123456", 1, 20, "15070222444", "C:\\abc\\a.jpg");
        int result = userDao.insertUser(user);
        logger.info("插入 " + result + " 行！");
    }
    @Test
    public void testUpdateUserByAccount(){
        User user = userDao.selectUserByAccount("张三");
        user.setPassword("111111111");
        int result = userDao.updateUserByAccount(user, "1");
        System.out.println("更新 " + result + " 行！");
    }
    @Test
    public void testSelectUserByAccount(){
        User user = userDao.selectUserByAccount("张三");
        System.out.println(user);
    }
    @Test
    public void testInsertVideo(){
        User user = userDao.selectUserByAccount("张三");
        Category category = new Category();
        Video video = new Video("叶问4：完结篇", "", new Date(), 0, "", "", 1, user,category);
        userDao.insertVideo(video, 1, 1);
    }
    @Test
    public void testInsertUserLike(){
        userDao.insertUserLike(1, 1);
    }
    @Test
    public void testUpdateUserLike(){
        userDao.updateUserLike(1, 1, 11);
    }
    @Test
    public void testInsertUserCollection(){
        userDao.insertUserCollection(2, 2);
    }
    @Test
    public void testUpdateUserCollection(){
        userDao.updateUserCollection(2, 2, 11);
    }
    @Test
    public void testInsertComment(){
        userDao.insertComment(2,2, "这是我的第一条评论！");
    }
    @Test
    public void testAddComment(){
        userDao.addComment(2, 2, "我回复了你的评论", 64);
    }

}
