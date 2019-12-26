<%--
  Created by IntelliJ IDEA.
  User: misty
  Date: 2019/12/25
  Time: 21:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>video</title>
    <link rel="stylesheet" href="../static/css/bootstrap.min.css">
    <link rel="stylesheet" href="../static/css/font-awesome.min.css">
    <script type="text/javascript" src="../static/js/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="../static/js/bootstrap.min.js"></script>

    <style>
        *{
            margin: 0px;
            padding: 0px;

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
        .nav-top li input[type="text"]{
            margin-left: 230px;
            width: 264px;
            height: 38px;
            border-radius: 2px;
            background: #f4f4f4;
            border: none;
            padding: 10px;


        }
        .nav-top li input[type="submit"]{
            width: 50px;
            background: #00A1D6;
            height: 42px;
            border-radius: 2px;
            color: white;
            border: none;
            line-height: 42px;

        }
        .video{
            width: 60%;
            float: left;
            margin-top: 20px;
            margin-left: 10%;
            /*border: 1px solid red;*/

        }
        .video p{
            color: #999;
            font-size: 14px;
            margin-top: 8px;
            /*border: 1px solid red;*/
        }
        .videoPlay{
            width: 100%;
            height: 500px;
            /*border: 1px solid red;*/
            margin-top: 10px;
        }
        .videoPlay video{
            width: 98%;
            height: 100%;
        }
        .startVideo{
            width: 100%;
            height: 50px;
            /*background: red;*/
            border-bottom: 1px solid #ddd;
            border-top: 1px solid #ddd;
            margin-top: 20px;
        }
        .startVideo ul li{
            float: left;
            /*margin: 10px 20px;*/
            /*margin-top: 20px;*/
            margin-right: 70px;
            color: #757575;
        }
        .startVideo ul li p i{
            color: #757575;
        }
        .startVideo span{
            line-height: 35px;
            padding-left: 20px;
            font-size: 18px;

        }
        .video p:hover i, .video p:hover span{
            color: #00a7de;
        }

        .comment * {
            /*border: 1px solid red;*/
        }
        .comment{
            margin-top: 100px;
            width: 100%;
            height: auto;

        }
        comment ul il{
            border-bottom: 1px solid #ddd;
        }
        .comment ul li .photo{
            width: 15%;
            float: left;

        }
        .comment ul li .comments{
            width: 85%;
            float: left;

        }
        .commentText{
            margin-top: 20px;
        }
        .recommend{
            width: 28%;
            margin-left: 1%;
            min-height: 600px;
            margin-top: 120px;
            float: right;
            /*border: 1px solid red;*/
        }
        .videoList .recommendVideo{
            height: 100px;
            overflow: hidden;
            margin-bottom: 20px;
        }
        .videoList .recommendVideo .videoCover{
            /*border: 1px solid red;*/
            float: left;
            width: 42%;
        }
        .videoList .recommendVideo .conent{
            /*border: 1px solid red;*/
            float: left;
            margin-left: 1.5%;
        }
        .recommendVideo a{
            color: black;
        }
        .videoList .conent .title{
            margin-top: -10px;
        }
        .videoList .conent .author{
            color: #757575;
            font-size: 14px;
        }
        .videoList .conent .playAndStart{
            color: #757575;
            font-size: 16px;
        }

    </style>
</head>
<body>
<div class="nav-top">
    <ul>
        <li><img src="../static/images/video/logo.png" alt="" width="105"
                 height="53"></li>
        <li>主页</li>
        <li>游戏中心</li>
        <li>直播</li>
        <li>会员购</li>

        <li>
            <form id="nav_searchform" action="search.html">
                <input type="text"placeholder="输入关键字搜索" class="nav-search-keyword" name="nav-search-keyword">
                <input type="submit" placeholder="search" value="search">
            </form>
        </li>
        <li style="margin-left: 20%;">动态历史</li>
        <li>个人记录</li>
        <li><a href="myInfo/myInfo.html">个人中心</a></li>
    </ul>
</div>

<div class="video">
    <div class="videoInfo">
        <p>
        <h2>${video.name}</h2>
        </p>
        <p>
            发布时间：${video.releaseDate}
        </p>

        <p>121点赞 &nbsp;&nbsp;&nbsp;    144评论&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <span style="position: relative;">
                    <img src="${video.pictureUrls}" alt="" style="position: absolute; top:-3px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;未经作者允许禁止转载
                </span>
        </p>
    </div>
    <div class="videoPlay">
        <video controls>
            <source src="${video.videoUrl}" type="">
        </video>
    </div>

    <div class="startVideo">
        <ul>
            <li>
                <p><i class="icon-thumbs-up icon-2x"></i><span>11</span></p>
            </li>
            <li>
                <p><i class="icon-star icon-2x"></i><span>123</span></p>
            </li>
            <li>
                <p><i class="icon-gift icon-2x"></i><span>124</span></p>
            </li>
            <li>
                <p><i class="icon-share-alt icon-2x"></i></p>
            </li>
        </ul>
    </div>

    <div class="comment">
        <p><h2>121评论</h2></p>
        <hr style="width: 100%;margin-left: 0%;height: 2px">
        <ul>
            <li>
                <div>
                    <div class="photo">
                        <img src="../static/images/login/22.png" alt="" width="80">
                    </div>
                    <div class="comments">
                        <p style="font-size: 18px;color: darkred;">22娘</p>

                        <p class="commentText">
                            爆肝一年画小埋<br/>
                            个中滋味与谁谈<br/>
                            不求看官都充电<br/>
                            但愿大家三连赞<br/>
                        </p>
                    </div>
                </div>
            </li>
            <li>
                <div>
                    <div class="photo">
                        <img src="../static/images/login/33.png" alt="" width="80">
                    </div>
                    <div class="comments">
                        <p style="font-size: 18px;color: darkred;">33娘</p>

                        <p class="commentText">
                            爆肝4472小时（x）
                            限流东方（√）
                        </p>
                    </div>
                </div>
            </li>
            <li></li>
            <li></li>
        </ul>
    </div>
</div>

<div class="recommend">
    <h3>相关推荐</h3>
    <ul class="videoList">
        <li>
            <div class="recommendVideo">
                <a href="#">
                    <div class="videoCover"><img src="../static/images/video/cover1.png"  width="175" alt=""></div>
                    <div class="conent">
                        <p class="title"><h4>这是一个长的标题</h4></p>
                        <p class="author">作者</p>
                        <p class="playAndStart">20 播放 &nbsp;&nbsp; 751点赞</p>
                    </div>
                </a>
            </div>
        </li>
        <li>
            <div class="recommendVideo">
                <a href="#">
                    <div class="videoCover"><img src="../static/images/login/33.png"  width="175px" alt=""></div>
                    <div class="conent">
                        <p class="title"><h4>这是一个长的标题</h4></p>
                        <p class="author">作者</p>
                        <p class="playAndStart">20 播放 &nbsp;&nbsp; 751点赞</p>
                    </div>
                </a>
            </div>
        </li>
        <li>
            <div class="recommendVideo">
                <a href="#">
                    <div class="videoCover"><img src="../static/images/video/cover1.png"  width="175" alt=""></div>
                    <div class="conent">
                        <p class="title"><h4>这是一个长的标题</h4></p>
                        <p class="author">作者</p>
                        <p class="playAndStart">20 播放 &nbsp;&nbsp; 751点赞</p>
                    </div>
                </a>
            </div>
        </li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
    </ul>
</div>
</body>
</html>
