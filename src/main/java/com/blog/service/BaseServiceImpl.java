package com.blog.service;


import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.blog.domain.BaseBean;
import com.blog.mapper.BaseMapper;

@Service
public class BaseServiceImpl implements BaseService {
	@Resource(name="baseMapper")
	private BaseMapper baseMapper;
	
	@Override
	public BaseBean getOneById(Integer uid) {
		return baseMapper.getOneById(uid);
	}

}
