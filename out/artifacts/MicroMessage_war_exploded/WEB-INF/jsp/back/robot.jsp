<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>机器人</title>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet" type="text/css">
    <script src="${pageContext.request.contextPath}/resources/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#query").on("click", function () {
                var command = $("#command").val();
                if (!command) {
                    alert("请输入指令");
                    return;
                }
                appendCommand(command);
                $.ajax({
                    url: '/MicroMessage/getContent.action',
                    type: 'POST',
                    data: {command: command},
                    dataType: 'text',
                    success: function (data) {
                        appendContent(data);
                    }
                });
            });
        });

        function appendCommand(command) {
            var time = getTime();
            var temp = $("#commandMain").clone();
            temp.find(".panel-title").html(time);
            temp.find('.panel-body').html(command);
            $("#robotContainer").children().after().append(temp);
        }

        function appendContent(content) {
            var time = getTime();
            var temp = $("#contentMain").clone();
            temp.find(".panel-title").html(time);
            temp.find('.panel-body').html(content);
            $("#robotContainer").children().after().append(temp);
        }

        function getTime() {
            return new Date().Format('yyyy-MM-dd hh:mm:ss');
        }

        Date.prototype.Format = function (fmt) { //author: meizz
            var o = {
                "M+": this.getMonth() + 1, //月份
                "d+": this.getDate(), //日
                "h+": this.getHours(), //小时
                "m+": this.getMinutes(), //分
                "s+": this.getSeconds(), //秒
                "q+": Math.floor((this.getMonth() + 3) / 3), //季度
                "S": this.getMilliseconds() //毫秒
            };
            if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
            for (var k in o)
                if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
            return fmt;
        }
    </script>
</head>
<body>
<div class="row">
    <div class="col-md-4"></div>
    <div class="col-md-4">
        <div id="robotContainer">
            <div class="row">
                <div style="width:70%;float:left">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">小智机器人</h3>
                        </div>
                        <div class="panel-body">
                            欢迎使用小智机器人
                            <br>
                            回复【帮助】获取全部指令
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <form class="form-inline">
                <div class="form-group">
                    <input name="command" type="text" class="form-control" id="command" placeholder="请输入指令">
                </div>
                <button type="button" class="btn btn-primary" id="query">查询</button>
                <a href="${pageContext.request.contextPath}/list.action" class="btn btn-default">列表</a>
            </form>
        </div>
    </div>
    <div class="col-md-4"></div>
</div>
<div style="display: none">
    <div class="row" id="commandMain">
        <div style="width:70%;float:left">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"></h3>
                </div>
                <div class="panel-body">
                </div>
            </div>
        </div>
    </div>
    <div class="row" id="contentMain">
        <div style="width:70%;float:right">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"></h3>
                </div>
                <div class="panel-body">
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
