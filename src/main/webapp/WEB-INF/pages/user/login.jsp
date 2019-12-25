<%--
  Created by IntelliJ IDEA.
  User: jiwei
  Date: 2019/12/25
  Time: 14:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>登录</title>
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
            background-image: url("../../../static/images/login/login1.png");

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
        .login-body .login-right li{
            list-style: none;
        }
        .login-right ul{
            width: 80%;
            margin-left: 10%;
            margin-top: 20px;
        }

        .login-right ul li input[type="text"]{
            margin-top: 20px;
            width: 100%;
            height: 18px;
            padding: 10px;
        }
        .login-right ul li input[type="password"]{
            margin-top: 50px;
            width: 100%;
            height: 18px;
            padding: 10px;
        }
        .login-right ul li input[type="checkbox"]{
            margin-top: 40px;
        }
        .loginAndRegister{
            width: 80%;
            margin-left: 10%;
            margin-top: 30px;

        }
        .loginAndRegister .login{


        }
        .loginAndRegister .login input{
            background-color: #00a7de;
            padding: 10px;
            width: 173px;
            height: 40px;
            border: 1px solid #0381aa;
            font-size:15px;
            color: #fff;
            border-radius: 1px;


        }
        .loginAndRegister .login input:hover{
            background-color: #00BEE7;
        }
        .loginAndRegister .register {
            background-color: #fff;
            width: 173px;
            height: 40px;
            border: 1px solid #ccc;
            font-size:15px;
            color: #ccc;
            border-radius: 1px;
            text-align: center;
            line-height: 40px;
        }
        .loginAndRegister .register:hover{
            background-color: #F7F7F7;

        }
        .loginAndRegister .register a{
            
            text-underline-style: none;
            color: #000;

        }

    </style>
</head>
<body>
<div class="header"></div>
<div class="login-body">
    <div data-v-3e357e28="" class="title-line"><span class="tit" style="font-size: 38px;">登录</span></div>
    <div class="login-left">
        <div class="twoCode">
            <img src="../static/images/login/twoCade.png" alt="" width="247" height="241" class="twoCodeImg">
        </div>
        <div class="login-info">
            <p class="app-link" style="text-align: center;color: #717171;font-size: 14px;">
                请使用 <a href="#" target="_blank">plipli客户端</a>
                <br>扫码登录<br>或扫码下载APP
            </p>
        </div>
        <div class="n2233">
            <img src="../static/images/login/22.png" alt="" class="n22" width="120">
            <img src="../static/images/login/33.png" alt="" class="n33" width="126">
        </div>
    </div>
    <div class="line"></div>
    <div class="login-right">
        <form action="checkuser" method="post">
            <div  class="input-box">
                <ul>
                    <li class="item username status-box">
                        <input type="text" value="" placeholder="你的手机号/邮箱" name="account" maxlength="50" autocomplete="off" class="">
                    </li>

                    <li class="item password status-box">
                        <input type="password" placeholder="密码" name="password" class="">
                    </li>

                    <li class="remember">
                        <label><input type="checkbox" name="remember">记住我</label>
                    </li>
                </ul>
                <div class="loginAndRegister">
                    <div class="login" style="float: left;"><input type="submit" value="登录"></div>
                    <div class="register" style="float: right;"><span><a href="register">注册</a></span></div>
                </div>
            </div>
        </form>
    </div>
</div>
<div class="footer"></div>
</body>
</html>