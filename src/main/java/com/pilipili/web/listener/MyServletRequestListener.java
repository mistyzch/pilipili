package com.pilipili.web.listener;

import com.pilipili.common.util.SessionUtil;
import com.pilipili.entity.Client;

import javax.servlet.ServletRequestEvent;
import javax.servlet.ServletRequestListener;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

/**
 * Create by misty on 2020/1/1 19:49
 */
@WebListener
public class MyServletRequestListener implements ServletRequestListener {
    //用户集合
    private ArrayList<Client> clientList;
    @Override
    public void requestDestroyed(ServletRequestEvent arg0) {

    }

    @SuppressWarnings("unchecked")
    @Override
    public void requestInitialized(ServletRequestEvent arg0) {
        //从servletContext中获的userList
        clientList=(ArrayList<Client>) arg0.getServletContext().getAttribute("clientList");
        //如果servletContext中没有userList对象  初始化userList
        if(clientList==null){
            clientList=new ArrayList<Client>();
        }
        HttpServletRequest request=(HttpServletRequest) arg0.getServletRequest();

        //sessionId
        String sessionId=request.getSession().getId();
        //如果当前sessionId不存在集合中  创建当前user对象
        if(SessionUtil.getUserBySessionId(clientList,sessionId)==null){
            Client client=new Client();
            client.setSessionId(sessionId);
            client.setIp(request.getRemoteAddr());
            SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:MM:ss");
            client.setFirstTime(sdf.format(new Date()));
            clientList.add(client);
        }
        //将userList集合 保存到ServletContext
        arg0.getServletContext().setAttribute("clientList", clientList);
    }
}

