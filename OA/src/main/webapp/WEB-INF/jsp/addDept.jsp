<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>

    <link rel="stylesheet" href="${path}/static/css/amazeui.min.css">
    <link rel="stylesheet" href="${path}/static/css/admin.css">
    <style>
        .admin-main {
            padding-top: 0px;
        }
    </style>
</head>
<body>

<div class="am-cf admin-main">
    <!-- content start -->
    <div class="admin-content">
        <div class="admin-content-body">
            <div class="am-g">
                <form class="am-form am-form-horizontal" action="${path}/emp/addDept" target="right" method="post"
                      style="padding-top: 30px;">
                    <div class="am-form-group">
                        <label for="dname" class="am-u-sm-3 am-form-label">
                            部门名称
                        </label>
                        <div class="am-u-sm-9">
                            <input id="dname" required="" placeholder="请输入部门名称" value="" name="dname" type="text">
                            <small id="helpRole">输入部门名称。</small>
                        </div>
                    </div>
                    <div class="am-form-group">
                        <label for="duty" class="am-u-sm-3 am-form-label">
                            部门职责
                        </label>
                        <div class="am-u-sm-9">
                            <textarea rows="" cols="50" id="duty" placeholder="请输入部门职责" name="duty"></textarea>
                            <small>输入部门职责。</small>
                        </div>
                    </div>
                    <div class="am-form-group">
                        <div class="am-u-sm-9 am-u-sm-push-3">
                            <input id="addRole" class="am-btn am-btn-success" value="添加部门" type="submit">
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
