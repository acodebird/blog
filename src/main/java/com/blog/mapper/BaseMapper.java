package com.blog.mapper;

import org.springframework.stereotype.Repository;

import com.blog.domain.BaseBean;

@Repository
public interface BaseMapper {
	public BaseBean getOneById(Integer uid);
}
