package com.imooc.servlet;

import com.imooc.bean.Message;
import com.imooc.service.MessageService;

import java.io.IOException;
import java.util.List;

/**
 * Created by xuhf on 2017/11/14.
 */
@SuppressWarnings("serial")
public class ListServlet extends javax.servlet.http.HttpServlet {

    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String command = request.getParameter("command");
        String desc = request.getParameter("desc");
        MessageService service = new MessageService();
        List<Message> messages = service.find(command, desc);
        request.setAttribute("messages", messages);
        request.setAttribute("command", command);
        request.setAttribute("desc", desc);
        request.getRequestDispatcher("/WEB-INF/jsp/back/list.jsp").forward(request, response);
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        this.doPost(request, response);
    }
}
