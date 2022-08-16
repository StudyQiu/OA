<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<link rel="stylesheet" href="${path}/static/css/amazeui.min.css">
<link rel="stylesheet" href="${path}/static/css/admin.css">
<style>
    .admin-main{
        padding-top: 0px;
    }
</style>
<body>
<div class="am-cf admin-main">
    <div class="admin-content">
        <div class="admin-content-body">
            <div class="am-g">
                <form class="am-form am-form-horizontal" action="${path}/updateAndLogin" onsubmit="return check()" target="_parent" method="post" style="padding-top:30px;" data-am-validator>

                    <div class="am-form-group">
                        <label for="eid" class="am-u-sm-3 am-form-label">
                            员工编号 </label>
                        <div class="am-u-sm-9">
                            <input type="text" id="eid"  readonly value="${param.eid}" name="eid">
                        </div>
                    </div>

                    <div class="am-form-group">
                        <label for="epass" class="am-u-sm-3 am-form-label">
                            新密码 </label>
                        <div class="am-u-sm-9">
                            <input type="password" id="epass" required placeholder="请输入新密码" name="epass"> <small>输入新密码。</small>
                        </div>
                    </div>
                    <div class="am-form-group">
                        <label for="epass1" class="am-u-sm-3 am-form-label">
                            重复密码</label>
                        <div class="am-u-sm-9">
                            <input type="password" id="epass1" required placeholder="请输入重复密码" name="epass1" data-equal-to="#doc-vld-pwd-1"
                                   required> <small>输入重复密码。</small>
                        </div>
                    </div>
                    <div class="am-form-group">
                        <div class="am-u-sm-9 am-u-sm-push-3">
                            <input type="submit" id="btns" onsubmit="check()" class="am-btn am-btn-success" value="修改密码" />
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="${path}/static/js/jquery-1.11.3.min.js">
</script>
<script type="text/javascript" src="${path}/static/myplugs/js/plugs.js">
</script>
<script>
    function check(){
        var epass=$("#epass").val();
        var epass1=$("#epass1").val();
        if (epass == epass1){
            if (epass.length >= 2 && epass.length <= 20){
                alert("密码修改成功...")
                return true;
            }else {
                alert("密码太短或太长...")
                return false;
                }
        }else {
            alert("两次密码输入不一致！！！")
            return false;
        }
    }
</script>
</body>
</html>
