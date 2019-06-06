<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<meta charset="UTF-8">
<link
	href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="${APP_PATH }/static/js/jQuery2.0-min.js"></script>
<!--加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。-->
<script
	src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<link href="${APP_PATH }/static/BAMStatic/css/BAManage.css"
	rel="stylesheet">
<script src="${APP_PATH }/static/layer/layer.js"></script>
<title>博文后台管理</title>
</head>
<body>
	<!-- 导航栏 -->
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand">博客后台管理</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse"
				aria-expanded="false" style="height: 0.8px;">
				<ul class="nav navbar-nav">
					<li class="active"><a>博文统计</a></li>
					<li><a href="#about">学习笔记</a></li>
					<li><a href="#contact">虚妄之言</a></li>
				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>
	</nav>
	<!-- 导航栏END  -->
	<!-- 主体部分 -->
	<div class="container">
		<div class="starter-template">

			<form class="form-horizontal" id="blog_form">
				<div class="form-group">
					<div class="col-md-2">
						<select class="form-control" id="fclass-blog" name="blFcId">
						</select>
					</div>
					&emsp;
					<div class="col-md-2">
						<select class="form-control" id="sclass-blog" name="blScId">
						</select>
					</div>
				</div>
				<!-- 博客标题 -->
				<div class="form-group">
					<div class="col-md-10">
						<textarea rows="1" class="form-control" name="blogTitle"
							placeholder="文章标题..."></textarea>
					</div>
				</div>
				<!-- 博客副标题 -->
				<div class="form-group">
					<div class="col-md-10">
						<textarea rows="4" class="form-control" name="blogSubheading"
							placeholder="文章副标题..."></textarea>
					</div>
				</div>
				<!-- 文章内容 -->
				<div class="form-group">
					<div class="col-md-10">
						<textarea rows="10" class="form-control" name="blogArticle"
							placeholder="文章内容..."></textarea>
					</div>
				</div>

			</form>
			<div class="col-md-1">
				<button type="button" class="btn btn-success" id="blog_btn">发表</button>
			</div>
		</div>
	</div>
	<!-- 主体部分结束 -->
</body>
<script type="text/javascript">
	//查询一级分类和二级分类
	$(function() {
		//初始化选择框
		$("#fclass-blog").empty();
		var iniOption = $("<option value='0'>--- 请选择 ---</option>");
		$("#fclass-blog").append(iniOption);
		$.ajax({
			url : "${APP_PATH}/getFC",
			type : "GET",
			success : function(result) {
				$.each(result.extend.allFC, function() {
					var optionEle = $("<option></option>").attr("value", this.fclassificationId).append(this.fclassificationName);
					$("#fclass-blog").append(optionEle);
				});
			}
		});
	});
	$("#fclass-blog").on("click", "option", function() {
		//初始化选择框
		$("#sclass-blog").empty();
		var iniOption = $("<option value='0'>--- 请选择 ---</option>");
		$("#sclass-blog").append(iniOption);
		//alert("aaa");
		var scid = $(this).attr("value");
		$.ajax({
			url : "${APP_PATH}/getSC/" + scid,
			type : "GET",
			success : function(result) {
				//alert(result.msg);
				$.each(result.extend.allSC, function() {
					var optionEle = $("<option></option>").attr("value", this.sclassificationId).append(this.sclassificationName);
					$("#sclass-blog").append(optionEle);
				});

			}
		});
	});
	//提交博客
	$("#blog_btn").click(function() {
		var fcId = $("#fclass-blog").val();
		var scId = $("#sclass-blog").val();
		if(fcId==0|scId==0){
			layer.msg("请选择分类")
			return false;
		}
		 $.ajax({
			url : "${APP_PATH}/saveBlog",
			type : "POST",
			data : $("#blog_form").serialize(),
			success : function(result) {
				alert(result.msg)
			}
		}); 
	});
</script>
</html>