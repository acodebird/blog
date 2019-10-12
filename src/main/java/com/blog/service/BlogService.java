package com.blog.service;

import java.util.List;

import com.blog.domain.Blog;
import com.blog.domain.PageBean;

public interface BlogService {
	//保存文章到数据库
	public Integer insert(Blog blog);
	//获取所有博客发表年份，剔除重复值
	public List<String> getPublishYear(Integer state);
	//分页显示已发表博客信息
	public void getPage(PageBean<Blog> pageBean);
	//根据id获取博客信息
	public Blog getBlogById(Integer id);
	//更新博客
	public Integer updateBlog(Blog blog);
	//删除博客
	public int deleteBlog(Integer id);
	//根据当前博客id获取上一篇博客
	public Blog getLastBlog(Integer id);
	//根据当前博客id获取下一篇博客
	public Blog getNextBlog(Integer id);
	//增加博客的点击次数
	public void addClickHit(Integer id);
	//增加博客的评论数量
	public void addReplyHit(Integer id);
	//减少博客的评论数量
	public void reduceReplyHit(Integer id);
	//加载热门文章
	public List<Blog> loadHottestArticles();
	//加载最新文章
	public List<Blog> loadLatestArticles();
}
