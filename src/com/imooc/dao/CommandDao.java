package com.imooc.dao;

import com.imooc.bean.Command;
import com.imooc.bean.Message;
import com.imooc.db.DBAccess;
import org.apache.ibatis.session.SqlSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by xuhf on 2017/11/15.
 */
public class CommandDao {

    public List<Command> find(String command, String desc) {
        List<Command> commands = new ArrayList<Command>();
        DBAccess dbAccess = new DBAccess();
        SqlSession sqlSession = null;
        try {
            Command condition = new Command();
            condition.setCommand(command);
            condition.setDescription(desc);
            sqlSession = dbAccess.getsqlSqlSession();
            commands = sqlSession.selectList("com.imooc.bean.Command.findByMybatis", condition);
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (sqlSession != null) {
                sqlSession.close();
            }
        }
        return commands;
    }

}
