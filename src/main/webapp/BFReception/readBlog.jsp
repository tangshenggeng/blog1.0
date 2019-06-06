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
<link href="${APP_PATH }/BFReception/BFRstatic/css/Blog.css" rel="stylesheet">
<title>学习笔记</title>
</head>
<body>
	<!-- HEADER -->
	<div class="blog-masthead">
	   <div class="container">
	     <nav class="blog-nav">
	       <a class="blog-nav-item" href="${APP_PATH}/toWelcome">Home</a>
	       <a class="blog-nav-item" href="${APP_PATH }/toStudy">学习笔记</a>
	       <a class="blog-nav-item" href="${APP_PATH }/toFantasy">虚妄之言</a>
	       <a class="blog-nav-item" href="${APP_PATH }/aboutAuthor">关于站主</a>
	     </nav>
	   </div>
	 </div>
	<!-- HEADER-END -->
	<div class="container">
		<!-- BLOG-TITLE -->
      <div class="blog-header">
        <h2 class="blog-title"></h2>
      </div>
		<!-- BLOG-TITLE-END -->
      <div class="row">
        <div class="col-sm-8 blog-main">
          <div class="blog-post" id="studyBlog">
          	<h2 class="blog-post-title">${readBlog.blogTitle}</h2>
            <p class="blog-post-meta">${readBlog.blogUptime} by <a href="#">蛮吉</a></p>
            <blockquote>
              <p>&emsp;&emsp;${readBlog.blogArticle }</p>
            </blockquote>
            
          </div><!-- /.blog-post -->

        </div><!-- /.blog-main -->
		<!-- 静态引入右侧分类栏 -->
		
        <!-- /.blog-sidebar -->

      </div><!-- /.row -->

    </div>
	
	<!-- FOOTER -->
	<footer class="blog-footer">
	  <p>转载请注明出处 <a href="www.tsg.ink">蛮吉成长记</a></p>
	  <p>
	    <a href="#">返回顶部</a>
	  </p>
	</footer>
	<!-- FOOTER-END -->
	
</body>

</html>