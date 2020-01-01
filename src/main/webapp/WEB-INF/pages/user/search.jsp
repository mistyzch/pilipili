<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: misty
  Date: 2019/12/26
  Time: 22:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>search</title>
    <link rel="stylesheet" href="../static/css/bootstrap.min.css">
    <link rel="stylesheet" href="../static/css/font-awesome.min.css">
    <script type="text/javascript" src="../static/js/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="../static/js/bootstrap.min.js"></script>

    <style>
        *{
            margin: 0px;
            padding: 0px;

        }
        a{
            /*text-underline: none;*/
            color:black ;
            text-decoration: none;
        }
        a:hover{
            color: #00BEE7;
        }
        li{
            list-style: none;
        }
        .nav-top{
            width: 100%;
            height: 60px;
            border-bottom: 3px solid #ccc;


        }
        .nav-top li{
            float: left;
            height: 60px;
            line-height: 60px;
            margin: 0px 10px;
        }
        .search input[type="text"]{
            /*margin-left: 230px;*/
            width: 264px;
            height: 38px;
            border-radius: 2px;
            background: #f4f4f4;
            border: none;
            padding: 20px;


        }
        .search input[type="submit"]{
            width: 50px;
            background: #00A1D6;
            height: 42px;
            border-radius: 2px;
            color: white;
            border: none;
            line-height: 42px;

        }
        .search{
            width: 40%;
            margin: 0px auto;
            margin-top: 40px;
            /*border: 1px solid;*/

        }
        .searchBody{
            width: 70%;
            margin-left: 15%;
            /*border: 1px solid;*/
        }
        .searchBody hr{
            width: 100%;
            height: 1.5px;
            background: #ddd;
            margin-top: 32px;
        }
        .searchBody .type_nav  li{
            float: left;
            font-size: 18px;
            margin: 10px 3%;
        }
        .videoList{
            /*border: 1px solid;*/
            width: 100%;
            /*height: auto;*/

        }
        .videoList li .video{
            width: 18%;
            height: 230px;
            border: 1px solid #dddddd;
            float: left;
            margin:1%;
            border-radius: 2px;
        }

        .video .conent .title{
            margin-top: 10px;
            padding-left: 10px;
            font-size: 16px;
        }
        .video .conent .playAndStart{
            color: #757575;
            font-size: 14px;
            padding-left: 10px;
        }
        .video .conent .author{
            color: #757575;
            font-size: 14px;
            padding-left: 10px;
        }

    </style>
</head>

<body>
<div class="nav-top">
    <ul>
        <li><img src="../static/images/video/logo.png" alt="" width="105"
                 height="53"></li>
        <li><a href="">主页</a></li>
        <li>游戏中心</li>
        <li>直播</li>
        <li>会员购</li>
        <li>漫画</li>
        <li>赛事</li>
        <li style="margin-left: 50%;">动态历史</li>
        <li>个人记录</li>
        <li><a href="../user/myInfo">个人中心</a></li>
    </ul>
</div>
<div class="search">
    <form id="nav_searchform" method="get" action="search">
        <img src="../static/images/search/searchLogo.png" alt="">
        <input type="text" placeholder="输入关键字搜索" class="nav-search-keyword" name="key">
        <input type="submit" placeholder="search" value="search">
    </form>
</div>
<div class="searchBody">
    <ul class="type_nav">
        <li><a href="">综合</a></li>
        <li><a href="">动画</a></li>
        <li><a href="">音乐</a></li>
        <li><a href="">科技</a></li>
        <li><a href="">数码</a></li>
        <li><a href="">鬼畜</a></li>
        <li><a href="">生活</a></li>
        <li><a href="">娱乐</a></li>
        <li><a href="">电影</a></li>
        <li><a href="">美妆</a></li>
    </ul>
    <br/>
    <hr>
    <ul class="videoList">
        <c:forEach items="${searchVideos}" var="searchVideo">
            <li>
                <div class="video">
                    <a href="/pilipili/video/watchvideo?id=${searchVideo.id}">
                        <img src="${searchVideo.pictureUrls}" style="width: 100%;" alt="">
                    </a>
                    <div class="conent">
                        <p class="title">${searchVideo.name}</p>
                        <p class="playAndStart"><i class="icon-play-circle"></i>${searchVideo.clickTimes} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <i class="icon-time"></i><sapn class="dataStr">${searchVideo.releaseDate}</sapn></p>
                        <p class="author"><i class="icon-user"></i>${searchVideo.user.account}</p>
                    </div>
                </div>
            </li>
        </c:forEach>
    </ul>
</div>
</body>
<script>
    $(function () {
        $(".dataStr").each(function (e) {
            $(this).html($(this).html().split(" ")[0]);
        })
    })
</script>
</html>