package com.pilipili.common.util;

import com.pilipili.entity.Client;

import java.util.ArrayList;

/**
 * Create by misty on 2020/1/1 19:45
 */
public class SessionUtil {
    //根据sessionId判断当前用户是否存在在集合中  如果存在 返回当前用户  否则返回null
    public static Client getUserBySessionId(ArrayList<Client> clientList, String sessionId) {
        for (Client client : clientList) {
            if(sessionId.equals(client.getSessionId())){
                return client;
            }
        }
        return null;
    }
}
