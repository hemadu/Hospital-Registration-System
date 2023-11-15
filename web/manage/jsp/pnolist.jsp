<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
  <%@include file="/manage/jsp/script.jsp"%>
</head>
<body>
<div id="wrapper">
     <!-- Navigation -->
    <%@include file="/manage/jsp/top.jsp"%>

    <div id="page-wrapper">

        <div class="col-md-12 graphs">
	   <div class="xs">
           <ol class="breadcrumb" style="font-size: 1.3em;line-height: 1.5px;padding: 8px 5px;">
               <li><a >预约管理</a></li>
<!--               <li class="active">Data</li>-->
           </ol>
           <div class="search-wrap" style="margin-left: 5px">
               <div class="search-content">
                   <form action="${pageContext.request.contextPath }/no/query" method="post" name="queryForm">
                       <input type="hidden" name="pageIndex" value="1"/>
                       <div class="input-group">
                           <table class="search-tab">
                               <tbody><tr>
                                   <th width="80">预约状态:</th>
                                   <td>
                                       <select name="state" style="height: 35px;width:90px;margin-right: 40px;padding:0 5px;border: 1px solid #e0e0e0;font-size: 0.85em;color: #999;font-weight: bold;">
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

                                   <th width="50">科室:</th>
                                   <td>
                                       <select name="sid" style="height: 35px;width:90px;margin-right: 40px;padding:0 5px;border: 1px solid #e0e0e0;font-size: 0.85em;color: #999;font-weight: bold;">
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
                                   </td>


                                   <th width="50">类别:</th>
                                   <td>
                                       <select name="type" style="height: 35px;width:90px;margin-right: 40px;padding:0 5px;border: 1px solid #e0e0e0;font-size: 0.85em;color: #999;font-weight: bold;">
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
                                   </td>
                                   <th width="50" >姓名:</th>
                                   <td ><input style="margin-right: 100px;" type="text" name="name" value="${name}" class="form-control1 input-search" placeholder="Search..."></td>
                                   <td ><span class="input-group-btn">
                                    <button class="btn btn-success" type="submit"><i class="fa fa-search"></i></button>
                                        </span></td>
                               </tr>
                               </tbody>

                           </table>

                       </div><!-- Input Group -->
                   </form>
               </div>
           </div>


<div class="panel panel-warning" style="margin-top: 0em;" data-widget="{&quot;draggable&quot;: &quot;false&quot;}" data-widget-static="">
<div class="panel-body no-padding" style="padding: 0px;">
<table class="table table-striped">
<thead>
<tr class="warning">
    <th>科室</th>
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
</thead>
<tbody>
<c:forEach var="no" items="${pageInfo.list}" varStatus="status">
    <tr>
    <td>${no.doctor.sector.name}</td>
    <td>${no.doctor.name}</td>
    <td>${no.doctor.age}</td>
    <td>${no.doctor.phone}</td>
    <td>${no.doctor.sex}</td>
    <td>${no.doctor.type==1?"专家":"医生"}</td>
    <td>${no.doctor.num}</td>
    <td>${no.price}</td>
        <c:if test="${state==0}">
        <td><fmt:formatDate value="${no.atime}" type="date"/>
            </c:if>
            <c:if test="${state!=0}">
        <td><fmt:formatDate value="${no.date}" type="date"/>
            </c:if>

            <c:if test="${no.time==1}">
                8:00-9:30
            </c:if>
            <c:if test="${no.time==2}">
                9:30-11:00";
            </c:if>
            <c:if test="${no.time==3}">
                2:00-3:30";
            </c:if>
            <c:if test="${no.time==4}">
                3:30-5:00";
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
    </tbody>
    </table>
    </div>
    </div>
           <c:import url="rollpage.jsp"></c:import>
       </div>
   </div>

      </div>
      <!-- /#page-wrapper -->
   </div>
    <!-- /#wrapper -->
<!-- Nav CSS -->

<!--外层的div-->
<%@include file="/manage/jsp/bottom.jsp"%>
<script type="text/javascript" src="${pageContext.request.contextPath }/manage/js/nolist.js"></script>
</body>
</html>
