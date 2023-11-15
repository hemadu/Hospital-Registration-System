<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<%@include file="/manage/jsp/script.jsp"%>
	<meta charset="utf-8">
	<title>ECharts</title>
	<!-- 引入 echarts.js -->
	<script src="${pageContext.request.contextPath}/manage/js/echarts.min.js"></script>
</head>
<body>
<div id="wrapper">
	<!-- Navigation -->
	<%@include file="/manage/jsp/top.jsp"%>
	<div id="page-wrapper">
		<div class="graphs">
			<div class="xs">
				<ol class="breadcrumb" style="font-size: 1.3em;line-height: 1.5px;padding: 8px 5px;">
					<li><a>统计</a></li>
					<!--               <li class="active">Data</li>-->
				</ol>

				<div class="search-wrap" style="margin-left: 5px">
					<div class="search-content">
<%--						enctype="multipart/form-data"--%>
						<form method="post"  id="formSubmit">
							<input type="hidden" name="pageIndex" value="1"/>
							<div class="input-group">
								<table class="search-tab">
									<tbody><tr>
										<th width="90" >查询日期:</th>
										<td ><input style="margin-right: 100px;" type="date" name="date" id="date" value="${date}" class="form-control1 input-search" placeholder="yyyy-MM-dd"></td>
										<td ><span class="input-group-btn">
							 		    <button class="btn btn-success" id="btn" onclick="submitFrom();" type="button"><i class="fa fa-search"></i></button>
                                        </span></td>
									</tr>
									</tbody>

								</table>

							</div><!-- Input Group -->
						</form>
					</div>
				</div>

				<!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
				<div id="main" style="width: 600px;height:400px;"></div>

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
<script type="text/javascript">
	// 基于准备好的dom，初始化echarts实例
	var myChart = echarts.init(document.getElementById('main'));
	// 指定图表的配置项和数据

	option = {
		title: {
			text: '就诊率与失约率',
			subtext: ''
		},
		tooltip: {
			trigger: 'axis',
			axisPointer: {
				type: 'shadow'
			}
		},
		legend: {
			data: ['就诊率', '失约率']
		},
		grid: {
			left: '3%',
			right: '4%',
			bottom: '3%',
			containLabel: true
		},
		xAxis: {
			type: 'value',
			boundaryGap: [0, 0]
		},
		yAxis: {
			type: 'category',
			data: []
		},
		series: [
			{
				name: '就诊率',
				type: 'bar',
				data: []
			},
			{
				name: '失约率',
				type: 'bar',
				data: []
			}
		]
	};

	$.getJSON("${pageContext.request.contextPath }/no/getSumNow",{},function(data){
		for(var i=0;i<data.length;i++){
			option.yAxis.data.push(data[i].noName);
			option.series[0].data.push(data[i].num1);
			option.series[1].data.push(data[i].num2);
		}
		myChart.setOption(option);
	});

	function submitFrom(){
		var time = document.getElementById('date').value;
		if(time!=null&&time!=''){
		$.getJSON("${pageContext.request.contextPath }/no/getSum?date="+time,{},function(data){
			option.yAxis.data.length=0;
			option.series[0].data.length=0;
			option.series[1].data.length=0;
			for(var i=0;i<data.length;i++){
				option.yAxis.data.push(data[i].noName);
				option.series[0].data.push(data[i].num1);
				option.series[1].data.push(data[i].num2);
			}
			myChart.setOption(option);
		});
	}
	}
</script>
</body>
</html>
