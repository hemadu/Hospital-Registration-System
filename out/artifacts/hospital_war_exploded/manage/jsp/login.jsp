<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@include file="/manage/jsp/script.jsp"%></head>
<body id="login">
  <div class="login-logo">
 </div>
  <h2 class="form-heading" style="font-size: 35px;">登录</h2>
  <div class="app-cam">
	  <form class="loginForm" action="${pageContext.request.contextPath}/doctor/login" name="actionForm" id="actionForm"  method="post" >
		  <input name="username" id="username"  type="text" class="text" value="d111" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'p111';}">
		<input  name="password" id="password" type="password" value="111" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '111';}">
		  <input type="radio" name="roles" value="0" checked style="margin-bottom:15px">医生
		  <input type="radio" name="roles" value="1" style="margin-left:15px">管理员
		  <div class="submit"><input type="submit"  value="登录"></div>

		<ul class="new" style="    margin: 0em 0 0 0;">
			<li class="new_left"><p><a href="${pageContext.request.contextPath }/doctor/mquery">返回</a></p></li>
			<li class="new_right"><p class="sign">没有账户 ?<a href="${pageContext.request.contextPath }/manage/jsp/register.jsp"> 注册</a></p></li>
			<div class="clearfix"></div>
		</ul>
	</form>
  </div>
</body>
<script>

</script>
</html>
