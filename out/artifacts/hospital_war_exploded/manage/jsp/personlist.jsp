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
               <li><a >用户管理</a></li>
<!--               <li class="active">Data</li>-->
           </ol>
           <div class="search-wrap" style="margin-left: 5px">
               <div class="search-content">
                   <form action="${pageContext.request.contextPath }/person/query" method="post" name="queryForm">
                       <input type="hidden" name="pageIndex" value="1"/>
                       <div class="input-group">
                           <table class="search-tab">
                               <tbody><tr>

                                   <th width="50">类别:</th>
                                   <td>
                                       <select name="role" style="height: 35px;width:90px;margin-right: 40px;padding:0 5px;border: 1px solid #e0e0e0;font-size: 0.85em;color: #999;font-weight: bold;">
                                           <option value="">--请选择--</option>
                                           <option value="0" style="color: #999;font-weight: bold;"
                                           <c:if test="${role==0}">
                                               selected
                                           </c:if>
                                            >普通用户</option>
                                           <option value="1" style="color: #999;font-weight: bold;"
                                                   <c:if test="${role==1}">
                                                       selected
                                                   </c:if>>管理员</option>
                                       </select>
                                   </td>
                                   <th width="50" >姓名:</th>
                                   <td ><input style="margin-right: 100px;" type="text" name="name" value="${name}" class="form-control1 input-search" placeholder="请输入用户姓名"></td>
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
    <th>身份证号</th>
    <th>姓名</th>
    <th>年龄</th>
    <th>电话</th>
    <th>性别</th>
    <th>类别</th>
    <th>操作</th>
</tr>
</thead>
<tbody>
<c:forEach var="person" items="${pageInfo.list}" varStatus="status">
    <tr>
    <td>${person.card}</td>
    <td>${person.name}</td>
    <td>${person.age}</td>
    <td>${person.phone}</td>
    <td>${person.sex}</td>
    <td>${person.role==1?"管理员":"普通用户"}</td>
        <td >
            <button  style="padding:2px 6px;" type="button" class="btn btn-sm btn-info"><a style="text-decoration: none;color: white;" class="updateNo" href="${pageContext.request.contextPath}/person/updateList?id=${person.id}" ><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a></button>
            <button style="padding: 2px 6px;text-decoration: none;color: white;" type="button" class="btn btn-sm btn-danger deleteSector"><a style="text-decoration: none;color: white;" class="deleteNo" href="javascript:del(${person.id})" ><i class="fa fa-trash-o" aria-hidden="true"></i></a></button>
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
                url:"${pageContext.request.contextPath }/person/del/"+obj ,
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
