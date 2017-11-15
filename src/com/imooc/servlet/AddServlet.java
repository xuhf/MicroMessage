package com.imooc.servlet;

import com.imooc.bean.Message;
import com.imooc.service.MessageService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by xuhf on 2017/11/15.
 */
public class AddServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String command = request.getParameter("command");
        String desc = request.getParameter("description");
        String content = request.getParameter("content");
        Message message = new Message();
        message.setCommand(command);
        message.setDescription(desc);
        message.setContent(content);
        MessageService service = new MessageService();
        service.add(message);
        response.sendRedirect(request.getContextPath() + "/list.action");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
