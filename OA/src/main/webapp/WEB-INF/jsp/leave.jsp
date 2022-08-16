<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
	<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" href="${path}/static/css/amazeui.min.css" />
		<link rel="stylesheet" href="${path}/static/css/admin.css" />
	</head>

	<body>
		<div class="admin-content-body">
			<div class="am-cf am-padding am-padding-bottom-0">
				<div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">请假管理</strong><small></small></div>
			</div>

			<hr>

			<div class="am-g">
				<div class="am-u-sm-12 am-u-md-6">
					<div class="am-btn-toolbar">
						<div class="am-btn-group am-btn-group-xs">
							<button type="button" class="am-btn am-btn-default btnAdd"><span class="am-icon-plus"></span>申请请假</button>
							<button type="button" style="margin-left: 20px;" class="am-btn am-btn-default btnFindNotes"><span class="am-icon-archive"></span> 请假记录 </button>
							<button type="button" style="margin-left: 20px;" class="am-btn am-btn-default btnFindNoCheck"><span class="am-icon-archive"></span> 待审批</button>
							<button type="button" style="margin-left: 20px;" class="am-btn am-btn-default btnFindCheck"><span class="am-icon-archive"></span> 已审批 </button>

						</div>
					</div>
				</div>
				<div class="am-u-sm-12 am-u-md-3"></div>
			</div>
			<div class="am-g">
				<div class="am-u-sm-12">
					<form class="am-form">
						<table class="am-table am-table-striped am-table-hover table-main">
							<thead>
								<tr>
									<th class="table-check"><input type="checkbox" id="chkAll"></th>
									<th class="table-id" style="width:100px;">ID</th>
									<th class="table-title">申请人</th>
									<th class="table-title">请假标题</th>
									<th class="table-type">请假理由</th>
									<th class="table-dname">请假开始日期</th>
									<th class="table-role">请假结束日期</th>
									<th class="table-role">请假时长</th>
									<th class="table-role">请假提交时间</th>
									<th class="table-role">主管审批状态</th>
									<th class="table-role">领导审批时间</th>
									<c:if test="${type!=0 && (emp.did == 2 || emp.did == 1)}">
										<th class="table-set">操作</th>
									</c:if>
									<c:if test="${type!=0 && (emp.did != 2 && emp.did != 1)}">
										<th class="table-set">状态</th>
									</c:if>
								</tr>
							</thead>
							<tbody>
								<c:if test="${totalLine!=0}">
									<c:forEach items="${note}" var="note">
										<c:if test="${type==0}">
											<tr>
												<td><input type="checkbox" name="chk"></td>
												<td>${note.nid}</td>
												<td>${employees[note.eid]}</td>
												<td>${note.title}</td>
												<td>${note.context}</td>
												<td><fmt:formatDate value="${note.startdate}" pattern="yyyy年MM月dd日" /></td>
												<td class="am-hide-sm-only"><span class="am-badge  am-badge-danger "><fmt:formatDate value="${note.enddate}" pattern="yyyy年MM月dd日" /></span></td>
												<td>${note.length}天</td>
												<td><fmt:formatDate value="${note.subdate}" pattern="yyyy年MM月dd日" /></td>
												<td>
														${note.estatus==0?'待审批':note.estatus==1?'同意':note.estatus==2?'打回':'不同意'}
													<c:if test="${note.estatus==2}">
														<button type="button" class="am-btn am-btn-default am-btn-xs am-text-danger amt-hide-sm-only" onclick="editNote(${note.nid})"><span class="am-icon-trash-o"></span> 编辑</button>
													</c:if>
												</td>
												<td>
													<c:if test="${note.reldate == null}">
														----年--月--日
													</c:if>
													<c:if test="${note.reldate != null}">
														<fmt:formatDate value="${note.reldate}" pattern="yyyy年MM月dd日" />
													</c:if>
												</td>
											</tr>
										</c:if>
										<c:if test="${type==1&&note.estatus==0}">
											<tr>
												<td><input type="checkbox" name="chk"></td>
												<td>${note.nid}</td>
												<td>${employees[note.eid]}</td>
												<td>${note.title}</td>
												<td>${note.context}</td>
												<td><fmt:formatDate value="${note.startdate}" pattern="yyyy年MM月dd日" /></td>
												<td class="am-hide-sm-only"><span class="am-badge  am-badge-danger "><fmt:formatDate value="${note.enddate}" pattern="yyyy年MM月dd日" /></span></td>
												<td>${note.length}天</td>
												<td><fmt:formatDate value="${note.subdate}" pattern="yyyy年MM月dd日" /></td>
												<td>
														${note.estatus==0?'待审批':note.estatus==1?'同意':note.estatus==2?'打回':'不同意'}
												</td>
												<td>
													<c:if test="${note.reldate == null}">
														----年--月--日
													</c:if>
													<c:if test="${note.reldate != null}">
														<fmt:formatDate value="${note.reldate}" pattern="yyyy年MM月dd日" />
													</c:if>
												</td>
												<td>
													<c:if test="${emp.did == 2 || emp.did == 1 }">
														<div class="am-btn-toolbar">
															<div class="am-btn-group am-btn-group-xs">
																<button type="button" id="depart_24" class="am-btn am-btn-default am-btn-xs am-text-secondary" onclick="updateNoteEstatus(${note.nid},1, ${emp.eid})"><span class="am-icon-pencil-square-o"></span> 同意</button>
																<button type="button" class="am-btn am-btn-default am-btn-xs am-text-danger amt-hide-sm-only" onclick="updateNoteEstatus(${note.nid},2, ${emp.eid})"><span class="am-icon-trash-o"></span> 打回</button>
																<button type="button" id="depart_25" class="am-btn am-btn-default am-btn-xs am-text-secondary" onclick="updateNoteEstatus(${note.nid},3, ${emp.eid})"><span class="am-icon-pencil-square-o"></span> 不同意</button>
															</div>
														</div>
													</c:if>
													<c:if test="${emp.did != 2 && emp.did != 1 }">
														<font>待审批</font>
													</c:if>
												</td>
											</tr>
										</c:if>
										<c:if test="${type==2&&note.estatus!=0}">
											<tr>
												<td><input type="checkbox" name="chk"></td>
												<td>${note.nid}</td>
												<td>${employees[note.eid]}</td>
												<td>${note.title}</td>
												<td>${note.context}</td>
												<td><fmt:formatDate value="${note.startdate}" pattern="yyyy年MM月dd日" /></td>
												<td class="am-hide-sm-only"><span class="am-badge  am-badge-danger "><fmt:formatDate value="${note.enddate}" pattern="yyyy年MM月dd日" /></span></td>
												<td>${note.length}天</td>
												<td><fmt:formatDate value="${note.subdate}" pattern="yyyy年MM月dd日" /></td>
												<td>
														${note.estatus==0?'待审批':note.estatus==1?'同意':note.estatus==2?'打回':'不同意'}
												</td>
												<td>
													<c:if test="${note.reldate == null}">
														----年--月--日
													</c:if>
													<c:if test="${note.reldate != null}">
														<fmt:formatDate value="${note.reldate}" pattern="yyyy年MM月dd日" />
													</c:if>
												</td>
												<td><font>已审批</font></td>
											</tr>
										</c:if>
									</c:forEach>

								</c:if>
								<c:if test="${totalLine==0}">
									<c:if test="${type==0}">
										<tr>
											<td colspan="11">您还没有请假记录！</td>
										</tr>
									</c:if>
									<c:if test="${type==1}">
										<tr>
											<td colspan="12">您没有待审批的请假记录！</td>
										</tr>
									</c:if>
									<c:if test="${type==2}">
										<tr>
											<td colspan="12">您没有已审批的请假记录！</td>
										</tr>
									</c:if>
								</c:if>
							</tbody>
						</table>
						<c:if test="${totalLine!=0}">
							<div class="am-cf">
								共 ${totalLine} 条记录
								<div class="am-fr">
									<ul class="am-pagination">
										<c:if test="${page>1}">
											<li>
												<a href="${path}/selectNote?page=${page - 1}&length=4&type=${type}&eid=${emp.eid}">«</a>
											</li>
										</c:if>
										<c:if test="${page == 1}">
											<li class="am-disabled">
												<a href="${path}/selectNote?page=${page - 1}&length=4&type=${type}&eid=${emp.eid}">«</a>
											</li>
										</c:if>
										<c:forEach begin="1" end="${totalPage}" step="1" var="i">
											<c:if test="${page == i}">
												<li class="am-active">
													<a href="${path}/selectNote?page=${i}&length=4&type=${type}&eid=${emp.eid}">${i}</a>
												</li>
											</c:if>
											<c:if test="${page != i}">
												<li>
													<a href="${path}/selectNote?page=${i}&length=4&type=${type}&eid=${emp.eid}">${i}</a>
												</li>
											</c:if>
										</c:forEach>
										<c:if test="${page < totalPage}">
											<li>
												<a href="${path}/selectNote?page=${page + 1}&length=4&type=${type}&eid=${emp.eid}">»</a>
											</li>
										</c:if>
										<c:if test="${page == totalPage}">
											<li class="am-disabled">
												<a href="${path}/selectNote?page=${page + 1}&length=4&type=${type}&eid=${emp.eid}">»</a>
											</li>
										</c:if>
									</ul>
								</div>
							</div>
						</c:if>
						<hr>
					</form>
				</div>
			</div>
		</div>

		<script type="text/javascript" src="${path}/static/js/jquery-1.11.3.min.js" ></script>
		<script type="text/javascript" src="${path}/static/myplugs/js/plugs.js" ></script>
		<script>
			$(function() {
				$("#chkAll").chkAll({
					/*name: "chk"*/
				});
				
				$(".btnAdd").click(function() {

					$.jq_Panel({
						title: "申请请假",
						iframeWidth: 500,
						iframeHeight: 300,
						url: "${path}/addLeave"
					});
				});
				

				$(".btnFindNotes").click(function() {
					var eid = '${emp.eid}';
					window.location.href = "${path}/selectNote?page=1&length=4&type=0&eid="+eid;
				});
				$(".btnFindNoCheck").click(function() {
					var eid = '${emp.eid}';
					window.location.href = "${path}/selectNote?page=1&length=4&type=1&eid="+eid;
				});
				$(".btnFindCheck").click(function() {
					var eid = '${emp.eid}';
					window.location.href = "${path}/selectNote?page=1&length=4&type=2&eid="+eid;
				});
			});
			
			function updateNoteEstatus(nid, estatus, eid) {
				window.location.href = "${path}/updateNote?nid="+nid+"&estatus="+estatus+"&eid="+eid;
			}

			function editNote(nid) {
				$.jq_Panel({
					title: "修改请假",
					iframeWidth: 500,
					iframeHeight: 300,
					url: "${path}/selectNoteLeave?nid="+nid
				});
			}
		</script>
	</body>

</html>