package com.imooc.service;

import com.imooc.bean.Command;
import com.imooc.bean.CommandContent;
import com.imooc.bean.Message;
import com.imooc.dao.CommandDao;
import com.imooc.dao.MessageDao;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

/**
 * Created by xuhf on 2017/11/14.
 */
public class MessageService {

    public List<Message> find(String command, String desc) {
        MessageDao dao = new MessageDao();
        List<Message> messages = dao.find(command, desc);
        return messages;
    }

    public void deleteOne(String id) {
        if (id != null && !"".equals(id)) {
            MessageDao dao = new MessageDao();
            dao.deleteOne(Integer.valueOf(id));
        }
    }

    public void deleteBatch(String[] ids) {
        if (ids != null && ids.length != 0) {
            List<Integer> idList = new ArrayList<Integer>();
            for (String id : ids) {
                idList.add(Integer.valueOf(id));
            }
            MessageDao dao = new MessageDao();
            dao.deleteBatch(idList);
        }
    }

    public void add(Message message) {
        if (message != null) {
            MessageDao dao = new MessageDao();
            dao.add(message);
        }
    }

    public String findContent(String command, String desc) {
        CommandDao dao = new CommandDao();
        if (command != null && "帮助".equals(command)) {
            List<Command> commands = dao.find(null, null);
            StringBuffer sb = new StringBuffer();
            for (Command m : commands) {
                sb.append("回复【" + m.getCommand() + "】，即可查看" + m.getDescription()).append("<br>");
            }
            return sb.toString();
        } else {
            List<Command> commands = dao.find(command, desc);
            if (commands == null || commands.size() == 0) {
                return "啥也没找到";
            }
            List<CommandContent> contents = commands.get(0).getContents();
            int random = new Random().nextInt(contents.size());
            return contents.get(random).getContent();
        }
    }

}
