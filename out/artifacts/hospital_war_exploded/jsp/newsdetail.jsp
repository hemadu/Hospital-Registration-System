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
<h3 class="last-updated">
	<c:if test="${type==0}">新闻详情</c:if>
	<c:if test="${type!=0}">公告详情</c:if>
</h3>
			<div class="instrument" style="padding-top: 0px;">
				<div class="container">
					<div class="instrument-view">
						<div class="col-md-6 ins-image">
							<img src="${pageContext.request.contextPath}/images/${news.pic}" title="instrument" alt="" />
						</div>
						<div class="col-md-6 ins-details">
							<div class="ins-name">
								<h3>内容</h3>
								<p>${news.content}</p>
							</div>
							<div class="span span1"  style="margin-top: 90px;">
								<p class="left">标题</p>
								<p class="right">: ${news.title}</p>
								<div class="clearfix"></div>
							</div>
							<div class="span span2">
								<p class="left">类型</p>
								<p class="right">: ${news.type==1?"公告":"新闻"}</p>
								<div class="clearfix"></div>
							</div>
							<div class="span span1">
								<p class="left">时间</p>
								<p class="right">: <fmt:formatDate value="${news.time}" type="date"/></p>
								<div class="clearfix"></div>
							</div>
						</div>
						<div class="clerfix"></div>
				</div>
			</div>
			</div>
			<!--- /instrument ---->
		</section>
		<!-- //instrument-section -->
		<!-- book an appointment -->
<%@include file="/jsp/foot.jsp"%>
</body>
</html>