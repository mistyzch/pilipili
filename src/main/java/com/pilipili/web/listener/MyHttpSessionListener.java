package com.pilipili.web.listener;

import com.pilipili.common.util.SessionUtil;
import com.pilipili.entity.Client;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import java.util.ArrayList;

/**
 * Create by misty on 2020/1/1 19:44
 */
@WebListener
public class MyHttpSessionListener implements HttpSessionListener {
    //当前用户数
    private int userCounts=0;
    @Override
    public void sessionCreated(HttpSessionEvent se) {
        //sessionCreated  用户数+1
        userCounts++;
        //重新在servletContext中保存userCounts
        se.getSession().getServletContext().setAttribute("userCounts", userCounts);

        System.out.println(userCounts);

    }
    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        //sessionDestroyed  用户数-1
        userCounts--;
        //重新在servletContext中保存userCounts
        se.getSession().getServletContext().setAttribute("userCounts", userCounts);

        @SuppressWarnings("unchecked")
        ArrayList<Client> clientList=(ArrayList<Client>) se.getSession().getServletContext().getAttribute("clientList");
        String sessionId=se.getSession().getId();
        //如果当前用户在userList中  在session销毁时  将当前用户移出userList
        if(SessionUtil.getUserBySessionId(clientList, sessionId)!=null){
            clientList.remove(SessionUtil.getUserBySessionId(clientList, sessionId));
        }
        //将userList集合  重新保存到servletContext
        se.getSession().getServletContext().setAttribute("clientList", clientList);
    }

}
