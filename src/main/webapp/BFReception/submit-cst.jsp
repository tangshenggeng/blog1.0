<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta charset="UTF-8">
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<link href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"rel="stylesheet">
<link rel="stylesheet" href="${APP_PATH }/static/css/root_all.css">
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="${APP_PATH }/static/js/jQuery2.0-min.js"></script>
<!--加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。-->
<script src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<!-- 引用layerUI -->
<script src="${APP_PATH }/static/layer/layer.js"></script>
<title>信息提交</title>
</head>
<body>
<!-- Preloader -->
  <div class="loader-mask">
    <div class="loader">
      "Loading..."
    </div>
  </div>
	<div class="container commit">
		<div class="row">
			<div class="col-md-6 col-md-offset-5"><h1><span class="glyphicon glyphicon-send"></span> 信息提交</h1></div>
		</div>
		<div class="row col-md-offset-3">
			<form class="form-horizontal" id="up_cst_form">
			  <div class="form-group">
			    <label for="cst_con" class="col-sm-2 control-label">联系方式:</label>
			    <div class="col-sm-5">
			      <input type="text" name="cstCon" class="form-control" id="cst_con" placeholder="微信号" autofocus="autofocus" required="required">
			    	<span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="cst_scn" class="col-sm-2 control-label">学校名称:</label>
			    <div class="col-sm-5">
			      <input type="text" name="cstScn" class="form-control" id="cst_scn" placeholder="学校名称" required="required">
			    	<span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="cst_num" class="col-sm-2 control-label">账&emsp;&emsp;号:</label>
			    <div class="col-sm-5">
			      <input type="text" name="cstNum" class="form-control" id="cst_num" placeholder="账号" required="required">
			    	<span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group has-feedback">
			    <label for="cst_pwd" class="col-sm-2 control-label">密&emsp;&emsp;码:</label>
			    <div class="col-sm-5">
				    <div class="input-group">
				      <input type="password" name="cstPwd" class="form-control" id="cst_pwd" placeholder="密码" required="required">
			    	  <span class="help-block"></span>
			    	  <span class="input-group-addon glyphicon glyphicon-eye-open" id="openPwd"></span>
				    </div>
			   </div>
			  </div>
			  <div class="form-group">
			    <label for="cst_curr" class="col-sm-2 control-label">课&emsp;&emsp;程:</label>
			    <div class="col-sm-5">
			      <textarea rows="1" name="cstCurr" class="form-control" id="cst_curr" placeholder="多个课程请用逗号隔开" required="required"></textarea>
			    	<span class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label class="col-sm-2 control-label">平&emsp;&emsp;台:</label>
				<div class="col-sm-5">
					<select class="form-control" name="cstPlaId">
					</select>
				</div>
			  </div>
			  <div class="form-group">
			    <div class="col-sm-12 col-md-offset-2">
			      <button type="button" class="btn btn-primary" id="up_cst_btn"><span class="glyphicon glyphicon-check"></span> 提交</button>
			    </div>
			  </div>
			</form>
		</div>
	</div>
<script type="text/javascript">
	
	//页面加载前的缓冲
	$(window).on('load', function() {
	
	    // Preloader
	    $('.loader').fadeOut();
	    $('.loader-mask').delay(350).fadeOut('slow');
	    $(window).trigger("resize");
	
	  });
	//显示密码
	$("#openPwd").click(function() {
		$("#cst_pwd").prop("type","text");
	});
	//查询平台信息并显示
	$(function() {
		//重置表单
		$("#up_cst_form")[0].reset();
		$.ajax({
			url:"${APP_PATH}/plats",
			type:"GET",
			success:function(result){
				$.each(result.extend.plats,function(){
					var optionEle = $("<option></option>")
					.append(this.plaName).attr("value", this.plaId);
					optionEle.appendTo("#up_cst_form select");
					
				});
			}
		});
	});
	//通用验证
	function show_validate_msg(ele,status,msg) {
		//清楚之前的状态
		$(ele).parent().removeClass("has-error has-success");
		$(ele).next("span").text("");
		if (status == "error") {
			$(ele).parent().addClass("has-error");
			$(ele).next("span").text(msg);
		} else if (status == "success") {
			$(ele).parent().addClass("has-success");
			$(ele).next("span").text(msg);
		}
	}
	//检验联系方式
	$("#cst_con").change(function (){
		var cstCon = $("#cst_con").val();
		var regCon = /^[a-zA-Z0-9_-]{6,20}$/;
		if(!regCon.test(cstCon)){
			show_validate_msg("#cst_con", "error", "联系方式格式为6-20位的字母、数字、-、_");
			$("#up_cst_btn").attr("ajax_va", "error");
		}else{
			show_validate_msg("#cst_con", "success", "");
			$("#up_cst_btn").attr("ajax_va", "success");
			
		}
	});
	
	//校验学校名称
	$("#cst_scn").change(function (){
		var cstCon = $("#cst_scn").val();
		var regCon =/\S/;
		if(!regCon.test(cstCon)){
			show_validate_msg("#cst_scn", "error", "请正确填写学校名称");
			$("#up_cst_btn").attr("ajax_va", "error");
		}else{
			show_validate_msg("#cst_scn", "success", "");
			$("#up_cst_btn").attr("ajax_va", "success");
		}
	});
	//校验账号
	$("#cst_num").change(function (){
		var cstCon = $("#cst_num").val();
		var regCon = /\S/;
		if(!regCon.test(cstCon)){
			show_validate_msg("#cst_num", "error", "请正确填写账号");
			$("#up_cst_btn").attr("ajax_va", "error");
		}else{
			show_validate_msg("#cst_num", "success", "");
			$("#up_cst_btn").attr("ajax_va", "success");
		}
	});
	//校验密码
	$("#cst_pwd").change(function (){
		var cstCon = $("#cst_pwd").val();
		var regCon = /\S/;
		if(!regCon.test(cstCon)){
			show_validate_msg("#cst_pwd", "error", "请正确填写密码");
			$("#up_cst_btn").attr("ajax_va", "error");
		}else{
			show_validate_msg("#cst_pwd", "success", "");
			$("#up_cst_btn").attr("ajax_va", "success");
		}
	});
	//校验课程
	$("#cst_curr").change(function (){
		var cstCon = $("#cst_curr").val();
		var regCon = /\S/;
		if(!regCon.test(cstCon)){
			show_validate_msg("#cst_curr", "error", "请正确填写课程");
			$("#up_cst_btn").attr("ajax_va", "error");
		}else{
			show_validate_msg("#cst_curr", "success", "");
			$("#up_cst_btn").attr("ajax_va", "success");
		}
	});
	$("#up_cst_btn").click(function(){
		//页面验证通过了，ajax还要验证，取消验证不通过情况下的按钮功能
		if ($(this).attr("ajax_va") == "error") {
			return false;
		}
		
		//将数据提交至服务器
		$.ajax({
			url:"${APP_PATH}/cst",
			type:"POST",
			data:$("#up_cst_form").serialize(),
			success:function(result){
				if (result.code == 100) {
					layer.msg("添加成功");
					setTimeout(function(){
						window.location.reload();//刷新当前页面.
					},3000);
					//alert(result.msg);
					
				} else {
					//显示失败信息
					//console.log(result);
					//有哪个字段的错误信息就显示哪个，没用错误信息的字段会显示为undefined
					if (undefined != result.extend.errorFields.cstCon) {
						//邮箱有错误信息
						show_validate_msg("#cst_con","error",result.extend.errorFields.cstCon);
					}
					if (undefined != result.extend.errorFields.cstScn) {
						//员工名字有错误信息
						show_validate_msg("#cst_scn","error",result.extend.errorFields.cstScn);
					}
					if (undefined != result.extend.errorFields.cstNum) {
						//员工名字有错误信息
						show_validate_msg("#cst_num","error",result.extend.errorFields.cstNum);
					}
					if (undefined != result.extend.errorFields.cstPwd) {
						//员工名字有错误信息
						show_validate_msg("#cst_pwd","error",result.extend.errorFields.cstPwd);
					}
					if (undefined != result.extend.errorFields.cstCurr) {
						//员工名字有错误信息
						show_validate_msg("#cst_curr","error",result.extend.errorFields.cstCurr);
					}
				}
			}
		});
		
	});
</script>
</body>
</html>