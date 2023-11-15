<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<nav class="navbar nav_bottom" role="navigation" style="padding: 20px 0 20px;height: 60px;margin-top: 0px;
">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header nav_2">
            <button type="button" class="navbar-toggle collapsed navbar-toggle1" data-toggle="collapse" data-target="#bs-megadropdown-tabs">Menu
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#"></a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-megadropdown-tabs">
            <ul class="nav navbar-nav nav_1" style="float: right;width: 77%;">
                <li><a href="${pageContext.request.contextPath}/doctor/mquery">预约</a></li>
                <li><a href="${pageContext.request.contextPath }/news/mquery?type=1">公告</a></li>
                <li><a href="${pageContext.request.contextPath }/news/mquery?type=0">新闻</a></li>
                <li><a
                    <c:if test="${userSession==null}">
                        href="${pageContext.request.contextPath }/jsp/login.jsp"
                    </c:if>
                    <c:if test="${userSession!=null}">
                        href="${pageContext.request.contextPath }/person/mupdate?id=${userSession.id}"
                    </c:if>
                >个人信息</a></li>
                <li><a
                    <c:if test="${userSession==null}">
                        href="${pageContext.request.contextPath }/jsp/login.jsp"
                    </c:if>
                    <c:if test="${userSession!=null}">
                        href="${pageContext.request.contextPath }/no/mquery?state=1"
                    </c:if>
                >预约信息</a></li>

                <c:if test="${userSession!=null}">

                <li class="dropdown">
                    <a href="#" class="dropdown-toggle avatar" data-toggle="dropdown">欢迎您：${userSession.name}</a>
                    <ul style="background-color: #367795;" class="dropdown-menu"><li class="m_2"><a href="javascript:toUpdate()"><i class="fa fa-shield"></i> 修改密码</a></li>
                        <li class="m_2"><a href="${pageContext.request.contextPath }/person/mlogout"><i class="fa fa-lock"></i> 退出</a></li>
                    </ul>
                </li>

</c:if>
<c:if test="${userSession==null}">
    <li>
        <a href="${pageContext.request.contextPath }/jsp/login.jsp">登录</a>
    </li>
</c:if>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div>
</nav>
<script>
    function toUpdate(){
        $("#updatePassModal").modal("show");
    }
</script>
<!-- Bootstrap Core CSS -->


