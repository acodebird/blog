package com.blog.mapper;

import java.util.List;

import com.blog.domain.BlogType;
import com.blog.domain.PageBean;

public interface BlogTypeMapper {
	//获取类型总数量
	public Integer getCount();
	//获取一页的类型数据
	public List<BlogType> getPage(PageBean<BlogType> pageBean);
	//添加博客类型
	public Integer add(BlogType blogType);
	//修改博客类型
	public Integer update(BlogType blogType);
	//删除单个博客类型
	public Integer delete(Integer id);
	//批量删除博客类型
	public Integer deleteMore(List<Integer> ids);
	//根据id获取博客类型
	public BlogType getOneById(Integer id);
	//获取所有博客类型，用于写博客选择
	public List<BlogType> getAll();
	//获取第一个博客类型，用于前端文章默认显示类型
	public Integer getFirstBlogType();
}
