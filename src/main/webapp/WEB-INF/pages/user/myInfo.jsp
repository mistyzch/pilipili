<%@ page import="com.pilipili.entity.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>myinfo</title>
    <link rel="stylesheet" href="../static/css/bootstrap.min.css">
    <link rel="stylesheet" href="../static/css/font-awesome.min.css">
    <script type="text/javascript" src="../static/js/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="../static/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="../static/css/initStyle.css">
    <style>
        *{
            padding: 0px;
            margin: 0px;
            /*font-size: 14px;*/
        }
        a{
            text-decoration: none;
            color: #333;
        }
        li{
            list-style: none;
        }
        .topLogo{
            width: 980px;
            height: 106px;
            margin: 0 auto;
            background: url("../static/images/myinfo/top1.png") no-repeat;
            /*background-size: 100%;*/
        }
        .top{
            background: url("../static/images/myinfo/bg1.png");
            height: 86px;
        }
        .contents{
            width: 64%;
            height: 800px;
            margin: 50px auto;
            border: 1px solid #e1e2e5;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0,0,0,.14);
        }
        .conLeft{
            background-color: #FAFAFA;
            width: 18%;
            height: 800px;
            float: left;
            border-right: 1px solid  #e1e2e5;
        }
        .conLeft ul li{
            height: 60px;
            text-align: center;
            font-size: 16px;
            line-height: 60px;
        }
        .conLeft ul li:hover{
            background-color: #00A1D7;
        }
        .conRight{
            width: 82%;
            height: 800px;
            float: left;
        }
        .conRight .title{
            height: 60px;
            width: 100%;
            border-bottom: 1px solid  #e1e2e5;
            line-height: 60px;
            padding-left: 30px;
            color: #00BEE7;
            float: top;
        }
        .conRight .myInfo{
            float: top;
            width: 80%;
            margin: 20px 10%;
            color: #48576a;
        }
        .form-group{
            margin-top: 50px;
        }
        .form-group input[type="radio"]{
            margin-left:20px;
            width: 12px;
            height: 12px;
            background: #00BEE7;
        }
        .form-group input[type="text"]{
            margin-left:20px;
            border: 1px solid #bfcbd9;
            border-radius: 5px;
            /*box-shadow: 0 2px 4px rgba(0,0,0,.14);*/
            width: 35%;
            height: 30px;
        }
        .form-group input[type="date"]{
            /*margin-left:20px;*/
            border: 1px solid #bfcbd9;
            border-radius: 5px;
            /*box-shadow: 0 2px 4px rgba(0,0,0,.14);*/
            width: 35%;
            height: 30px;
        }
        .form-group input[type="submit"]{
            margin-left: 15%;
            margin-top: 45px;
            width: 90px;
            height: 40px;
            background: #00B5E5;
            border: none;
            border-radius: 5px;
            color: white;
        }
    </style>
</head>

<body>
<div class="nav-top">
    <ul>
        <li><a href="/pilipili" style="margin-left: 19em;">主页</a></li>
        <li>游戏中心</li>
        <li>直播</li>
        <li>会员购</li>
        <li>漫画</li>
        <li>赛事</li>
        <li style="">动态历史</li>
        <li>个人记录</li>
        <li><a href="myInfo">个人中心</a></li>
    </ul>
</div>
    <div class="top">
        <div class="topLogo">

        </div>
    </div>

    <div class="contents">
        <div class="conLeft">
            <ul>
                <li style=" border-bottom: 1px solid #e1e2e5; color: #99a2aa;">个人中心</li>
                <li>首    页</li>
                <li><a href="myInfo">我的信息</a></li>
                <li ><a href="myPhoto">我的头像</a></li>
                <li>我的记录</li>
            </ul>
        </div>
        <div class="conRight">
            <div class="title">
                | 我的信息
            </div>
            <div class="myInfo">
                <form action="changeInfo" method="post">
                    <div class="form-group">
                        <lable>用户id:</lable>
                        <span>${user.id}</span>

                    </div>
                    <div class="form-group">
                        <lable>用户名：</lable>
                        <input type="text" name="name" value="${user.account}">

                    </div>
                    
                    <div class="form-group">
                        <lable>性别:</lable>
                            <input type="radio" value="man" name="gender" <c:if test="${user.gender == 1}">checked</c:if> >男
                            <input type="radio" value="woman" name="gender" <c:if test="${user.gender == 0}">checked</c:if> >女
                            <input type="radio" value="secret" name="gender" <c:if test="${user.gender == 2}">checked</c:if> >保密

                        <%--<input type="radio" value="" name="gender">保密--%>
                    </div>
                    
                    <div class="form-group">
                        <lable>新密码:</lable>
                        <input type="password" name="password">
                    </div>

                    <div class="form-group">
                        <input type="submit" value="保存">
                    </div>

                </form>
            </div>
        </div>
    </div>
</body>
</html>