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
        .upload{
            width: 70%;
            height: 400px;
            margin: 30px auto;
            border: 2px dashed #ddd;
            border-radius: 5px;
        }
        .upload-Icon{
            width: 100%;
            text-align: center;
            color: silver;
            margin-top: 30px;
        }

        .form-group{
            width: 100%;
        }
        input,select{
            width: 60%;
            height:40px;
            margin: 10px 20%;
            padding-left: 10px;
            border-radius: 5px;
            border: 1px solid #c0c4cc;
        }

        input[type="submit"] {
            background: #00a1d6;
            color: white;
            font-size: 18px;
        }
        .fg1{
            position: relative;
            height: 40px;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #c0c4cc;
            width: 60%;
            margin-left: 20%;
            color: #c0c0c0;
        }
    </style>
</head>

<body>
<div class="nav-top">
    <ul>
        <li><a href="" style="margin-left: 19em;">主页</a></li>
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
    <div class="topLogo"></div>
</div>

<div class="contents">
    <div class="conLeft">
        <ul>
            <li style=" border-bottom: 1px solid #e1e2e5; color: #99a2aa;">个人中心</li>
            <li>首    页</li>
            <li><a href="myInfo">我的信息</a></li>
            <li ><a href="myPhoto">我的头像</a></li>
            <li>我的记录</li>
            <li>我要投稿</li>
        </ul>
    </div>
    <div class="conRight">
        <div class="title">
            | 投稿
        </div>
        <div class="upload">
<!--            <p class="upload-Icon">-->
<!--                <i class="icon-download-alt icon-4x"></i><br>-->
<!--            </p>-->


            <form action="doUpload" method="post" enctype="multipart/form-data">
                <div class="form-group fg1" style="margin-top: 30px; ">
                    <input type="file" name="video" value="上传视频" style="position:absolute;opacity: 0;" accept=".mp4,.flash,.flv">
                    <span>选择上传视频  <i class="icon-download-alt icon-2x"></i></span>
                </div>

                <div class="form-group">
                    <input type="text" placeholder="视频标题" name="title">
                </div>
                <div class="form-group">
                    <input type="text" placeholder="给你的视频一点表述吧" name="desc">
                </div>
                <div class="form-group">
                    <select name="type" id="category_name" >
                        <option value="">选择类型</option>
                        <option value="animation">动漫</option>
                        <option value="dance">舞蹈</option>
                        <option value="game">游戏</option>
                        <option value="ghost">鬼畜</option>
                        <option value="fime">电影</option>
                    </select>
                </div>

                <div class="form-group">
                    <input type="submit" value="投稿">
                </div>

            </form>



        </div>

    </div>
</div>
</body>
</html>