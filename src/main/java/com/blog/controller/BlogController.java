package com.blog.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.InvocationTargetException;
import java.text.ParseException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.blog.domain.Blog;
import com.blog.domain.BlogType;
import com.blog.domain.Editor;
import com.blog.domain.PageBean;
import com.blog.service.BlogService;
import com.blog.service.BlogTypeService;
import com.blog.service.CommentService;

@Controller
//@RequestMapping(value="admin")
public class BlogController {
	@Autowired
	private BlogService blogService;
	@Autowired
	private BlogTypeService blogTypeService;
	@Autowired
	private CommentService commentService;
	
	/**
	 * 加载最新文章
	 * @return
	 */
	@GetMapping(value="/index/loadLatestArticles")
	public @ResponseBody List<Blog> loadLatestArticles(){
		return blogService.loadLatestArticles();
	}
	
	/**
	 * 加载热门文章
	 * @return
	 */
	@GetMapping(value="/index/loadHottestArticles")
	public @ResponseBody List<Blog> loadHottestArticles(){
		return blogService.loadHottestArticles();
	}
	
	/**
	 * 博客详情并增加博客的点击次数
	 * @param id
	 * @param model
	 * @return
	 */
	@GetMapping(value="/blogDetail")
	public String articleDetail(Integer id,Integer type,Model model) {
		blogService.addClickHit(id);//博客阅读数加1，即点击数量加1
		Blog blog = blogService.getBlogById(id);
		Blog lastBlog = blogService.getLastBlog(id);
		Blog nextBlog = blogService.getNextBlog(id);
		model.addAttribute("blog", blog);
		model.addAttribute("lastBlog", lastBlog);
		model.addAttribute("nextBlog", nextBlog);
		if(type==null) {
			return "/articleDetail";
		}
		return "/admin/blogDetail";
	}
	
	/**
	 * 首页博客展示
	 * @param currentPage 当前页码
	 * @param typeId 博客类别
	 * @return
	 */
	@GetMapping(value="/index/showBlogs")
	public @ResponseBody String showBlogs(Integer currentPage,Integer typeId) {
		PageBean<Blog> pageBean = new PageBean<Blog>();
		if(currentPage!=null) {
			pageBean.setCurrentPage(currentPage);
		}
		if(typeId!=null) {
			if(typeId == 0) {
				typeId = blogTypeService.getFirstBlogType();
			}
			pageBean.getBlogDTO().setTypeId(typeId);
		}
		blogService.getPage(pageBean);
		HashMap<String, Object> result = new HashMap<>();
		result.put("pageBean", pageBean);
		String json = JSON.toJSONString(result);
		return json;
	}
	
	
	
	//**********后台管理功能***************
	
	/**
	 * 根据博客id删除博客
	 * @param id
	 * @return
	 */
	@PostMapping(value="/admin/deleteBlog")
	public @ResponseBody String deleteBlog(Integer id) {
		int row = blogService.deleteBlog(id);
		commentService.deleteAllByBlogId(id);
		if(row>0) return "{\"result\":\"success\"}";
		else return "{\"result\":\"failure\"}";
	}
	
	/**
	 * 保存博客，包括草稿和发表的文章
	 * @param map
	 * @return
	 * @throws ParseException
	 * @throws IllegalAccessException
	 * @throws InvocationTargetException
	 */
	@PostMapping(value="/admin/updateBlog")
	public @ResponseBody String updateBlog(@RequestBody Map<String,String> map) throws ParseException, IllegalAccessException, InvocationTargetException {
		Blog blog = new Blog();
		BeanUtils.populate(blog, map);
		BlogType blogType = blogTypeService.getOneById(Integer.parseInt(map.get("typeId")));
		blog.setBlogType(blogType);
		Integer row = blogService.updateBlog(blog);
		if(row>0) return "{\"result\":\"success\"}";
		else return "{\"result\":\"failure\"}";
	}
	
	/***
	 * 编辑博客时进行信息展示
	 * @param id
	 * @param model
	 * @return
	 */
	@GetMapping(value="/admin/editBlog")
	public String editBlog(Integer id,Model model) {
		Blog blog = blogService.getBlogById(id);
		model.addAttribute("blog", blog);
		return "/admin/editBlog";
	}
	
	/**
	 * 条件分页展示博客信息，用于博客管理、我的草稿
	 * @param currentPage 当前页码
	 * @param state 博客状态，1是已发表博客，0是草稿
	 * @param typeId 多条件查询中的博客类型
	 * @param publishYear 多条件查询中的博客创建年份
	 * @param keyWord 多条件查询中的关键字
	 * @param model  封装一页博客数据传递给前端
	 * @return
	 */
	@GetMapping(value="/admin/showBlogs")
	public String showPage(Integer currentPage,Boolean search,Integer state,Integer typeId,String publishYear,String keyWord,Model model) {
		PageBean<Blog> pageBean = new PageBean<Blog>();
		if(currentPage!=null) {
			pageBean.setCurrentPage(currentPage);
		}
		if(search!=null) {
			pageBean.getBlogDTO().setSearch(search);
		}
		if(state!=null) {
			pageBean.getBlogDTO().setState(state);
		}
		if(typeId!=null) {
			pageBean.getBlogDTO().setTypeId(typeId);
		}
		if(publishYear!=null&&publishYear!="") {
			pageBean.getBlogDTO().setPublishYear(publishYear);
		}
		if(keyWord!=null&&keyWord!="") {
			pageBean.getBlogDTO().setKeyWord(keyWord);
		}
		blogService.getPage(pageBean);
		model.addAttribute("pageBean", pageBean);
		if(pageBean.getBlogDTO().getState()==1) {
			return "/admin/blogList";
		}else {
			return "/admin/draftList";
		}
	}
	/**
	 * 获取博客发表年份，以便多条件查询使用
	 * @return
	 */
	@PostMapping(value="/admin/loadPublishYear")
	public @ResponseBody String loadPublishYear(@RequestParam Integer state) {
		List<String> list = blogService.getPublishYear(state);
		String json = JSONArray.toJSONString(list);
		return json;
	}
	/**
	 * 保存博客，包括草稿和发表的文章
	 * @param map
	 * @return
	 * @throws ParseException
	 * @throws IllegalAccessException
	 * @throws InvocationTargetException
	 */
	@PostMapping(value="/admin/publishBlog")
	public @ResponseBody String publishBlog(@RequestBody Map<String,String> map) throws ParseException, IllegalAccessException, InvocationTargetException {
		Blog blog = new Blog();
		BeanUtils.populate(blog, map);
		blog.setReleaseDate(new Date());
		/*SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String releaseDateStr = sdf.format(new Date());
		blog.setReleaseDateStr(releaseDateStr);*/
		blog.setClickHit(0);
		blog.setReplyHi(0);
		BlogType blogType = blogTypeService.getOneById(Integer.parseInt(map.get("typeId")));
		blog.setBlogType(blogType);
		System.out.println(blog);
		Integer row = blogService.insert(blog);
		if(row>0) return "{\"result\":\"success\"}";
		else return "{\"result\":\"failure\"}";
	}
	
	/**
	 * 博客图片上传，使用@responseBody会自动转化为json格式，返回的editor是固定格式{"error":0,"data":["图片1的url","图片2的url"....]}
	 * @param multipartFile
	 * @param request
	 * @return
	 * @throws IOException
	 */
	@PostMapping(value="/admin/upload")
	public @ResponseBody Editor upload(@RequestParam("image") MultipartFile multipartFile,
            HttpServletRequest request) throws IOException {
		String path = request.getServletContext().getRealPath("/views/upload");//图片存储路径
		//System.out.println(path);
		if (!multipartFile.isEmpty()) {
			InputStream in = multipartFile.getInputStream();
			String originalName = multipartFile.getOriginalFilename();
			//System.out.println(originalName);
			String uuidName = UUID.randomUUID().toString();//自动生成一串唯一的字符串
			String newImageName = uuidName + originalName.substring(originalName.lastIndexOf("."));//将唯一字符串与文件类型进行拼接形成新文件名
			FileOutputStream out = new FileOutputStream(path+"/"+newImageName);//文件输出流
			IOUtils.copy(in, out);//拷贝文件
			String[] url = {request.getContextPath()+"/views/upload/"+newImageName};//回显图片的路径
			Editor editor = new Editor(url);
			in.close();
			out.close();
			return editor;
		}
		return null;
	}
}
