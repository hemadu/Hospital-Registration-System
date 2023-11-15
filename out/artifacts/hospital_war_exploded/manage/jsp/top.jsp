<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>医院挂号系统</title>
</head>
<body>
<nav class="top1 navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand"  style="font-size: 22px;">医院预约系统后台</a>
    </div>
    <!-- /.navbar-header -->
    <ul class="nav navbar-nav navbar-right">
        <li class="dropdown">
            <a href="#" class="dropdown-toggle avatar" data-toggle="dropdown"><img src="${pageContext.request.contextPath}/manage/images/${userSession.pic}" alt=""/></a>
            <ul class="dropdown-menu">
                <li class="m_2"><a href="${pageContext.request.contextPath}/doctor/main"><i class="fa fa-tasks"></i>返回主页</a></li>
<%--                <li class="m_2"><a href="#"><i class="fa fa-wrench"></i> 个人资料</a></li>--%>
                <li class="m_2"><a href="javascript:toUpdate()"><i class="fa fa-shield"></i> 修改密码</a></li>
                <li class="m_2"><a href="${pageContext.request.contextPath}/doctor/logout"><i class="fa fa-lock"></i> 退出</a></li>
            </ul>
        </li>
    </ul>

    <div class="navbar-default sidebar" role="navigation">
        <div class="sidebar-nav navbar-collapse">
            <ul class="nav" id="side-menu">
<%--                <li>--%>
<%--                    <a href="index.html"><i class="fa fa-dashboard fa-fw nav_icon"></i>首页</a>--%>
<%--                </li>--%>

    <li>
        <a href="${pageContext.request.contextPath }/manage/jsp/index.jsp"><i class="fa fa-bars nav_icon"></i>首页</a>
    </li>

    <li>

        <c:if test="${roles==0}">
            <a href="${pageContext.request.contextPath }/doctor/update?id=${userSession.id}"><i class="fa fa-user nav_icon"></i>个人信息</a>
        </c:if>
        <c:if test="${roles!=0}">
            <a href="${pageContext.request.contextPath }/person/update?id=${userSession.id}"><i class="fa fa-user nav_icon"></i>个人信息</a>
        </c:if>

    </li>
                <c:if test="${roles!=1}">
                    <li>
                        <a href="${pageContext.request.contextPath }/no/query?roles=${roles}&state=0"><i class="fa fa-book nav_icon"></i>预约信息</a>
                    </li>
                </c:if>
    <c:if test="${roles==1}">
        <li>
            <a href="${pageContext.request.contextPath }/sector/query"><i class="fa fa-book nav_icon"></i>科室信息</a>
            <a href="${pageContext.request.contextPath }/doctor/query"><i class="fa fa-user-md nav_icon"></i>医生管理</a>
            <a href="${pageContext.request.contextPath }/person/query"><i class="fa fa-users nav_icon"></i>用户管理</a>
            <a href="${pageContext.request.contextPath }/news/query"><i class="fa fa-file-text-o nav_icon"></i>新闻管理</a>
        </li>
    </c:if>
    <c:if test="${roles==1}">
        <li>
            <a href="${pageContext.request.contextPath }/manage/jsp/sum.jsp"><i class="fa fa-level-up nav_icon"></i>统计</a>
        </li>
    </c:if>
            </ul>
        </div>
        <!-- /.sidebar-collapse -->
    </div>
    <!-- /.navbar-static-side -->
</nav>

<script>
    function toUpdate(){
        $("#updatePassModal").modal("show");
    }
</script>
<link href="${pageContext.request.contextPath}/manage/css/custom.css" rel="stylesheet">
<!-- Metis Menu Plugin JavaScript -->
<script src="${pageContext.request.contextPath}/manage/js/metisMenu.min.js"></script>
<script src="${pageContext.request.contextPath}/manage/js/custom.js"></script>

</body>
</html>