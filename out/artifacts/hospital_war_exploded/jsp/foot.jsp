<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<div  style="position: fixed;bottom: 0px;">
            <p class="footer-gd"><h4><a href="${pageContext.request.contextPath }/manage/jsp/login.jsp">后台管理</a></h4></p>

</div>
<!--外层的div-->
<div class="modal fade" id="updatePassModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    <div class="modal-dialog">
        <div class="modal-content">
            <form role="form" class="form-horizontal"action="${pageContext.request.contextPath }/person/mupdatepwd" onsubmit="return change()">
                <div class="modal-header">
                    <button style="float: right;
    padding-top: 10px;
    font-size: 21px;
    font-weight: 700;
    line-height: 1;
    color: #000;
    text-shadow: 0 1px 0 #fff;
   opacity: .2;
"  class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h2 class="modal-title" style="margin-left: 20px;">修改密码</h2>
                </div>
                <div class="modal-body">
                    <div class="form-group" style="font-size: large;margin-left: 40px;">
                        <label class="col-md-2 control-label">原密码</label>
                        <div class="col-md-8">
                            <div class="input-group">
									<span class="input-group-addon">
										<i class="fa fa-key"></i>
									</span>
                                <input type="password" class="form-control1" id="oldpass" placeholder="请输入原密码">
                            </div>
                        </div>
                    </div>
                    <div class="form-group"style="font-size: large;margin-left: 40px;">
                        <label class="col-md-2 control-label">新密码</label>
                        <div class="col-md-8">
                            <div class="input-group">
									<span class="input-group-addon">
										<i class="fa fa-key"></i>
									</span>
                                <input type="password"required class="form-control1" name="password" id="newpass1" placeholder="请输入新密码">
                            </div>
                        </div>
                    </div>
                    <div class="form-group"style="font-size: large;margin-left: 40px;">
                        <label class="col-md-2 control-label" style="padding-left: 0;">确认密码</label>
                        <div class="col-md-8">
                            <div class="input-group">
									<span class="input-group-addon">
										<i class="fa fa-key"></i>
									</span>
                                <input type="password" class="form-control1" id="newpass2" required placeholder="请输入确认密码">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" onclick="clean()" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="submit" class="btn btn-primary">保存</button>
                </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>
<script>
    function change(){
        if($("#oldpass").val()!='${userSession.password}'){
            alert("原密码错误");
            return false;
        }else if($("#newpass1").val()!=$("#newpass2").val()){
            alert("两次密码不一致");
            return false;
        }else{
            return true;
        }
    }

    function clean(){
        $("#oldpass").val("");
        $("#newpass1").val("");
        $("#newpass2").val("");
    }

</script>
