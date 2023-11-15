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
	<c:if test="${type==0}">新闻</c:if>
	<c:if test="${type!=0}">公告</c:if>
</h3>
			<!--- blog ---->
			<div class="blog" style="padding-top: 0px;">
				<div class="container">

					<div class="bolg-posts">
						<form action="${pageContext.request.contextPath }/news/mquery?type=${type}" method="post" name="queryForm">
							<input type="hidden" name="pageIndex" value="1"/>
							<span style="font-size: 20px;">标题:</span>
							<input style="line-height: 29px;margin-bottom: 30px;" type="text" name="title" value="${title}" class="form-control1 input-search" placeholder="请输入标题">
							<span>
                                    <button style="margin-bottom: 2px;" class="btn btn-success" type="submit"><i class="fa fa-search"></i></button>
                                        </span>
							<c:forEach var="news" items="${pageInfo.list}" varStatus="status">
							<div class="col-md-12 blog-top">
								<div
									<c:if test="${status.count%2 != '0'}">
										class="blog-in"
									</c:if>
										<c:if test="${status.count%2 == '0'}">
											class="blog-in1"
										</c:if>
									>
									<a
											<c:if test="${status.count%2 != '0'}">
											class="blog-post"
											</c:if>
											<c:if test="${status.count%2 == '0'}">
											class="blog-post1"
											</c:if>
									><img src="${pageContext.request.contextPath}/images/${news.pic}" alt=" "></a>
									<div class="blog-grid">
										<div class="date">
											<span class="date-in"><i class="fa fa-calendar"></i><fmt:formatDate value="${news.time}" type="date"/></span>
											<div class="clearfix"> </div>
										</div>
										<h3><a>${news.title}</a></h3>
										<p>${news.content}</p>
										<a href="${pageContext.request.contextPath}/news/mupdate?id=${news.id}" class="smore">查看</a>
									</div>
									<div class="clearfix"></div>					
								</div>
								<i class="black"> </i>
							</div>
							</c:forEach>
							<div class="clearfix"> </div>
							<c:import url="rollpage.jsp"></c:import>
						</form>
					</div>
				</div>
			</div>
<%@include file="/jsp/foot.jsp"%>
</body>
</html>