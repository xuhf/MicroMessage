<%--
  Created by IntelliJ IDEA.
  User: xuhf
  Date: 2017/11/15
  Time: 10:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>新增</title>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet" type="text/css">
    <script src="${pageContext.request.contextPath}/resources/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
</head>
<body>
<div class="row">
    <div class="col-md-2"></div>
    <div class="col-md-8">
        <form class="form-horizontal" action="${pageContext.request.contextPath}/add.action" method="post">
            <div class="form-group">
                <label for="command" class="col-sm-2 control-label">命令</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="command" id="command" placeholder="命令">
                </div>
            </div>
            <div class="form-group">
                <label for="description" class="col-sm-2 control-label">描述</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="description" id="description" placeholder="描述">
                </div>
            </div>
            <div class="form-group">
                <label for="content" class="col-sm-2 control-label">描述</label>
                <div class="col-sm-10">
                    <textarea rows="5" name="content" class="form-control" id="content" placeholder="内容"></textarea>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit" class="btn btn-success">添加</button>
                    <button type="reset" class="btn btn-primary">添加</button>
                </div>
            </div>
        </form>
    </div>
    <div class="col-md-2"></div>
</div>
</body>
</html>
