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

        .comment li{
            /*border: 1px solid red;*/

        }
        .comment{
            margin-top: 100px;
            width: 100%;
            height: auto;

        }
        .comment ul li{
            border-bottom: 1px solid #ddd;
            display: block;
            width: 100%;
            height: 120px;
            float: top;
        }
        .comment ul li .photo{
            width: 15%;
            float: left;

        }
        .comment ul li .comments{
            width: 85%;
            float: right;

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
        #pullComment{
            background: #00BEE7;
            width: 8%;
            height: 40px;
            float: left;
            line-height: 40px;
            text-align: center;
            font-size: 18px;
            color: white;
            border-radius: 5px;
            cursor:pointer;
        }
    </style>
    <script>
        $(function () {

            if(${user!=null}){
                if (${video.collectionState==1}){
                    $(".startVideo ul .star i").css("color","rgb(0, 167, 222)");
                }
                if(${video.likeState==1}){
                    $(".startVideo ul .thumbs-up i").css("color","rgb(0, 167, 222)");
                }
            }

            //评论
            $("#pullComment").click(function (event) {
                    event.preventDefault();
                    let myComment=$(".doComment textarea").val();
                    console.log(myComment);
                    let comment=$(".comment ul");
                    console.log(comment);
                    $.ajax({
                        type:"post",
                        url:"../commitComment",
                        data:{
                            "myComment":myComment,
                            "video_id":${video.id}
                        },
                        success:function (result) {
                            if(result.msg==2){
                                alert("评论前请登录！");
                            }else{
                                /*
                               插入新的评论
                            */
                                if(result.msg==1){
                                    comment.prepend(' <li>\n' +
                                        '                    <div>\n' +
                                        '                        <div class="photo">\n' +
                                        '                            <img src="${user.portraitUrl}" alt="" width="80">\n' +
                                        '                        </div>\n' +
                                        '                        <div class="comments">\n' +
                                        '                            <p style="font-size: 18px;color: darkred;">${user.account}</p>\n' +
                                        '\n' +
                                        '                            <p class="commentText">\n' +myComment+
                                        '                            </p>\n' +
                                        '                        </div>\n' +
                                        '                    </div>\n' +
                                        '                </li>')
                                }else {
                                    alert("评论失败!");
                                }
                                $("#commentCount").html(result.commentCount);
                                $("#commentCount1").html(result.commentCount);
                            }

                        }
                    })
                }
            )
            //点赞
            $(".startVideo ul .thumbs-up i").on("click",
                function (event) {
                event.preventDefault();
                console.log($(this).css("color"));
                $.ajax({
                    type:"post",
                    url:"../doLike",
                    data:{
                        "video_id":"${video.id}"
                    },
                    success:function (result) {
                        console.log(result);
                        if(result.msg=="2"){
                            alert("请登录！");
                        }else{
                            if(result.msg=="0")
                            {
                                //取消点赞
                                //$(this).css("color","#999");
                                $(".startVideo ul .thumbs-up i").css("color","#999");
                            }
                            else{
                                $(".startVideo ul .thumbs-up i").css("color","rgb(0, 167, 222)");
                            }
                            $("#likeCount").html(result.likeCount);
                            $("#likeCount1").html(result.likeCount);
                        }

                    }
                })
            })

            //收藏
            $(".startVideo ul .star i").on("click",
                function (event) {
                    event.preventDefault();
                    $.ajax({
                        type:"post",
                        url:"../doCollection",
                        data:{
                            "video_id":"${video.id}"
                        },
                        success:function (result) {
                            if(result.msg=="2"){
                                alert("请登录");
                            }else {
                                if(result.msg=="0")
                                {
                                    //取消收藏
                                    $(".startVideo ul .star i").css("color","#999")
                                }
                                else{
                                    $(".startVideo ul .star i").css("color","rgb(0, 167, 222)")
                                }
                                $("#collectionCount").html(result.collectionCount);
                            }
                        }
                    })
                })

        });


    </script>
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
            <form id="nav_searchform" action="search">
                <input type="text" placeholder="输入关键字搜索" class="nav-search-keyword" name="key">
                <input type="submit" placeholder="search" value="search">
            </form>
        </li>
        <li style="margin-left: 20%;">动态历史</li>
        <li>个人记录</li>
        <li><a href="../user/myInfo">个人中心</a></li>
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

        <p ><span id="likeCount1">${video.likeCount}</span>点赞 &nbsp;&nbsp;&nbsp;    <span id="commentCount">${video.commentCount}</span>评论&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <span style="position: relative;">
                    <img src="../static/images/video/warnning.png" alt="" style="position: absolute; top:-3px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;未经作者允许禁止转载
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
            <li class="thumbs-up">
                <p><i class="icon-thumbs-up icon-2x"></i><span id="likeCount">${video.likeCount}</span></p>
            </li>
            <li class="star">
                <p><i class="icon-star icon-2x"></i><span id="collectionCount">${video.collectionCount}</span></p>
            </li>
            <li>
                <p><i class="icon-gift icon-2x"></i><span>124</span></p>
            </li>
            <li>
                <p><i class="icon-share-alt icon-2x"></i></p>
            </li>
        </ul>
    </div>

    <div class="doComment" style="width: 100%;height: 100px;">
        <!--            <input type="text">-->
        <textarea style="width: 100%;height: 80px;border: #00BEE7 1px solid; border-radius: 5px;padding: 30px 10px;font-size: 18px;" placeholder="填写评论"></textarea>
        <div id="pullComment" style="
                                                        ">评论</div>
    </div>

    <div class="comment">
        <p><h2><span id="commentCount1">${video.commentCount}</span>评论</h2></p>
        <hr style="width: 100%;margin-left: 0%;height: 2px">
        <ul>
            <c:forEach items="${video.comments}" var="comment">
                <li>
                    <div>
                        <div class="photo">
                            <img src="${comment.user.portraitUrl}" alt="" width="80">
                        </div>
                        <div class="comments">
                            <p style="font-size: 18px;color: darkred;">${comment.user.account}</p>

                            <p class="commentText">
                                ${comment.comment}
                            </p>
                        </div>
                    </div>
                </li>
            </c:forEach>

        </ul>
    </div>
</div>

<div class="recommend">
    <h3>相关推荐</h3>
    <ul class="videoList">
        <c:forEach items="${recommendVideos}" var="recommendVideo">
            <li>
                <div class="recommendVideo">
                    <a href="watchvideo?id=${recommendVideo.id}">
                        <div class="videoCover"><img src="${recommendVideo.pictureUrls}"  width="175" alt=""></div>
                        <div class="conent">
                            <p class="title"><h4>${recommendVideo.user.account}</h4></p>
                            <p class="author">作者</p>
                            <p class="playAndStart">${recommendVideo.clickTimes} 播放 &nbsp;&nbsp; <span class="dataStr"></span>点赞</p>
                        </div>
                    </a>
                </div>
            </li>
        </c:forEach>
    </ul>
</div>
</body>

</html>
