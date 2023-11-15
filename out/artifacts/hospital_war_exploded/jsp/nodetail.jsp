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

	<!-- //header -->
		<!-- Test-list-section -->
		<section class="test-menu">
			<h3 class="last-updated" style="margin-bottom: 10px;">预约信息</h3>
			<!--- Test-list ---->
			<div class="test-list" style="padding-top: 20px;">

				<form action="${pageContext.request.contextPath }/no/mquery" method="post" name="queryForm">
					<input type="hidden" name="pageIndex" value="1"/>
					<div class="container">

						<tbody><tr>
						<td>
							<select name="state" style="margin-top: 20px;height: 35px;width:90px;margin-right: 40px;padding:0 5px;border: 1px solid #e0e0e0;/* font-size: 0.85em; */color: #999;font-weight: bold;">

									<option value="0" style="color: #999;font-weight: bold;"
											<c:if test="${state==0}">
												selected
											</c:if>
									>未预约</option>
									<option value="1" style="color: #999;font-weight: bold;"
											<c:if test="${state==1}">
												selected
											</c:if>>已预约</option>
									<option value="2"  style="color: #999;font-weight: bold;"
											<c:if test="${state==2}">
												selected
											</c:if>>已赴约</option>
							</select>
						</td>
						<td ><span>
                                    <button class="btn btn-success" type="submit"><i class="fa fa-search"></i></button>
                             </span>
						</td>
						</tr></tbody>
					<table style="width:100%;margin-top: 15px;">
					  <tr>
						  <th>部门</th>
						  <th>姓名</th>
						  <th>年龄</th>
						  <th>电话</th>
						  <th>性别</th>
						  <th>类别</th>
						  <th>单日预约量</th>
						  <th>缴费</th>
						  <th>时间</th>
						  <th>预约状态</th>
					  </tr>
						<c:forEach var="no" items="${pageInfo.list}" varStatus="status">
							<tr style="cursor: pointer;" onclick="location='test-desc.html'">
								<td>${no.doctor.sector.name}</td>
								<td>${no.doctor.name}</td>
								<td>${no.doctor.age}</td>
								<td>${no.doctor.phone}</td>
								<td>${no.doctor.sex}</td>
								<td>${no.doctor.type==1?"专家":"医生"}</td>
								<td>${no.doctor.num}</td>
								<td>${no.price}</td>
								<td><fmt:formatDate value="${no.date}" type="date"/>

									<c:if test="${no.time==1}">
										8:00-9:30
									</c:if>
									<c:if test="${no.time==2}">
										9:30-11:00
									</c:if>
									<c:if test="${no.time==3}">
										2:00-3:30
									</c:if>
									<c:if test="${no.time==4}">
										3:30-5:00
									</c:if>
								</td>
								<td>
									<c:if test="${no.state==0}">
										未预约
									</c:if>
									<c:if test="${no.state==1}">
										已预约
									</c:if>
									<c:if test="${no.state==2}">
										已赴约
									</c:if>
								</td>
							</tr>
						</c:forEach>
					</table>
						<c:import url="rollpage.jsp"></c:import>
				</div>
				</form>
			</div>

			<!--- /Test-list ---->
		</section>
		<!-- //Test-list-section -->
		<!-- book an appointment -->
<%@include file="/jsp/foot.jsp"%>
</body>
</html>
