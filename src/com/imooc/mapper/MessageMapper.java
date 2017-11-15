package com.imooc.mapper;

import com.imooc.bean.Message;

import java.util.List;

/**
 * Created by xuhf on 2017/11/15.
 */
public interface MessageMapper {

    public List<Message> findByMybatis(Message message);

}
