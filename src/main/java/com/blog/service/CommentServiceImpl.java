package com.blog.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blog.domain.Comment;
import com.blog.domain.PageBean;
import com.blog.mapper.CommentMapper;
import com.blog.utils.PageTool;

@Service
public class CommentServiceImpl implements CommentService {
	@Autowired
	private CommentMapper commentMapper;
	
	//增加一条评论
	@Override
	public Integer addComment(Comment comment) {
		return commentMapper.addComment(comment);
	}
	//删除一条评论
	@Override
	public Integer deleteComment(Integer id) {
		return commentMapper.deleteComment(id);
	}
	//批量删除评论
	@Override
	public Integer deleteMoreComment(List<Integer> ids) {
		return commentMapper.deleteMoreComment(ids);
	}
	//根据博客id获取博客相关评论
	@Override
	public List<Comment> getCommentByBlogId(Integer blogId) {
		return commentMapper.getCommentByBlogId(blogId);
	}
	//根据评论id获取评论相关回复
	@Override
	public List<Comment> getReplyByCommentId(Integer replyId) {
		return commentMapper.getReplyByCommentId(replyId);
	}
	//获取一页评论，用于分页显示评论，按照修改时间降序
	@Override
	public void getPage(PageBean<Comment> pageBean) {
		Integer totalCount = 0;
		Integer totalPage = 0;
		totalCount = commentMapper.getCount();
		totalPage = (int) Math.ceil(1.0*totalCount/pageBean.getPageSize());
		pageBean.setTotalCount(totalCount);
		pageBean.setTotalPage(totalPage);
		PageTool.getPageBean(pageBean);
		List<Comment> list = commentMapper.getPage(pageBean);
		pageBean.setList(list);
	}
	//获取所有评论数量
	@Override
	public Integer getCount() {
		return commentMapper.getCount();
	}
	//更新评论的修改时间，从而根据修改时间降序排序
	@Override
	public void updateCommentUpdateDate(Comment comment) {
		commentMapper.updateCommentUpdateDate(comment);
	}
	//根据id批量删除评论
	@Override
	public Integer deleteMore(List<Integer> ids) {
		for (Integer id : ids) {
			commentMapper.deleteReplyByCommentId(id);
		}
		return commentMapper.deleteMore(ids);
	}
	//根据id删除一条评论
	@Override
	public Integer delete(Integer id) {
		commentMapper.deleteReplyByCommentId(id);
		return commentMapper.delete(id);
	}
	//根据博客id删除博客的所有评论
	@Override
	public void deleteAllByBlogId(Integer id) {
		commentMapper.deleteAllByBlogId(id);
	}

}
