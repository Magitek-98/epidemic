<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>bootstrap</title>
    <link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/datepicker/bootstrap-datepicker3.css">
    <style>

    </style>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-1 col-sm-3 col-xs-12">.col-md-1</div>
        <div class="col-md-1 col-sm-3 col-xs-12">.col-md-1</div>
        <div class="col-md-1 col-sm-3 col-xs-12">.col-md-1</div>
        <div class="col-md-1 col-sm-3 col-xs-12">.col-md-1</div>
        <div class="col-md-1 col-sm-3 col-xs-12">.col-md-1</div>
        <div class="col-md-1 col-sm-3 col-xs-12">.col-md-1</div>
        <div class="col-md-1 col-sm-3 col-xs-12">.col-md-1</div>
        <div class="col-md-1 col-sm-3 col-xs-12">.col-md-1</div>
        <div class="col-md-1 col-sm-3 col-xs-12">.col-md-1</div>
        <div class="col-md-1 col-sm-3 col-xs-12">.col-md-1</div>
        <div class="col-md-1 col-sm-3 col-xs-12">.col-md-1</div>
        <div class="col-md-1 col-sm-3 col-xs-12">.col-md-1</div>
    </div>
    <div class="row">
        <div class="col-md-8">.col-md-8</div>
        <div class="col-md-4 ">.col-md-4</div>
    </div>
    <div class="row">
        <div class="col-md-4">.col-md-4</div>
        <div class="col-md-4 ">.col-md-4</div>
        <div class="col-md-4 ">.col-md-4</div>
    </div>
    <div class="row">
        <div class="col-md-4 col-md-offset-4 ">.col-md-4</div>
    </div>
    <div class="row">
        <ul class="breadcrumb">
            <li><a href="main.jsp">主页</a></li>
            <li><a href="login.jsp">登录</a></li>
        </ul>
    </div>
    <div class="row">
        <table class="table table-striped table-bordered table-hover table-condensed">
            <thead>
            <th>姓名</th>
            <th>年龄</th>
            <th>成绩</th>
            <th>email</th>
            <th>地址</th>
            </thead>
            <tbody>
            <tr class="active">
                <td>zhangsan</td>
                <td>32</td>
                <td>99</td>
                <td>8989898@qq.com</td>
                <td>广东广州</td>
            </tr>
            <tr class="success">
                <td>zhangsan</td>
                <td>32</td>
                <td>99</td>
                <td>8989898@qq.com</td>
                <td>广东广州</td>
            </tr>
            <tr class="warning">
                <td>zhangsan</td>
                <td>32</td>
                <td>99</td>
                <td>8989898@qq.com</td>
                <td>广东广州</td>
            </tr>
            <tr class="danger">
                <td>zhangsan</td>
                <td>32</td>
                <td>99</td>
                <td>8989898@qq.com</td>
                <td>广东广州</td>
            </tr>
            </tbody>
        </table>
    </div>

    <div class="row">
        <form action="" method="post">
            账号：
            <input type="text" id="account" name="userAccount" class="form-control" placeholder="请输入账号"
                   style="width: 10em;"/>
            <br/>
            密码：
            <input type="password" id="pwd" name="userPassword" placeholder="请输入密码" class="form-control"
                   style="width: 10em;"/>
            <br/>
            <button type="submit" class="btn btn-primary">登录</button>
        </form>
        <button class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-log-in"></span></button>
        <div class="alert alert-warning alert-dismissible" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span
                    aria-hidden="true">&times;</span></button>
            <strong>Warning!</strong> 这是一个提示框效果
        </div>

        <button class="btn btn-primary" type="button">
            未读信息： <span class="badge">12</span>
        </button>

        <div class="row">
            <div class="form-group"><label for="datepicker">出生日期：</label>
                <div class="input-group date" id="datepicker" data-date-format="yyyy-mm-dd">
                    <input class="form-control group" size="6" type="text" value="" style="width: 10em;" readonly>
                    <button class="btn btn-sm"><span class="add-on glyphicon glyphicon-calendar"></span></button>
                </div>
            </div>
        </div>
    </div>


</div>


<script src="${pageContext.request.contextPath}/bootstrap/js/jquery-1.11.2.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap/datepicker/bootstrap-datepicker.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap/datepicker/bootstrap-datepicker.zh-CN.min.js"></script>
</body>
</html>

<script>
    $(function () {
        //找到日历控件
        var datePicker = $("#datepicker");
        datePicker.datepicker({language:'zh-CN',autoclose:'true'});  //初始化
        datePicker.datepicker("setDate",new Date());
        var currentTime = new Date();  //当前日期
        var date1 = new Date();
        date1.setDate(currentTime.getDate()-7);  //把时间往前推了一周
        datePicker.datepicker("setStartDate",date1);  //设置日期控件的开始时间
        datePicker.datepicker("setEndDate",currentTime); //设置结束时间点
    });
</script>
