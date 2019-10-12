package com.blog.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blog.domain.BlogType;
import com.blog.domain.PageBean;
import com.blog.mapper.BlogTypeMapper;
import com.blog.utils.PageTool;

/**
 * 博客类型service实现类
 * @author 张小旭
 *
 */
@Service
public class BlogTypeServiceImpl implements BlogTypeService {
	@Autowired
	private BlogTypeMapper blogTypeMapper;
	
	//获取一页的博客类型数据
	@Override
	public void getPage(PageBean<BlogType> pageBean) {
		Integer totalCount = 0;
		Integer totalPage = 0;
		totalCount = blogTypeMapper.getCount();
		totalPage = (int) Math.ceil(1.0*totalCount/pageBean.getPageSize());
		pageBean.setTotalCount(totalCount);
		pageBean.setTotalPage(totalPage);
		PageTool.getPageBean(pageBean);
		List<BlogType> list = blogTypeMapper.getPage(pageBean);
		pageBean.setList(list);
	}
	//添加博客类型
	@Override
	public Integer add(BlogType blogType) {
		return blogTypeMapper.add(blogType);
	}
	//修改博客类型
	@Override
	public Integer update(BlogType blogType) {
		return blogTypeMapper.update(blogType);
	}
	//删除单个博客类型
	@Override
	public Integer delete(Integer id) {
		return blogTypeMapper.delete(id);
	}
	//批量删除博客类型
	@Override
	public Integer deleteMore(List<Integer> ids) {
		return blogTypeMapper.deleteMore(ids);
	}
	//根据id获取博客类型
	@Override
	public BlogType getOneById(Integer id) {
		return blogTypeMapper.getOneById(id);
	}
	//获取所有博客类型，用于写博客选择
	@Override
	public List<BlogType> getAll() {
		return blogTypeMapper.getAll();
	}
	//获取第一个博客类型，用于前端文章默认显示类型
	@Override
	public Integer getFirstBlogType() {
		return blogTypeMapper.getFirstBlogType();
	}

}
