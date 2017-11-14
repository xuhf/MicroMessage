package com.imooc.service;

import com.imooc.bean.Message;
import com.imooc.dao.MessageDao;

import java.util.List;

/**
 * Created by xuhf on 2017/11/14.
 */
public class MessageService {

    public List<Message> find(String command , String desc) {
        MessageDao dao = new MessageDao();
        List<Message> messages = dao.find(command,desc);
        return messages;
    }

    public void deleteOne(String id) {
        if (id != null && !"".equals(id)) {
            MessageDao dao = new MessageDao();
            dao.deleteOne(Integer.valueOf(id));
        }
    }

}
