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
	<!-- header -->

	<%@include file="/jsp/nav.jsp"%>

	<!-- //header -->
		<!-- login-section -->
		<section class="login-page">
			<!--- login ---->
			<!-- login -->
			<div class="login">
				<div class="container">
					<h3>登录</h3>
							<div class="login-form-grids">
								<form  action="${pageContext.request.contextPath}/person/mlogin" method="post">
									<label class="test-info">用户名<span>*</span></label>
									<input type="text" name="username" placeholder="用户名" required=" " >
									<div class="clearfix"></div>
									<label class="test-info">密码 <span>*</span></label>
									<input type="password" name="password" placeholder="密码" required=" " >
									<div class="clearfix"></div>

									<input type="submit" value="登录">
								</form>
							</div>
							<h4>新用户？<a href="${pageContext.request.contextPath }/jsp/register.jsp">注册</a></h4>

						</div>
					</div>
				<!-- //login -->
			<!--- /login ---->
		</section>
		<!-- //login-section -->
		<!-- book an appointment -->

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
	<%@include file="/jsp/foot.jsp"%>
</body>
</html>