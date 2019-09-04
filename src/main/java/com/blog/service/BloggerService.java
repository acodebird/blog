package com.blog.service;


import com.blog.domain.Blogger;

/**
 * 博主service接口
 * @author 张小旭
 *
 */
public interface BloggerService {
	//根据用户名获取用户信息，用于登录验证
	public Blogger getByUsername(String username);
}
