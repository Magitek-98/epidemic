<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>bootstrap</title>
  <link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css" rel="stylesheet">
</head>
<body>

<%--导航条效果--%>
<nav class="navbar navbar-default navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
              data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">广州粤嵌</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">简介</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">Link <span class="sr-only">(current)</span></a></li>
        <li><a href="#">综述</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
             aria-expanded="false">学院 <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">IOS学院</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">Java学院</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">C++学院</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">Separated link</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">UI学院</a></li>
          </ul>
        </li>
      </ul>
      <form class="navbar-form navbar-left">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="Search">
        </div>
        <button type="submit" class="btn btn-default">Submit</button>
      </form>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>

<%--图片轮播效果--%>
<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
    <div class="item active">
      <img src="img/nav_01.jpg" alt="...">
      <div class="carousel-caption">
        第一张图片
      </div>
    </div>
    <div class="item">
      <img src="img/nav_02.jpg" alt="...">
      <div class="carousel-caption">
        第2张图片
      </div>
    </div>
    <div class="item">
      <img src="img/nav_03.jpg" alt="...">
      <div class="carousel-caption">
        第3张图片
      </div>
    </div>
  </div>

  <!-- Controls -->
  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>

<div>

  <!-- Nav tabs -->
  <ul class="nav nav-tabs" role="tablist">
    <li role="presentation"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">IOS学院</a></li>
    <li role="presentation" class="active"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">Java学院</a>
    </li>
    <li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">UI学院</a></li>
  </ul>

  <!-- 标签页效果 -->
  <div class="tab-content">
    <div role="tabpanel" class="tab-pane" id="home">
      这里是显示IOS学院的详细内容
    </div>
    <div role="tabpanel" class="tab-pane active" id="profile">
      这里是显示Java学院的详细内容
    </div>
    <div role="tabpanel" class="tab-pane" id="messages">
      这里是显示UI学院的详细内容
    </div>
  </div>

</div>

<%--手风琴效果--%>
<div class="panel-group" id="menu">
  <div class="panel panel-default">
    <div class="panel-heading"><h4 class="panel-title"><a data-toggle="collapse" data-parent="#menu" href="#div1">
      用户管理 </a>
    </h4>
    </div>
    <div id="div1" class="panel-collapse in">
      <div class="list-group"><a href="login.jsp" class="list-group-item">登录</a> <a href="register.jsp" class="list-group-item">注册</a>
        <a href="logoff.jsp" class="list-group-item">注解</a>
      </div>
    </div>
  </div>
  <div class="panel panel-default">
    <div class="panel-heading"><h4 class="panel-title"><a class="collapsed" data-toggle="collapse"
                                                          data-parent="#menu"
                                                          href="#div2">数据管理</a>
    </h4>
    </div>
    <div id="div2" class="panel-collapse collapse">
      <div class="list-group"><a href="#" class="list-group-item">数据录入</a> <a href="#" class="list-group-item">数据查询</a>
        <a href="#" class="list-group-item">数据修改</a>
      </div>
    </div>
  </div>
</div>

<script src="${pageContext.request.contextPath}/bootstrap/js/jquery-1.11.2.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.js"></script>
</body>
</html>

