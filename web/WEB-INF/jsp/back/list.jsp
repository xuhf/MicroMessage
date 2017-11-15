<%--
  Created by IntelliJ IDEA.
  User: xuhf
  Date: 2017/11/14
  Time: 10:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>列表页</title>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet" type="text/css">
    <script src="${pageContext.request.contextPath}/resources/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
    <script type="text/javascript">

        $(function () {
            deleteBatchBtn
        });

        function deleteBatch(path) {
            $("#deleteForm").submit();
        }

    </script>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-2">
        </div>
        <div class="col-md-8">
            <h3>指令列表</h3>
        </div>
        <div class="col-md-2">
        </div>
    </div>
    <div class="row">
        <div class="col-md-2">
        </div>
        <div class="col-md-8">
            <form class="form-inline" action="${pageContext.request.contextPath}/list.action" method="post">
                <div class="form-group">
                    <label class="sr-only" for="command">指令</label>
                    <input name="command" type="text" class="form-control" id="command" placeholder="请输入指令"
                           value="${command}">
                </div>
                <div class="form-group">
                    <label class="sr-only" for="desc">描述</label>
                    <input name="desc" type="text" class="form-control" id="desc" placeholder="请输入描述" value="${desc}">
                </div>
                <button type="submit" class="btn btn-primary">查询</button>
            </form>

        </div>
        <div class="col-md-2"></div>
    </div>
    <div class="row">
        <div class="col-md-2">
        </div>
        <div class="col-md-8">
            <form class="form-inline" action="${pageContext.request.contextPath}/deleteBatch.action" id="deleteForm"
                  method="post">
                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th></th>
                        <th>序号</th>
                        <th>关键字</th>
                        <th>描述</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${messages}" var="item" varStatus="status">
                        <tr>
                            <td><input type="checkbox" name="id" value="${item.id}"/></td>
                            <td>${status.index + 1}</td>
                            <td>${item.command}</td>
                            <td>${item.description}</td>
                            <td>
                                <a class="btn btn-primary btn-sm"
                                   href="${pageContext.request.contextPath}/update.action?id=${item.id}">修改</a>
                                <a class="btn btn-danger btn-sm"
                                   href="${pageContext.request.contextPath}/deleteOne.action?id=${item.id}">删除</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <a class="btn btn-success btn-sm" href="${pageContext.request.contextPath}/addInit.action">新增</a>
                <a class="btn btn-danger btn-sm"  href="javascript:deleteBatch('${pageContext.request.contextPath}')" id="deleteBatchBtn">批量删除</a>
                <a class="btn btn-danger btn-sm"  href="${pageContext.request.contextPath}/robot.action">自动回复</a>
            </form>
        </div>
        <div class="col-md-2"></div>
    </div>
</div>
</body>
</html>
