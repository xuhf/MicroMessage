package com.imooc.dao;

import com.imooc.bean.Message;
import com.imooc.db.DBAccess;
import org.apache.ibatis.session.SqlSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by xuhf on 2017/11/14.
 */
public class MessageDao {

    public List<Message> find(String command, String desc) {
        List<Message> messages = new ArrayList<Message>();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mybatis", "root", "880819");
            List<String> args = new ArrayList<String>();
            StringBuffer sql = new StringBuffer("select id,command,description,content from message where 1=1 ");
            if (command != null && !command.equals("")) {
                sql.append(" and command = ?");
                args.add(command);
            }
            if (desc != null && !"".equals(desc)) {
                sql.append(" and description like '%' ? '%'");
                args.add(desc);
            }
            PreparedStatement ps = conn.prepareStatement(sql.toString());
            for (int i = 0; i < args.size(); i++) {
                ps.setString(i + 1, args.get(i));
            }
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Message m = new Message();
                m.setId(rs.getInt("id"));
                m.setCommand(rs.getString("command"));
                m.setDescription(rs.getString("description"));
                m.setContent(rs.getString("content"));
                messages.add(m);
            }
            rs.close();
            ps.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return messages;
    }

    public List<Message> findByMybatis(String command, String desc) {
        List<Message> messages = new ArrayList<Message>();
        DBAccess dbAccess = new DBAccess();
        SqlSession sqlSession = null;
        try {
            Message condition = new Message();
            condition.setCommand(command);
            condition.setDescription(desc);
            sqlSession = dbAccess.getsqlSqlSession();
            messages = sqlSession.selectList("com.imooc.bean.Message.findByMybatis", condition);
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (sqlSession != null) {
                sqlSession.close();
            }
        }
        return messages;
    }

    public void deleteOne(int id) {
        DBAccess dbAccess = new DBAccess();
        SqlSession sqlSession = null;
        try {
            sqlSession = dbAccess.getsqlSqlSession();
            sqlSession.delete("com.imooc.bean.Message.deleteOne", id);
            sqlSession.commit();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (sqlSession != null) {
                sqlSession.close();
            }
        }
    }

    public void deleteBatch(List<Integer> ids) {
        DBAccess dbAccess = new DBAccess();
        SqlSession sqlSession = null;
        try {
            sqlSession = dbAccess.getsqlSqlSession();
            sqlSession.delete("com.imooc.bean.Message.deleteBatch", ids);
            sqlSession.commit();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (sqlSession != null) {
                sqlSession.close();
            }
        }
    }

    public void add(Message message) {
        DBAccess dbAccess = new DBAccess();
        SqlSession sqlSession = null;
        try {
            sqlSession = dbAccess.getsqlSqlSession();
            sqlSession.insert("com.imooc.bean.Message.add", message);
            sqlSession.commit();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (sqlSession != null) {
                sqlSession.close();
            }
        }
    }
}
