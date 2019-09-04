package com.blog.service;


import java.util.List;

import com.blog.domain.BlogType;
import com.blog.domain.PageBean;

/**
 * 博客类型service接口
 * @author 张小旭
 *
 */
public interface BlogTypeService {
	//获取一页的博客类型数据
	public void getPage(PageBean<BlogType> pageBean);
	//添加博客类型
	public Integer add(BlogType blogType);
	//修改博客类型
	public Integer update(BlogType blogType);
	//删除单个博客类型
	public Integer delete(Integer id);
	//批量删除博客类型
	public Integer deleteMore(List<Integer> ids);
}
