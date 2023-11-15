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
               <li><a >医生管理</a></li>
<!--               <li class="active">Data</li>-->
           </ol>
           <div class="search-wrap" style="margin-left: 5px">
               <div class="search-content">
                   <form action="${pageContext.request.contextPath }/doctor/query" method="post" name="queryForm">
                       <input type="hidden" name="pageIndex" value="1"/>
                       <div class="input-group">
                           <table class="search-tab">
                               <tbody><tr>


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
                                   <td ><input style="margin-right: 100px;" type="text" name="name" value="${name}" class="form-control1 input-search" placeholder="请输入医生姓名"></td>
                                   <td ><span class="input-group-btn">
                                    <button class="btn btn-success" type="submit"><i class="fa fa-search"></i></button>
                                        </span></td>
                               </tr>
                               </tbody>
                               <button  style="padding: 3px 6px;height: 30px;margin-left: 2px;float: right;margin-top: 5px" type="button"  class="btn btn-default"><a style="text-decoration: none;"  href="${pageContext.request.contextPath}/doctor/add"><i class="fa fa-plus" aria-hidden="true"></i>增加</a></button>

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
    <th>操作</th>
</tr>
</thead>
<tbody>
<c:forEach var="doctor" items="${pageInfo.list}" varStatus="status">
    <tr>
    <td>${doctor.sector.name}</td>
<%--    <td><img src="${pageContext.request.contextPath}/images/${doctor.pic}"  style="max-width:35px;"></td>--%>
    <td>${doctor.name}</td>
    <td>${doctor.age}</td>
    <td>${doctor.phone}</td>
    <td>${doctor.sex}</td>
    <td>${doctor.type==1?"专家":"医生"}</td>
    <td>${doctor.num}</td>
        <td >
            <button  style="padding:2px 6px;" type="button" class="btn btn-sm btn-info"><a style="text-decoration: none;color: white;" class="updateNo" href="${pageContext.request.contextPath}/doctor/updateList?id=${doctor.id}" ><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a></button>
            <button style="padding: 2px 6px;text-decoration: none;color: white;" type="button" class="btn btn-sm btn-danger deleteSector"><a style="text-decoration: none;color: white;" class="deleteNo" href="javascript:del(${doctor.id})" ><i class="fa fa-trash-o" aria-hidden="true"></i></a></button>
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
<script>
    // if(confirm("是否删除 ")){
    //     location.href="..goods?action=del&id="+id;
    // }
    function del(obj){
        if(confirm("是否删除 ")){
            $.ajax({
                type:"GET",
                url:"${pageContext.request.contextPath }/doctor/del/"+obj ,
                // data:{method:"deluser",uid:obj.attr("userid")},
                dataType:"json",
                success:function(data){
                    if(data.delResult == "true"){//删除成功：移除删除行
                        alert("删除成功");
                    }else if(data.delResult == "false"){//删除失败
                        alert("对不起，删除失败");
                    }else if(data.delResult == "notexist"){
                        alert("对不起，该医生不存在");
                    }
                },
                error:function(data){
                    alert("对不起，删除失败");
                }
            });
        }
        location.reload();
    }
</script>
</body>
</html>
