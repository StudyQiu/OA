<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                <form class="am-form am-form-horizontal" action="${path}/employ/editEmp" target="right" method="post"
                      style="padding-top: 30px;">
                    <input value="${editEmp.eid}" name="eid" type="hidden">
                    <div class="am-form-group">
                        <label for="ename" class="am-u-sm-3 am-form-label">
                            用户名
                        </label>
                        <div class="am-u-sm-9">
                            <input type="text" id="ename" placeholder="请输入用户用户名" name="ename"
                                   value="${editEmp.ename}"/>
                            <small>输入用户名。</small>
                        </div>
                    </div>
                    <div class="am-form-group">
                        <label for="epass" class="am-u-sm-3 am-form-label">
                            密码
                        </label>
                        <div class="am-u-sm-9">
                            <input type="text" id="epass" placeholder="请输入用户密码" name="epass"
                                   value="${editEmp.epass}"/>
                            <small>输入密码。</small>
                        </div>
                    </div>
                    <div class="am-form-group">
                        <label for="realname" class="am-u-sm-3 am-form-label">
                            员工姓名
                        </label>
                        <div class="am-u-sm-9">
                            <input id="realname" required="" placeholder="请输入员工姓名" value="${editEmp.realname}"
                                   name="realname" type="text">
                            <small id="helpRole">输入员工姓名。</small>
                        </div>
                    </div>

                    <div class="am-form-group">
                        <label for="esex" class="am-u-sm-3 am-form-label">
                            性别
                        </label>
                        <div class="am-u-sm-9">
                            <c:if test="${editEmp.esex==0}">
                                <input type="radio" id="esex" name="esex" value="0" checked="checked"/> 男
                                <input type="radio" name="esex" value="1" style="margin-left: 30px;"/> 女<br>
                            </c:if>
                            <c:if test="${editEmp.esex==1}">
                                <input type="radio" id="esex" name="esex" value="0"/> 男
                                <input type="radio" name="esex" value="1" checked="checked"
                                       style="margin-left: 30px;"/> 女<br>
                            </c:if>
                            <small>选择性别。</small>
                        </div>
                    </div>
                    <div class="am-form-group">
                        <label for="sal" class="am-u-sm-3 am-form-label">
                            底薪
                        </label>
                        <div class="am-u-sm-9">
                            <input id="sal" required="" placeholder="请输底薪" value="${editEmp.sal}" name="sal"
                                   type="text">
                            <small id="helpSal">输入底薪。</small>
                        </div>
                    </div>
                    <div class="am-form-group">
                        <label for="position" class="am-u-sm-3 am-form-label">
                            员工职位
                        </label>
                        <div class="am-u-sm-9">
                            <select id="position" placeholder="请选择员工职位" name="position">
                                <c:if test="${editEmp.position == 0}">
                                    <option value="2">普通员工</option>
                                    <option value="1">部门主管</option>
                                    <option value="0" selected="selected">总裁/总经理</option>
                                </c:if>
                                <c:if test="${editEmp.position == 1}">
                                    <option value="2">普通员工</option>
                                    <option value="1" selected="selected">部门主管</option>
                                    <option value="0">总裁/总经理</option>
                                </c:if>
                                <c:if test="${editEmp.position == 2}">
                                    <option value="2" selected="selected">普通员工</option>
                                    <option value="1">部门主管</option>
                                    <option value="0">总裁/总经理</option>
                                </c:if>
                            </select>
                            <small>请选择员工职位。</small>
                        </div>
                    </div>
                    <div class="am-form-group">
                        <label for="did" class="am-u-sm-3 am-form-label">
                            所属部门
                        </label>
                        <div class="am-u-sm-9">
                            <select id="did" placeholder="请选择所属部门" name="did">
                                <c:forEach items="${dept}" var="dept">
                                    <c:if test="${editEmp.did==dept.did}">
                                        <option value="${dept.did}" selected="selected">${dept.dname}</option>
                                    </c:if>
                                    <c:if test="${editEmp.did!=dept.did}">
                                        <option value="${dept.did}">${dept.dname}</option>
                                    </c:if>
                                </c:forEach>
                            </select>
                            <small>选择所属部门。</small>
                        </div>
                    </div>
                    <div class="am-form-group">
                        <div class="am-u-sm-9 am-u-sm-push-3">
                            <input id="addRole" class="am-btn am-btn-success" value="编辑员工" type="submit">
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
