<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@include file="/jsp/top.jsp"%>

		<script type="text/javascript">
		jQuery(document).ready(function($) {
			$(".scroll").click(function(event){		
				event.preventDefault();
				$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
			});
		});
		</script>
		<!-- //for smooth scrolling -->
</head>
<body>
<%@include file="/jsp/nav.jsp"%>
<h3 class="last-updated" style="margin-bottom: 45px;">个人信息</h3>
<!-- //header -->
		<!-- Book-a-test-section -->
		<section class="book-a-test">
			<!--- Book-a-test ---->
			<div class="test-booking" style="padding-top: 0px;">
				<div class="container">
					<div class="text-booking-form">
						<div class="col-md-6 text-booking-form-left" style="width: 80%;">
							<form id="userForm" class="form-horizontal" name="userForm" method="post" action="${pageContext.request.contextPath }/person/mupdateexe">
								<input type="hidden"  name="id" value="${userSession.id}"/>

								<div class="btns">
									<label>头像 <span>*</span></label>
									<label id="picker" style="font-size: 14px;/* margin-left: 20px; */width: 90px;">选择头像</label>
									<img src="${pageContext.request.contextPath}/images/${userSession.pic}" id="show" style="max-width:60px;margin-bottom: 10px;max-height: 80px;"/>
								</div>
								<input  type="hidden" class="common-text required" id="img"  name="pic" value="${userSession.pic}">
								<label>姓名 <span>*</span></label>
									<input type="text" name="name"  value="${userSession.name}" class="phone" placeholder="">
									<div class="clearfix"></div>
								<label>年龄 <span>*</span></label>
								<input type="text" name="age"  value="${userSession.age}" class="phone" placeholder="">
								<div class="clearfix"></div>
								<label>电话 <span>*</span></label>
								<input type="text" name="phone"  value="${userSession.phone}"  class="phone" placeholder="">
								<div class="clearfix"></div>
								<div class="c-lang">
									<p class="update"><input type="radio" id="c1" checked name="sex" value="男"
												<c:if test="${userSession.sex=='男'}">checked</c:if>>男
										<input type="radio" name="sex" style="margin-left: 20px;"  value="女"
											   <c:if test="${userSession.sex=='女'}">checked</c:if>>女
								</div>
								<div class="clearfix"></div>
								<label>身份证号 <span>*</span></label>
								<input type="text"   value="${userSession.card}" class="phone" placeholder="" readonly="readonly">
								<div class="clearfix"></div>
								<label>用户名 <span>*</span></label>
								<input type="text"    value="${userSession.username}" class="phone" placeholder=""readonly="readonly">
								<div class="clearfix"></div>
								<label>身份 <span>*</span></label>
								<input  type="hidden"  value="${userSession.role}" readonly>
								<input type="text" value="${userSession.role==1?"管理员":"普通用户"}" class="phone" placeholder=""readonly="readonly">

								<div class="clearfix"></div>

									<div class="book-submit">
										<input type="submit" value="保存" style="margin-left: 250px;">
									</div>
							</form>
						</div>

						<div class="clearfix"></div>
					</div>

				</div>
			</div>
			<!--- /Book-a-test ---->
		</section>
		<!-- //Book-a-test-section -->

		<!-- footer -->

		<!-- //footer -->
		<script type="text/javascript">
						$(document).ready(function() {
							/*
							var defaults = {
					  			containerID: 'toTop', // fading element id
								containerHoverID: 'toTopHover', // fading element hover id
								scrollSpeed: 1200,
								easingType: 'linear'
					 		};
							*/

							$().UItoTop({ easingType: 'easeOutQuart' });

						});
					</script>
				<a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
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
<%@include file="/jsp/foot.jsp"%>
</body>
</html>