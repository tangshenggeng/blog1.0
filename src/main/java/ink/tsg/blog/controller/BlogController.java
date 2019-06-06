package ink.tsg.blog.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import ink.tsg.blog.bean.Blog;
import ink.tsg.blog.bean.BlogExample;
import ink.tsg.blog.bean.BlogExample.Criteria;
import ink.tsg.blog.service.BlogService;
import ink.tsg.utlis.Msg;
/**
 * 文章控制层
 * */
@Controller
public class BlogController {

	@Autowired
	private BlogService blogService;
	
	/**
	 * 查询id为1（学习笔记）分类下的二级分类（java、C#。。。）下的所有文章
	 * */
	@RequestMapping(value="/getBlogBySC/{blScId}/{pn}",method=RequestMethod.GET)
	@ResponseBody
	public Msg getAllBlogOfSC(@RequestParam(value="blFcId",defaultValue="1")Integer blFcId,@PathVariable("blScId")Integer blScId,@PathVariable("pn")Integer pn) {
		//添加条件
		BlogExample blogExample = new BlogExample();
		Criteria criteria = blogExample.createCriteria();
		//通过博客Id倒序
		blogExample.setOrderByClause("blog_id DESC");
		criteria.andBlScIdEqualTo(blScId);
		//分页，每页显示5条
		PageHelper.startPage(pn, 5);
		List<Blog> blogs =blogService.getAllBlogOfSC(blogExample);
		//连续显示页码为1
		PageInfo<Blog> page = new PageInfo<Blog>(blogs, 1);
		return Msg.success().add("pageInfo", page);
	}
	/**
	 * 查询id为2（虚妄之言）分类下的二级分类下的所有文章
	 * */
	@RequestMapping(value="/getAllBlogOfFantasy/{pn}",method=RequestMethod.GET)
	@ResponseBody
	public Msg getAllBlogOfFantasy(@PathVariable("pn")Integer pn,@RequestParam(value="blFcId",defaultValue="2")Integer blFcId) {
		//添加条件
		BlogExample blogExample = new BlogExample();
		Criteria criteria = blogExample.createCriteria();
		blogExample.setOrderByClause("blog_id DESC");
		criteria.andBlFcIdEqualTo(blFcId);
		//分页，每页显示5条
		PageHelper.startPage(pn, 5);
		List<Blog> blogs = blogService.getgetAllBlogOfStudy(blogExample);
		//连续显示页码为1
		PageInfo<Blog> page = new PageInfo<Blog>(blogs, 1);
		return Msg.success().add("pageInfo", page);
	}
	
	
	
	
	/**
	 * 得到所有学习笔记下的文章,分页处理
	 * */
	@RequestMapping(value="/getAllBlogOfStudy/{pn}",method=RequestMethod.GET)
	@ResponseBody
	public Msg getAllBlogOfStudy(@PathVariable("pn")Integer pn,@RequestParam(value="blFcId",defaultValue="1")Integer blFcId) {
		//添加条件
		BlogExample blogExample = new BlogExample();
		Criteria criteria = blogExample.createCriteria();
		blogExample.setOrderByClause("blog_id DESC");
		criteria.andBlFcIdEqualTo(blFcId);
		//分页，每页显示5条
		PageHelper.startPage(pn, 5);
		List<Blog> blogs = blogService.getgetAllBlogOfStudy(blogExample);
		//连续显示页码为1
		PageInfo<Blog> page = new PageInfo<Blog>(blogs, 1);
		return Msg.success().add("pageInfo", page);
	}
	/**
	  *  查看全文 
	 * */
	@RequestMapping(value="/readBlog/{blogId}",method=RequestMethod.GET)
	public String getBlog(@PathVariable("blogId")Integer blogId,Model model) {
		//根据Id查询文章
		Blog blog = blogService.readBlog(blogId);
		model.addAttribute("readBlog", blog);
		return "forward:/BFReception/readBlog.jsp";
	}
	
	
	/**
	 *查询博客总数量 
	 * */
	@RequestMapping(value="/getNumOfBlog",method=RequestMethod.GET)
	@ResponseBody
	public Msg countOfBlog() {
		Long countOfBlog = blogService.getNumOfBlog();
		return Msg.success().add("numOfBlog",countOfBlog);
	}
	
	/**
	 * 
	 * 保存博客
	 * */
	@RequestMapping(value="/saveBlog",method=RequestMethod.POST)
	@ResponseBody
	public Msg saveBlog(Blog blog) {
		//获取提交时间
		java.util.Date utilDate = new java.util.Date();  //获取当前时间
		java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());  //通过getTime()转换
		blog.setBlogUptime(sqlDate);
		blogService.saveBlog(blog);
		return Msg.success();
	}
	/**
	 * 去往学习页面
	 * */
	@RequestMapping(value="/toStudy")
	public String toStudy() {
		return "forward:/BFReception/studyPage/studyNote.jsp";
	}
	/**
	 * 去往虚妄之言页面
	 * */
	@RequestMapping(value="/toFantasy")
	public String toFantasy() {
		return "forward:/BFReception/fantasy/fantasy.jsp";
	}
	/**
	 * 去往站主页面
	 * */
	@RequestMapping(value="/aboutAuthor")
	public String aboutAuthor() {
		return "forward:/BFReception/author/author.jsp";
	}
	/**
	 * 去往首页页面
	 * */
	@RequestMapping(value="/toWelcome")
	public String toWelcome() {
		return "forward:/BFReception/welcome.jsp";
	}
}
