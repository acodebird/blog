package com.blog.test;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.blog.domain.Blog;
import com.blog.domain.BlogType;
import com.blog.service.BlogService;
import com.blog.service.BlogTypeService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext-core.xml")
public class TestDateFormat {
	@Resource
	BlogService blogService;
	@Resource
	BlogTypeService blogTypeService;
	
	@Test
	public void test2() {
		Blog blog = new Blog();
		blog.setTitle("test");
		blog.setId(2);
		BlogType blogType = blogTypeService.getOneById(34);
		blog.setBlogType(blogType);
		blogService.updateBlog(blog);
		
	}
	
	@Test
	public void test1() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		System.out.println(sdf.format(new Date()));
		
	}
}
