package com.blog.service;

import java.util.List;

import com.blog.domain.Comment;
import com.blog.domain.PageBean;

public interface CommentService {
	//增加一条评论
	public Integer addComment(Comment comment);
	//删除一条评论
	public Integer deleteComment(Integer id);
	//批量删除评论
	public Integer deleteMoreComment(List<Integer> ids);
	//根据博客id获取博客相关评论
	public List<Comment> getCommentByBlogId(Integer blogId);
	//根据评论id获取评论相关回复
	public List<Comment> getReplyByCommentId(Integer replyId);
	//获取一页评论，用于分页显示评论，按照修改时间降序
	public void getPage(PageBean<Comment> pageBean);
	//获取所有评论数量
	public Integer getCount();
	//更新评论的修改时间，从而根据修改时间降序排序
	public void updateCommentUpdateDate(Comment comment);
	//根据id批量删除评论
	public Integer deleteMore(List<Integer> ids);
	//根据id删除一条评论
	public Integer delete(Integer id);
	//根据博客id删除博客的所有评论
	public void deleteAllByBlogId(Integer id);
}
