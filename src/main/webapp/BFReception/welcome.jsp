<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<meta charset="UTF-8">
<link href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="${APP_PATH }/static/js/jQuery2.0-min.js"></script> 
<!--加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。-->
<script src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script> 
<link href="${APP_PATH }/BFReception/BFRstatic/css/cover.css" rel="stylesheet">
<title>首页</title>
</head>
<body>
	<div class="site-wrapper">
      <div class="site-wrapper-inner">
        <div class="cover-container">
        
          <div class="masthead clearfix">
            <div class="inner">
              <h3 class="masthead-brand">蛮吉成长记</h3>
              <nav>
                <ul class="nav masthead-nav">
                  <li class="active"><a>Home</a></li>
                  <li><a href="${APP_PATH }/toStudy">学习笔记</a></li>
                  <li><a href="${APP_PATH }/toFantasy">虚妄之言</a></li>
                  <li><a href="${APP_PATH }/aboutAuthor">关于作者</a></li>
                </ul>
              </nav>
            </div>
          </div>
          
          <div class="inner cover">
            <h1 class="cover-heading">欢迎界面</h1>
            <p class="lead">总共写了 <mark id="numOfBlog"></mark> 篇文章</p>
          </div>
          
          <div class="mastfoot">
            <div class="inner">
              <p>转载请注明出处 <a href="www.tsg.ink">蛮吉成长记</a></p>
            </div>
          </div>
          
        </div>
      </div>
    </div>
</body>
<script type="text/javascript">
	//查询文章数量
	$(function () {
		$.ajax({
			url:"${APP_PATH}/getNumOfBlog",
			type:"GET",
			success:function(result){
				$("#numOfBlog").text(result.extend.numOfBlog);
			}
		});
	});



</script>


</html>