<%--
  Created by IntelliJ IDEA.
  User: xuhf
  Date: 2017/11/14
  Time: 10:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>首页111</title>
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet" type="text/css">
    <script src="${pageContext.request.contextPath}/resources/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
</head>
<body>
<div class="container">
    <h1>h1. Bootstrap heading</h1>
    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-8">
            <!-- Standard button -->
            <a href="${pageContext.request.contextPath}/list.action" class="btn btn-primary btn-lg active" role="button">列表页</a>
        </div>
        <div class="col-md-24"></div>
    </div>
</div>
</body>
</html>
