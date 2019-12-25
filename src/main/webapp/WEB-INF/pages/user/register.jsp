<%--
  Created by IntelliJ IDEA.
  User: misty
  Date: 2019/12/25
  Time: 21:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>注册</title>
    <link rel="stylesheet" href="../static/css/bootstrap.min.css">
    <link rel="stylesheet" href="../static/css/font-awesome.min.css">
    <script type="text/javascript" src="../static/js/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="../static/js/bootstrap.min.js"></script>
    <style>
        *{
            margin: 0px;
            padding: 0px;

        }
        body{
            width: 100%;
        }
        .header{
            float: top;
            width: 100%;
            height: 105px;
            background-image: url("../static/images/login/login1.png");

        }
        .header imag{
            width: 100%;
        }
        .title-line {
            width: 980px;
            height: 28px;
            margin: 0 auto;
            border-bottom: 1px solid #ddd;
            margin-bottom: 28px;
            text-align: center;
        }
        .title-line .tit {
            height: 56px;
            line-height: 56px;
            margin: 0 auto;
            padding: 0 20px;
            font-size: 40px;
            background: #fff;
            text-align: center;
        }
        .login-body *{
            /*border: 1px solid red;*/

        }

        .login-left{
            float: left;
            margin-left: 24%;
            width: 400px;
            height: 400px;

        }
        .line{
            float: left;
            border-right: 1px solid #ddd;
            height: 300px;
            margin-top: 28px;

        }

        .login-right{
            float: left;
            width: 480px;
            height: 400px;
        }
        .twoCodeImg{

            margin-left: 20%;
        }

        .n2233{
            width: 100%;
            height: 88px;
            position: relative;
        }
        .n2233 .n22{
            position: absolute;
            left: 4%;
            top: -90%;
        }
        .n2233 .n33{
            position: absolute;
            left: 65%;
            top: -79%;
        }

        .login-body .login-right *{
            /*border: 1px solid red;*/

        }
        .register{
            width: 50%;
            margin: 60px auto;
            height: 500px;
            /*border: 1px silver solid;*/
        }
        .form-group{
            width: 100%;
        }
        input{
            width: 60%;
            height:40px;
            margin: 15px 20%;
            padding-left: 10px;
            border-radius: 5px;
            border: 1px solid #c0c4cc;
        }
        input[type="submit"] {
            background: #00a1d6;
            color: white;
            font-size: 18px;
        }
        .pp{
            margin-left: 62%;
            margin-top: -20px;
        }

    </style>
</head>
<body>
<div class="header"></div>
<div class="login-body">
    <div data-v-3e357e28="" class="title-line"><span class="tit" style="font-size: 38px;">注册</span></div>
    <form action="doregister" method="post" class="register">
        <div class="form-group">
            <input type="text" placeholder="昵称" name="name">
        </div>
        <div class="form-group">
            <input type="password" placeholder="密码" name="password">
        </div>
        <div class="form-group">
            <input type="password" placeholder="确认密码" name="passwordAgain" >
        </div>
        <div class="form-group">
            <input type="text" placeholder="填写常用电话号码" name="tel">
        </div>
        <div class="form-group"><input type="submit" value="注册"></div>
        <p class="pp"><a href="login">已有账号，直接登录></a></p>
    </form>

</div>
<div class="footer"></div>
</body>
</html>