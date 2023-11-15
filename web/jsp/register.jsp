<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
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
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.ba-cond.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.slitslider.js"></script>
		<script type="text/javascript">	
			$(function() {
			
				var Page = (function() {

					var $nav = $( '#nav-dots > span' ),
						slitslider = $( '#slider' ).slitslider( {
							onBeforeChange : function( slide, pos ) {

								$nav.removeClass( 'nav-dot-current' );
								$nav.eq( pos ).addClass( 'nav-dot-current' );

							}
						} ),

						init = function() {

							initEvents();
							
						},
						initEvents = function() {

							$nav.each( function( i ) {
							
								$( this ).on( 'click', function( event ) {
									
									var $dot = $( this );
									
									if( !slitslider.isActive() ) {

										$nav.removeClass( 'nav-dot-current' );
										$dot.addClass( 'nav-dot-current' );
									
									}
									
									slitslider.jump( i + 1 );
									return false;
								
								} );
								
							} );

						};

						return { init : init };

				})();

				Page.init();

				/**
				 * Notes: 
				 * 
				 * example how to add items:
				 */

				/*
				
				var $items  = $('<div class="sl-slide sl-slide-color-2" data-orientation="horizontal" data-slice1-rotation="-5" data-slice2-rotation="10" data-slice1-scale="2" data-slice2-scale="1"><div class="sl-slide-inner bg-1"><div class="sl-deco" data-icon="t"></div><h2>some text</h2><blockquote><p>bla bla</p><cite>Margi Clarke</cite></blockquote></div></div>');
				
				// call the plugin's add method
				ss.add($items);

				*/
			
			});
		</script>

<div class="login">
	<div class="container">
		<h3>注册</h3>
		<div class="login-form-grids">
			<h5>个人信息</h5>
			<form action="${pageContext.request.contextPath }/person/madd"  onsubmit="return check()"   >
				<input type="text" name="name" placeholder="姓名" required/>
				<input type="text" name="age" placeholder="年龄" required/>
				<input type="text" name="phone" placeholder="电话" required/>
				<input type="text" name="card" placeholder="身份证号" required/>

			<div class="register-check-box animated wow slideInUp" data-wow-delay=".5s">
				<div class="check">
					<input type="radio" name="sex" value="男" checked>男
					<input type="radio" name="sex" value="女"style="margin-left: 20px;">女
				</div>
			</div>
			<h6 style="margin: 25px 0 25px !important;">登录信息</h6>

				<input type="text" name="username" placeholder="用户名" required/>
				<input type="password" name="password"  id="newpass1" placeholder="密码" required/>
				<input type="password" id="newpass2"placeholder="确认密码" required/>
				<input type="submit" value="注册">
			</form>
		</div>
		<p><a href="${pageContext.request.contextPath }/jsp/login.jsp">登录</a></p>
	</div>
</div>
<script>
	function check(){

		if($("#newpass1").val()!=$("#newpass2").val()){
			alert("两次密码不一致");
			return false;
		}else{
			return true;
		}
	}

</script>
<%@include file="/jsp/foot.jsp"%>
</body>
</html>