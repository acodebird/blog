package com.blog.mapper;

import com.blog.domain.Blogger;

/**
 * 博主后台接口
 * @author 张小旭
 *
 */
public interface BloggerMapper {
	//根据用户名获取用户信息，用于登录验证
	public Blogger getByUsername(String username);
}
