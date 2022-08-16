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
			.admin-main{
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
						<form class="am-form am-form-horizontal" action="${path}/addNote" target="right" method="post" style="padding-top: 30px;">
							<input value="504" name="roleId" type="hidden">
							<input id="eid" required="" placeholder="请输入部门名称" value="${emp.eid}" name="eid" type="hidden">
							<div class="am-form-group">
								<label for="realname" class="am-u-sm-3 am-form-label">
									申请人
								</label>
								<div class="am-u-sm-9">
									<input id="realname" required="" placeholder="" value="${emp.realname}" name="realname" type="text">

								</div>
							</div>
							<div class="am-form-group">
								<label for="title" class="am-u-sm-3 am-form-label">
									请假标题
								</label>
								<div class="am-u-sm-9">
									<textarea rows="" cols="50" id="title" placeholder="请输入请假标题" name="title"></textarea>
								</div>
							</div>
							<div class="am-form-group">
								<label for="context" class="am-u-sm-3 am-form-label">
									请假理由
								</label>
								<div class="am-u-sm-9">
									<textarea rows="" cols="50" id="context" placeholder="请输入请假理由" name="context"></textarea>
								</div>
							</div>
							<div class="am-form-group">
								<label for="startdate" class="am-u-sm-3 am-form-label">
									开始时间
								</label>
								<div class="am-u-sm-9">
									<input type="text" id="startdate" name="startdate" placeholder="请输入请假结束时间" />
								</div>
							</div>
							<div class="am-form-group">
								<label for="enddate" class="am-u-sm-3 am-form-label">
									结束时间
								</label>
								<div class="am-u-sm-9">
									<input type="text" id="enddate" name="enddate" placeholder="请输入请假结束时间" />
								</div>
							</div>
							<div class="am-form-group">
								<label for="length" class="am-u-sm-3 am-form-label">
									请假时长(天)
								</label>
								<div class="am-u-sm-9">
									<input type="text" id="length" name="length" placeholder="请输入请假结束时间" />
								</div>
							</div>
							<div class="am-form-group">
								<div class="am-u-sm-9 am-u-sm-push-3">
									<input id="addRole" class="am-btn am-btn-success" value="申请请假" type="submit">
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
