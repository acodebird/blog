package com.blog.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blog.domain.Blog;
import com.blog.domain.PageBean;
import com.blog.mapper.BlogMapper;
import com.blog.utils.PageTool;

@Service
public class BlogServiceImpl implements BlogService {
	@Autowired
	private BlogMapper blogMapper;
	
	//保存博客到数据库
	@Override
	public Integer insert(Blog blog) {
		return blogMapper.insert(blog);
	}
	//根据博客状态获取所有博客发表年份，剔除重复值（用于博客管理和我的草稿）
	@Override
	public List<String> getPublishYear(Integer state) {
		return blogMapper.getPublishYear(state);
	}
	//分页显示已发表博客信息
	@Override
	public void getPage(PageBean<Blog> pageBean) {
		Integer totalCount = 0;
		Integer totalPage = 0;
		totalCount = blogMapper.getCount(pageBean.getBlogDTO());
		totalPage = (int) Math.ceil(1.0*totalCount/pageBean.getPageSize());
		pageBean.setTotalCount(totalCount);
		pageBean.setTotalPage(totalPage);
		PageTool.getPageBean(pageBean);
		List<Blog> list = blogMapper.getPage(pageBean);
		pageBean.setList(list);	
	}
	//根据id获取博客信息，用于博客编辑
	@Override
	public Blog getBlogById(Integer id) {
		return blogMapper.getBlogById(id);
	}
	//更新博客
	@Override
	public Integer updateBlog(Blog blog) {
		return blogMapper.updateBlog(blog);
	}
	//删除博客
	@Override
	public int deleteBlog(Integer id) {
		return blogMapper.deleteBlog(id);
	}
	//根据当前博客id获取上一篇博客
	@Override
	public Blog getLastBlog(Integer id) {
		return blogMapper.getLastBlog(id);
	}
	//根据当前博客id获取下一篇博客
	@Override
	public Blog getNextBlog(Integer id) {
		return blogMapper.getNextBlog(id);
	}
	//修改博客的点击次数
	@Override
	public void addClickHit(Integer id) {
		blogMapper.addClickHit(id);
	}
	//增加博客的评论数量
	@Override
	public void addReplyHit(Integer id) {
		blogMapper.addReplyHit(id);
	}
	//减少博客的评论数量
	@Override
	public void reduceReplyHit(Integer id) {
		blogMapper.reduceReplyHit(id);
	}
	//加载热门文章
	@Override
	public List<Blog> loadHottestArticles() {
		return blogMapper.loadHottestArticles();
	}
	//加载最新文章
	@Override
	public List<Blog> loadLatestArticles() {
		return blogMapper.loadLatestArticles();
	}
}
