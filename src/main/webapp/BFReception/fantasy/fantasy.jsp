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
<link href="${APP_PATH }/BFReception/BFRstatic/css/Blog.css"
	rel="stylesheet">
<title>虚妄之言</title>
</head>
<body>
	<!-- HEADER -->
	<div class="blog-masthead">
		<div class="container">
			<nav class="blog-nav">
				<a class="blog-nav-item" href="${APP_PATH}/toWelcome">Home</a> <a
					class="blog-nav-item" href="${APP_PATH }/toStudy/">学习笔记</a> <a
					class="blog-nav-item  active">虚妄之言</a> <a class="blog-nav-item"
					href="${APP_PATH }/aboutAuthor">关于作者</a>
			</nav>
		</div>
	</div>
	<!-- HEADER-END -->
	<div class="container">
		<!-- BLOG-TITLE -->
		<div class="blog-header">
			<h1 class="blog-title">虚幻之言</h1>
			<p class="lead blog-description">轻展幻想之翼</p>
		</div>

		<!-- BLOG-TITLE-END -->
		<div class="row">
			<div class="col-sm-8 blog-main">
				<div class="blog-post" id="studyBlog">
					<!-- <h2 class="blog-post-title"><a href="#">第一篇笔记</a></h2>
            <p class="blog-post-meta">时间 by <a href="#">作者</a></p>
			
            <blockquote>
              <p><a href="#">内容大致描述</a></p>
            </blockquote> -->

				</div>
				<!-- /.blog-post -->

				<nav id="blogPage"></nav>

			</div>
			<!-- /.blog-main -->
			<!-- 静态引入右侧分类栏 -->
			<div class="col-sm-3 col-sm-offset-1 blog-sidebar">
				<div class="sidebar-module sidebar-module-inset">
					<h4>页面内容描述</h4>
					<p>内容均是测试，侵权联系QQ1528474876删</p>
				</div>
				<div class="sidebar-module">
					<h4>学科分类</h4>
					<ol class="list-unstyled" id="study_sc">
					</ol>
				</div>
				<div class="sidebar-module">
					<h4>友情链接</h4>
					<ol class="list-unstyled">
						<li><a href="https://blog.csdn.net/weixin_42107641">CSDN</a></li>
						<!-- <li><a href="#">Twitter</a></li>
      <li><a href="#">Facebook</a></li> -->
					</ol>
				</div>
			</div>
			<!-- /.blog-sidebar -->

		</div>
		<!-- /.row -->

	</div>

	<!-- FOOTER -->
	<footer class="blog-footer">
		<p>
			转载请注明出处 <a href="www.tsg.ink">蛮吉成长记</a>
		</p>
		<p>
			<a href="#">返回顶部</a>
		</p>
	</footer>
	<!-- FOOTER-END -->

</body>
<script type="text/javascript">
	$(function() {
		//查询所有一级分类下的文章
		$.ajax({
			url : "${APP_PATH}/getAllBlogOfFantasy/1",
			type : "GET",
			success : function(result) {
				//展示页面的博客
				build_blogs(result);
				//分页处理
				build_page_ofFan(result);

				//右侧学科分类栏
				build_fan(result);
			}
		});
	});
	//右侧导航栏
	function build_fan(result) {
		//$("#study_sc").empty();
		//查询右侧所有二级分类
		$.ajax({
			url : "${APP_PATH}/getSC/2",
			type : "GET",
			success : function(result) {
				$.each(result.extend.allSC, function() {
					var aSCEle = $("<a></a>").append(this.sclassificationName).attr("scid", this.sclassificationId).addClass("btn btn-link");
					aSCEle.click(function() {
						//alert(aSCEle.attr("scid"));
						toPageOfSC(aSCEle.attr("scid"), 1);
					});
					var liEle = $("<li></li>").append(aSCEle);
					$("#study_sc").append(liEle);
				});
			}
		});
	}
	//学习笔记页面下的分页
	function build_page_ofFan(result) {
		$("#blogPage").empty();
		var ulEle = $("<ul></ul>").addClass("pager");
		var prePageA = $("<a></a>").append("上一页").attr("href", "#");
		var prePageLi = $("<li></li>");
		prePageLi.append(prePageA);
		var nextPageA = $("<a></a>").append("下一页").attr("href", "#");
		var nextPageLi = $("<li></li>");
		prePageA.click(function() {
			toPageOfFantasy(result.extend.pageInfo.pageNum - 1);
		});
		nextPageA.click(function() {
			toPageOfFantasy(result.extend.pageInfo.pageNum + 1);
		});
		nextPageLi.append(nextPageA);
		ulEle.append(prePageLi).append(nextPageLi).appendTo("#blogPage");
	}
	//博客
	function build_blogs(result) {
		//展示博客
		var blog = result.extend.pageInfo.list;
		$.each(blog, function() {
			var tltie = $("<h2></h2>").addClass("blog-post-title").append(this.blogTitle);
			var aEle = $("<a></a>").attr("href", "#").append("蛮吉")
			var uptime = $("<p></p>").addClass("blog-post-meta").append(this.blogUptime + " by ").append(aEle);
			var blockquote = $("<blockquote></blockquote>");
			//把博客Id传过去，点击副标题可以进去查看全文
			var blogArticle = $("<a></a>").append(this.blogSubheading).attr("href", "${APP_PATH}/readBlog/" + this.blogId)
			var blogP = $("<p></p>").append(blogArticle);
			blockquote.append(blogP);
			$("#studyBlog").append(tltie).append(uptime).append(blockquote);
		});
	}
	//二级分类下的跳转
	function toPageOfSC(scId, pn) {
		$("#studyBlog").empty();
		$.ajax({
			url : "${APP_PATH}/getBlogBySC/" + scId + "/" + pn,
			type : "GET",
			success : function(result) {
				build_blogs(result);
				//建立二级下的分页跳转
				build_PageOfSC(result);
			}
		});
	}
	//通过二级查找后的分页跳转
	function build_PageOfSC(result) {
		$("#blogPage").empty();
		var ulEle = $("<ul></ul>").addClass("pager");
		var prePageA = $("<a></a>").append("上一页").attr("href", "#");
		var prePageLi = $("<li></li>");
		prePageLi.append(prePageA);
		var nextPageA = $("<a></a>").append("下一页").attr("href", "#");
		var nextPageLi = $("<li></li>");
		prePageA.click(function() {
			toPageOfSC(result.extend.pageInfo.list[0].blScId, result.extend.pageInfo.pageNum - 1);
		});
		nextPageA.click(function() {
			toPageOfSC(result.extend.pageInfo.list[0].blScId, result.extend.pageInfo.pageNum + 1);
		});
		nextPageLi.append(nextPageA);
		ulEle.append(prePageLi).append(nextPageLi).appendTo("#blogPage");
	}
	//虚妄之言页面的分页跳转
	function toPageOfFantasy(pn) {
		$("#studyBlog").empty();
		$.ajax({
			url : "${APP_PATH}/getAllBlogOfFantasy/" + pn,
			type : "GET",
			success : function(result) {
				build_blogs(result);
			}
		});
	}
</script>



</html>