package ink.tsg.blog.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ink.tsg.blog.bean.Blog;
import ink.tsg.blog.bean.BlogExample;
import ink.tsg.blog.dao.BlogMapper;

@Service
public class BlogService {
	
	@Autowired
	private BlogMapper blogMapper;
	/**
	 * 保存博客
	 * */
	public void saveBlog(Blog blog) {
		blogMapper.insertSelective(blog);	
	}
	/**
	 * 获取博客数量
	 * */
	public Long getNumOfBlog() {
		return blogMapper.countByExample(null);
	}
	/**
	 * 获取一级分类下的学习笔记的所有博客
	 * */
	public List<Blog> getgetAllBlogOfStudy(BlogExample blogExample) {
		return blogMapper.selectByExample(blogExample);
	}
	/**
	 * 查看文章
	 * */
	public Blog readBlog(Integer blogId) {
		return blogMapper.selectByPrimaryKey(blogId);
	}
	/**
	 * 得到二级分类下的文章（右侧导航）
	 * */
	public List<Blog> getAllBlogOfSC(BlogExample blogExample) {
		return blogMapper.selectByExample(blogExample);
	}
	
	
	
	
}
