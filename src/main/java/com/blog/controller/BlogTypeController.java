package com.blog.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.blog.domain.BlogType;
import com.blog.domain.PageBean;
import com.blog.service.BlogTypeService;

@Controller
@RequestMapping(value="blogType")
public class BlogTypeController {
	@Autowired
	private BlogTypeService blogTypeService;
	
	/**
	 * 批量删除博客类型
	 * @param id
	 * @return
	 */
	@PostMapping(value="/admin/deleteMore")
	public @ResponseBody String delete(@RequestBody Map<String,String> map) {
		String[] strIds = map.get("ids").split(",");//将数据ids转换成string数组
		List<Integer> ids = new ArrayList<Integer>();
		//将ids的string数组转换成List<Long>数组，方便直接调用系统函数
		for(int i = 0; i < strIds.length; i++) {
			ids.add(i, Integer.parseInt(strIds[i]));
		}
		Integer row = blogTypeService.deleteMore(ids);
		if(row>0) return "{\"result\":\"success\"}";
		else return "{\"result\":\"failure\"}";
	}
	
	/**
	 * 删除单个博客类型
	 * @param id
	 * @return
	 */
	@PostMapping(value="/admin/delete")
	public @ResponseBody String delete(@RequestParam Integer id) {
		System.out.println(id);
		Integer row = blogTypeService.delete(id);
		if(row>0) return "{\"result\":\"success\"}";
		else return "{\"result\":\"failure\"}";
	}
	/**
	 * 修改博客类型
	 * @param blogType
	 * @return
	 */
	@PostMapping(value="/admin/update")
	public @ResponseBody String update(@RequestBody BlogType blogType) {
		Integer row = blogTypeService.update(blogType);
		if(row>0) return "{\"result\":\"success\"}";
		else return "{\"result\":\"failure\"}";
	}
	/**
	 * 添加博客类型
	 * @param blogType
	 * @return
	 */
	@PostMapping(value="/admin/add")
	public @ResponseBody String add(@RequestBody BlogType blogType) {
		Integer row = blogTypeService.add(blogType);
		if(row>0) return "{\"result\":\"success\"}";
		else return "{\"result\":\"failure\"}";
	}
	
	/**
	 * 分页显示博客类型数据
	 * @param pageNo  当前页码
	 * @param length  页长
	 * @param draw  前台给什么就返回什么，没有就返回1
	 * @return
	 */
	@PostMapping(value="/admin/showPage")
	public @ResponseBody String showPage(Integer pageNo,Integer length,Integer draw) {
		PageBean<BlogType> pageBean = new PageBean<BlogType>();
		pageBean.setPageSize(length);
		pageBean.setCurrentPage(pageNo);
		blogTypeService.getPage(pageBean);
		HashMap<String, Object> result = new HashMap<>();
		result.put("data", pageBean.getList());//用户数据
		result.put("draw", draw);//前端传来什么就返回什么，如果没有就返回1
		result.put("recordsTotal", pageBean.getTotalCount());//总记录数
		result.put("recordsFiltered", pageBean.getTotalCount());//查询过滤后的总记录数，跟recordsTotal保持一致，前台会根据数据自动进行显示
		String json = JSONArray.toJSONString(result);
		return json;
	}
}
