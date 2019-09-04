package com.blog.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blog.domain.Blogger;
import com.blog.mapper.BloggerMapper;

/**
 * 博主service实现类
 * @author 张小旭
 *
 */
@Service
public class BloggerServiceImpl implements BloggerService {
	@Autowired
	private BloggerMapper bloggerMapper;
	
	//根据用户名获取用户信息，用于登录验证
	@Override
	public Blogger getByUsername(String username){
		return bloggerMapper.getByUsername(username);
	}

}
