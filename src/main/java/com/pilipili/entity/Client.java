package com.pilipili.entity;

/**
 * Create by misty on 2020/1/1 19:46
 */
public class Client {
    //当前用户的session id
    private String sessionId;
    //当前用户的ip地址
    private String ip;
    //当前用户第一次访问的时间
    private String firstTime;
    public Client() {
        super();

    }
    public String getIp() {
        return ip;
    }
    public void setIp(String ip) {
        this.ip = ip;
    }
    public String getFirstTime() {
        return firstTime;
    }
    public void setFirstTime(String firstTime) {
        this.firstTime = firstTime;
    }
    public String getSessionId() {
        return sessionId;
    }
    public void setSessionId(String sessionId) {
        this.sessionId = sessionId;
    }
}
