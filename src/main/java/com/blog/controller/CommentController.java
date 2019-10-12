package com.blog.controller;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.blog.domain.Blog;
import com.blog.domain.Comment;
import com.blog.domain.PageBean;
import com.blog.service.BlogService;
import com.blog.service.CommentService;

@Controller
@RequestMapping(value="comment")
public class CommentController {
	@Autowired
	private CommentService commentService;
	@Autowired
	private BlogService blogService;
	
	/**
	 * 批量删除评论
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
		Integer row = commentService.deleteMore(ids);
		if(row>0) {
			for(int i = 0; i < ids.size(); i++) {
				blogService.reduceReplyHit(ids.get(i));//根据评论id将博客评论数减1
			}
			return "{\"result\":\"success\"}";
		}
		else return "{\"result\":\"failure\"}";
	}
	
	/**
	 * 删除单条评论
	 * @param id
	 * @return
	 */
	@PostMapping(value="/admin/delete")
	public @ResponseBody String delete(@RequestParam Integer id) {
		Integer row = commentService.delete(id);
		if(row>0) {
			blogService.reduceReplyHit(id);//根据评论id将博客评论数减1
			return "{\"result\":\"success\"}";
		}
		else return "{\"result\":\"failure\"}";
	}
	
	/**
	 * 分页显示评论数据
	 * @param pageNo  当前页码
	 * @param length  页长
	 * @param draw  前台给什么就返回什么，没有就返回1
	 * @return
	 */
	@PostMapping(value="/admin/showPage")
	public @ResponseBody String showPage(Integer pageNo,Integer length,Integer draw) {
		PageBean<Comment> pageBean = new PageBean<Comment>();
		pageBean.setPageSize(length);
		pageBean.setCurrentPage(pageNo);
		commentService.getPage(pageBean);
		HashMap<String, Object> result = new HashMap<>();
		result.put("data", pageBean.getList());//用户数据
		result.put("draw", draw);//前端传来什么就返回什么，如果没有就返回1
		result.put("recordsTotal", pageBean.getTotalCount());//总记录数
		result.put("recordsFiltered", pageBean.getTotalCount());//查询过滤后的总记录数，跟recordsTotal保持一致，前台会根据数据自动进行显示
		String json = JSONArray.toJSONString(result);
		return json;
	}
	
	@GetMapping(value="/loadComment")
	public @ResponseBody String loadComment(Integer id) {
		HashMap<String, Object> data = new HashMap<>();
		Blog blog = blogService.getBlogById(id);
		List<Comment> commentList = commentService.getCommentByBlogId(id);
		for (Comment comment2 : commentList) {
			List<Comment> replys = commentService.getReplyByCommentId(comment2.getId());
			comment2.setReplys(replys);
			comment2.setBlog(blog);
		}
		data.put("commentList", commentList);
		String json = JSONArray.toJSONString(data);
		return json;
	}
	
	/**
	 * 添加评论
	 * @param comment
	 * @return 
	 * @throws InvocationTargetException 
	 * @throws IllegalAccessException 
	 */
	@PostMapping(value="/addComment")
	public @ResponseBody String addComment(@RequestBody Map<String,String> map,HttpServletRequest request) throws IllegalAccessException, InvocationTargetException {
		Comment comment = new Comment();
		BeanUtils.populate(comment, map);
		Integer blogId = -1;
		if(map.get("blogId")!=null&&map.get("blogId")!="") {
			blogId = Integer.parseInt(map.get("blogId"));
		}
		Blog blog = blogService.getBlogById(blogId);
		comment.setBlog(blog);
		comment.setUserIp(request.getRemoteAddr());
		comment.setCommentDate(new Date());
		comment.setUpdateDate(comment.getCommentDate());
		if(comment.getReplyId()!=null&&comment.getReplyId()!=0) {
			commentService.updateCommentUpdateDate(comment);
		}
		int row = commentService.addComment(comment);
		HashMap<String, Object> data = new HashMap<>();
		if(row>0) {
			blogService.addReplyHit(blogId);//博客评论数加1
			data.put("result", "成功");
		}else {
			data.put("result", "失败");
		}
		String json = JSONArray.toJSONString(data);
		return json;
	}
}
