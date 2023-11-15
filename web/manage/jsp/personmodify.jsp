<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
	<%@include file="/manage/jsp/script.jsp"%>
</head>
<body>
<div id="wrapper">
	<!-- Navigation -->
	<%@include file="/manage/jsp/top.jsp"%>
	<div id="page-wrapper">
		<div class="graphs">
			<div class="xs">
				<ol class="breadcrumb" style="font-size: 1.3em;line-height: 1.5px;padding: 8px 5px;">
					<li><a>用户管理</a></li>
					<!--               <li class="active">Data</li>-->
				</ol>
				<div class="tab-content">
					<div class="tab-pane active" id="horizontal-form">
						<form id="userForm" class="form-horizontal" name="userForm" method="post" action="${pageContext.request.contextPath }/person/updateListexe">
							<input type="hidden"  name="id" value="${person.id}"/>

							<div class="form-group">
								<label for="focusedinput" class="col-sm-2 control-label">姓名</label>
								<div class="col-sm-8">
									<input type="text" class="form-control1" name="name"  value="${person.name}">
								</div>
							</div>
							<div class="form-group">
								<label for="focusedinput" class="col-sm-2 control-label">年龄</label>
								<div class="col-sm-8">
									<input type="text" class="form-control1" name="age" value="${person.age}">
								</div>
							</div>

							<div class="form-group">
								<label for="focusedinput" class="col-sm-2 control-label">电话</label>
								<div class="col-sm-8">
									<input type="text" class="form-control1" name="phone"  value="${person.phone}">
								</div>
							</div>

							<div class="form-group">
								<label for="disabledinput" class="col-sm-2 control-label">部门</label>
								<div class="col-sm-8">
									<select name="role" class="form-control1" style="height: 35px;width:90px;margin-right: 40px;padding:0 5px;border: 1px solid #e0e0e0;font-size: 0.85em;" >
										<option value="0"
												<c:if test="${person.role==0}">
													selected
												</c:if>
												class="form-control1">普通用户</option>
										<option value="1"
												<c:if test="${person.role==1}">
													selected
												</c:if>
												class="form-control1">管理员</option>

									</select>

								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-2 control-label">性别</label>
								<div class="col-sm-8">
									<div class="checkbox-inline"><label><input type="radio"  name="sex"  value="男"
									<c:if test="${person.sex=='男'}">checked
									</c:if>
									>男
									</label></div>
									<div class="checkbox-inline"><label><input type="radio"  name="sex"  value="女"
									<c:if test="${person.sex=='女'}">checked
									</c:if>
									> 女</label></div>
								</div>
							</div>

							<div class="form-group">
								<label for="disabledinput" class="col-sm-2 control-label">用户名</label>
								<div class="col-sm-8">
									<input readonly="readonly" type="text" class="form-control1" id="disabledinput" name="username" value="${person.username}">
								</div>
							</div>

							<div class="form-group">
								<label for="focusedinput" class="col-sm-2 control-label">
									身份证号
								</label>
								<div class="col-sm-8">
									<input type="text" readonly="readonly" class="form-control1" id="focusedinput"  name="num"  value="${person.card}">
								</div>
							</div>

<%--							<label id="picker" class="col-sm-2 control-label">选择头像</label>--%>


							<div class="btns" style="margin-left: 125px;">
								<label id="picker">选择头像</label>
								<img src="${pageContext.request.contextPath}/images/${person.pic}" id="show" style="max-width:40px;margin-left: 30px;margin-bottom: 10px;"/>
							</div>
							<input  type="hidden" class="common-text required" id="img"  name="pic" value="${person.pic}">

							<div class="form-group" style="margin-left: 500px;margin-top: 50px;" >
								<button type="submit" class="btn btn-primary" style="margin-right:40px">修改</button>
								<button type="button" onclick="history.go(-1)" class="btn btn-default">返回</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /#page-wrapper -->
</div>

<!-- /#wrapper -->
<!-- Nav CSS -->

<!--外层的div-->
<%@include file="/manage/jsp/bottom.jsp"%>
<link href="${pageContext.request.contextPath}/manage/css/custom.css" rel="stylesheet">

<!-- Metis Menu Plugin JavaScript -->
<script src="${pageContext.request.contextPath}/manage/js/metisMenu.min.js"></script>
<script src="${pageContext.request.contextPath}/manage/js/custom.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/webuploader/webuploader.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/webuploader/webuploader.css"/>
<script>
	var uploader = WebUploader.create({
		// swf文件路径
		swf : '${pageContext.request.contextPath }/webuploader/Uploader.swf',//高版本浏览器可以不要
		// 文件接收服务端。
		server : '${pageContext.request.contextPath }/upfile',
		// 选择文件的按钮。可选。
		// 内部根据当前运行是创建，可能是input元素，也可能是flash.
		pick : '#picker',
		// 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
		resize : false
	});
	//当选择文件之后，就开始上传
	uploader.on('fileQueued', function(file) {
		// 选中文件时要做的事情，比如在页面中显示选中的文件并添加到文件列表，获取文件的大小，文件类型等
		uploader.upload();//可以选择之后就上传
	});
	//上传成功后
	uploader.on("uploadSuccess", function(file, response) {
		alert("上传成功!");
		$("#show").attr("src","${pageContext.request.contextPath }/images/"+response.filename).show();
		$("#img").val(response.filename);//获取服务响应的文件名
	});

</script>
</body>
</html>
