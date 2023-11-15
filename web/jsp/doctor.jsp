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
<h3 class="last-updated">预约信息</h3>
			<div class="instrument" style="padding-top: 0px;">
				<div class="container">
					<div class="instrument-view">

						<div class="col-md-6 ins-details">
							<div class="span span1"  style="margin-top: 50px;">
								<p class="left">医生姓名</p>
								<p class="right">: ${doctor.name}</p>
								<div class="clearfix"></div>
							</div>
							<div class="span span2">
								<p class="left">类型</p>
								<p class="right">: ${doctor.type==1?"专家":"医生"}</p>
								<div class="clearfix"></div>
							</div>

							<div class="span span1">
								<p class="left">部门</p>
								<p class="right">: ${doctor.sector.name}</p>
								<div class="clearfix"></div>
							</div>
							<div class="span span2">
								<p class="left">性别</p>
								<p class="right">: ${doctor.sex}</p>
								<div class="clearfix"></div>
							</div>
							<div class="span span1">
								<p class="left">年龄</p>
								<p class="right">: ${doctor.age}</p>
								<div class="clearfix"></div>
							</div>
							<div class="span span2">
								<p class="left">电话</p>
								<p class="right">: ${doctor.phone}</p>
								<div class="clearfix"></div>
							</div>



						</div>
						<div class="col-md-6 timing" style="margin-top: 45px;padding-bottom: 20px;">
							<form action="${pageContext.request.contextPath }/no/padd" method="post" id="myForm" onsubmit="return check()">
								<input type="hidden" name="did" id="did" value="${doctor.id}"/>
								<div class="opening-hours">
								<h3><i class="fa fa-clock-o"></i>预约时间</h3>
								<ul>
									<li>预约日期</li>
									<select id="date" name="date" class="form-control jb_1"style="margin-top: 30px;margin-bottom: 0px;">
										<option value="0">--可预约时间--</option>
										<c:if test="${dateList != null}">
											<c:forEach var="date" items="${dateList}">
												<option value="<fmt:formatDate value="${date}" type="date"/>" style="color: #999;font-weight: bold;"
												><fmt:formatDate value="${date}" type="date"/></option>
											</c:forEach>
										</c:if>
									</select>
									<div class="clearfix"></div>
								</ul>
								<ul>
									<li>预约时间</li>
									<select id="time" name="time" class="form-control jb_1" style="margin-top: 30px;margin-bottom: 0px;">
										<option value="0">--可预约时段--</option>

										<option value="1" style="color: #999;font-weight: bold;">
														8:00-9:30
										</option>
										<option value="2" style="color: #999;font-weight: bold;">
														9:30-11:00
										</option>
										<option value="3" style="color: #999;font-weight: bold;">
														2:00-3:30
										</option>
										<option value="4" style="color: #999;font-weight: bold;">
														3:30-5:00
										</option>

									</select>
									<div class="clearfix"></div>
								</ul>
							</div>
							<div class="help" style="margin-top: 20px;">
								<button  type="button" onclick="check()"  class="btn btn-default btn-default_2 pull-left">确认</button>
							</div>
							</form>
						</div>
						<div class="clerfix"></div>
				</div>
			</div>
			</div>
			<!--- /instrument ---->
		</section>
		<!-- //instrument-section -->
		<!-- book an appointment -->

<script src="${pageContext.request.contextPath}/manage/js/jquery.min.js"></script>
<script>
	function check(){

		if($("#time").val()==0||$("#date").val()==0){
			alert("请选择预约时间");
			return false;
		}else{
			var time=$("#time").val();
			var date=$("#date").val();
			var did=$("#did").val();
			$.getJSON("${pageContext.request.contextPath }/no/padd?did="+did+"&time="+time+"&date="+date,{},function(data){
				if(data.Result == "true"){
					alert("预约成功");
				}else if(data.Result == "false"){
					alert("该预约单不存在");
				}else if(data.Result == "error"){
					alert("该时段预约量已达上限！");
				}else{
					alert("预约失败");
				}
			});
		}
	}

</script>
<%@include file="/jsp/foot.jsp"%>
</body>
</html>

