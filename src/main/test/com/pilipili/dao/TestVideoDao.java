package com.pilipili.dao;

import com.pilipili.entity.Video;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Before;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

/**
 * @author: ABKing
 * @Date: 2019/12/26 14:10
 * @Description:
 **/
public class TestVideoDao {
    private VideoDao videoDao;
    private Logger logger = LoggerFactory.getLogger(TestUserDao.class);
    @Before
    public void getUserDao(){
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
        SqlSessionFactory sqlSessionFactory = (SqlSessionFactory) applicationContext.getBean("sqlSessionFactory");
        SqlSession sqlSession = sqlSessionFactory.openSession();
        videoDao = sqlSession.getMapper(VideoDao.class);
    }
    @Test
    public void testSelectVideosByClickTimes(){
        List<Video> videoList = videoDao.selectVideosByClickTimes(2, 1);
        for (Video video : videoList) {
            System.out.println(video);
        }
    }
    @Test
    public void testSelectVideosByCategoryId(){
        List<Video> videoList = videoDao.selectVideosByCategoryId(2, 1);
        for (Video video : videoList) {
            System.out.println(video);
        }
    }
    @Test
    public void testUpdateVideoClickTimes(){
        videoDao.updateVideoClickTimes(3, 1);
    }
    @Test
    public void testSelectVideosByUserId(){
        List<Video> videoList = videoDao.selectVideosByUserId(1);
        for (Video video : videoList) {
            System.out.println(video);
        }
    }
    @Test
    public void testSelectLikeVideosByUserId(){
        List<Video> videoList = videoDao.selectLikeVideosByUserId(1);
        for (Video video : videoList) {
            System.out.println(video);
        }
    }
    @Test
    public void testDeleteVideoById(){
        videoDao.deleteVideoById(3);
    }
    @Test
    public void testSelectHotVides(){
        List<Video> videoList = videoDao.selectHotVides(10);
        for (Video video : videoList) {
            System.out.println(video);
        }
    }
}
