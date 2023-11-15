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
		  <!-- for easy-responsive-tabs -->	  
		<link rel="stylesheet" type="text/css" href="../css/easy-responsive-tabs.css " />
		<script src="../js/easyResponsiveTabs.js"></script>
		<script type="text/javascript">



    $(document).ready(function() {
        //Horizontal Tab
        $('#parentHorizontalTab').easyResponsiveTabs({
            type: 'default', //Types: default, vertical, accordion
            width: 'auto', //auto or any width like 600px
            fit: true, // 100% fit in a container
            tabidentify: 'hor_1', // The tab groups identifier
            activate: function(event) { // Callback function if tab is switched
                var $tab = $(this);
                var $info = $('#nested-tabInfo');
                var $name = $('span', $info);
                $name.text($tab.text());
                $info.show();
            }
        });

        // Child Tab
        $('#ChildVerticalTab_1').easyResponsiveTabs({
            type: 'vertical',
            width: 'auto',
            fit: true,
            tabidentify: 'ver_1', // The tab groups identifier
            activetab_bg: '#fff', // background color for active tabs in this group
            inactive_bg: '#F5F5F5', // background color for inactive tabs in this group
            active_border_color: '#c1c1c1', // border color for active tabs heads in this group
            active_content_border_color: '#5AB1D0' // border color for active tabs contect in this group so that it matches the tab head border
        });

        //Vertical Tab
        $('#parentVerticalTab').easyResponsiveTabs({
            type: 'vertical', //Types: default, vertical, accordion
            width: 'auto', //auto or any width like 600px
            fit: true, // 100% fit in a container
            closed: 'accordion', // Start closed if in accordion view
            tabidentify: 'hor_1', // The tab groups identifier
            activate: function(event) { // Callback function if tab is switched
                var $tab = $(this);
                var $info = $('#nested-tabInfo2');
                var $name = $('span', $info);
                $name.text($tab.text());
                $info.show();
            }
        });
    });
</script>
	<!-- //for easy-responsive-tabs -->
</head>
<body>
	<!-- header -->
	<%@include file="/jsp/nav.jsp"%>
	<h3 class="last-updated">预约列表</h3>
	<!-- //header -->
		<!-- Careers-section -->
		<section class="career-page">

			<!--- Careers ---->
			<div class="careers" style="padding-top: 0px;">
				<div class="container">

					<div class="job-lists">  
					   <div class="col-md-9 single_right">
					   <div class="lab-instruments">
						<div id="parentHorizontalTab">
							<div class="resp-tabs-container hor_1">
								<div>
									<div class="tab_grid" style="margin-bottom: 10px;">
										<div class="jobs-item with-thumb">
											<c:forEach var="doctor" items="${pageInfo.list}" varStatus="status">
											<div class="jobs_right" style="margin-left: 10px;margin-bottom: 30px;width: 250px;float: left;padding: 25px;background: rgba(247, 247, 247, 0.43);border: 1px solid rgba(0, 0, 0, 0.02);">
												<div class="date" style="background: #FFFFFF;"><img src="${pageContext.request.contextPath}/images/${doctor.pic}"  style="max-width: 60px;"></div>
												<div class="date_desc"><h6 class="title">${doctor.sector.name}  ${doctor.type==1?"专家":"医生"}</h6>
												  <span class="meta" style="font-size: 20px;">${doctor.name}</span>
												</div>
												<div class="clearfix"> </div>
												<p class="description"> <a

														<c:if test="${userSession==null}">
															href="${pageContext.request.contextPath }/jsp/login.jsp"
														</c:if>
														<c:if test="${userSession!=null}">
															href="${pageContext.request.contextPath}/doctor/mupdate?id=${doctor.id}";
														</c:if>

														class="read-more" style="font-size: 20px;margin-left: 20px;">预约医生</a></p>
											</div>
												</c:forEach>

											<div class="clearfix"> </div>
										</div>
									</div>
								</div>
							</div>

							<c:import url="rollpage.jsp"></c:import>

						</div>
					</div>
				   </div>
				   <div class="col-md-3">
						  <div class="widget_search" style="margin-top: 35px;">
							  <form action="${pageContext.request.contextPath }/doctor/mquery" method="post" name="queryForm">
								  <input type="hidden" name="pageIndex" value="1"/>

								  <h5 class="widget-title">查找</h5>
							<div class="widget-content">
								<span>科室</span>
								<select name="sid" class="form-control jb_1">
									<option value="">--请选择--</option>
									<c:if test="${sectorList != null}">
										<c:forEach var="sector" items="${sectorList}">
											<option value="${sector.id}" style="color: #999;font-weight: bold;"
													<c:if test="${sector.id==sid}">
														selected
													</c:if>
											>${sector.name}</option>
										</c:forEach>
									</c:if>
								</select>
								<span>类别</span>
								<select name="type"  class="form-control jb_1">
									<option value="">--请选择--</option>
									<option value="0" style="color: #999;font-weight: bold;"
											<c:if test="${type==0}">
												selected
											</c:if>
									>医生</option>
									<option value="1" style="color: #999;font-weight: bold;"
											<c:if test="${type==1}">
												selected
											</c:if>>专家</option>
								</select>
								<span>医生姓名</span>
								<input type="text" name="name" value="${name}" class="form-control jb_2" placeholder="请输入医生姓名">
								<input type="submit" class="btn btn-default" value="查找">
							</div>
							  </form>
						  </div>
					   </div>
				  <div class="clearfix"> </div>
				 </div>
			</div>
			</div>
			<!--Horizontal Tab-->
			<!--- /Careers ---->
		</section>
		<!-- //Careers-section -->
		<!-- book an appointment -->
	<%@include file="/jsp/foot.jsp"%>
		</body>

</html>