package com.imooc.db;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.Reader;

/**
 * Created by xuhf on 2017/11/14.
 */
public class DBAccess {

    public SqlSession getsqlSqlSession() throws IOException {
        Reader reader = Resources.getResourceAsReader("com/imooc/config/Configuration.xml");
        SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(reader);
        return factory.openSession();
    }

}
