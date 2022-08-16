<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    session.setAttribute("path", path);
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>登录界面</title>
    <link href="${path}/static/css/style.css" rel="stylesheet" type="text/css"/>
    <script src="${path}/static/js/jquery-2.1.0.js"></script>
</head>

<body>
<div id="web">
    <p style="height:180px;"></p>
    <p align="center"><img src="${path}/static/img/logzi.png"/></p>
    <p style="height:40px;"></p>
    <div class="login">
        <div class="banner">
            <iframe id="frame_banner" src="${path}/static/sban/banner.html" height="218" width="100%"
                    allowtransparency="true"
                    title="test" scrolling="no" frameborder="0"></iframe>
        </div>
        <form action="/employ/isLogin" method="post" onsubmit="return checkSub()">
            <div class="logmain">
                <h1>&nbsp;</h1>
                <div class="logdv">
                    <span class="logzi">账 号：</span>
                    <input name="ename" type="text" id="ename" class="ename"/>
                </div>
                <div class="logdv">
                    <span class="logzi">密 码：</span>
                    <input name="epass" type="password" id="epass" class="epass"/>
                </div>
                <div class="logdv">
                    <p class="logzi">&nbsp;</p>
                    <a href="#" class="more">忘记密码</a>
                    <input name="" type="checkbox" value="" class="cex"/>记住密码
                </div>
                <div class="logdv" style="height:40px;">
                    <p class="logzi">&nbsp;</p>
                    <input name="提交" type="submit" class="btnbg" value="点击登录"/>
                </div>
                <div>
                    <a href="#" class="more">注册</a>
                </div>
            </div>
        </form>
    </div>
    <p style="height:100px;"></p>
    <script>

        var bname = false;//默认账号验证失败
        var bpass = false;//默认密码验证失败

        $(function () {
            $("#ename").blur(function () {
                //对账号进行验证
                var ename = $("#ename").val().trim();//获取账号文本框输入的值
                if (ename.length >= 2 && ename.length <= 20) {//账号验证成功
                    var reg = /[^A-z0-9]/;
                    if (!reg.test(ename)) {//ename不包含非字母和数字字符
                        $.ajax({//验证账号是否存在
                            method: "GET",
                            url: "/employ/login",
                            data: {
                                ename: ename
                            },
                            success: function (result) {
                                console.log(result)
                                if (result == "true") {
                                    bname = true;
                                } else {
                                    bname = false;
                                }
                            }
                        });
                    } else {//ename包含非字母和数字字符
                        bname = false;
                    }
                } else {//账号验证失败
                    bname = false;
                }
            });
            $("#epass").blur(function () {
                //对密码进行验证
                var epass = $("#epass").val().trim();//获取密码文本框输入的值
                if (epass.length >= 2 && epass.length <= 20) {//密码验证成功
                    var reg = /[^A-z0-9]/;
                    if (!reg.test(epass)) {//密码不包含非数字和字母字符
                        bpass = true;
                    } else {//密码包含非数字和字母字符
                        bpass = false;
                    }
                } else {//密码验证失败
                    bpass = false;
                }
            });
        });

        function checkSub() {
            if (bname && bpass) {
                return true;
            } else {
                return false;
            }
        }
    </script>
</div>
</body>
</html>
<script src="https://cdn.jsdelivr.net/gh/stevenjoezhang/live2d-widget@latest/autoload.js"></script>