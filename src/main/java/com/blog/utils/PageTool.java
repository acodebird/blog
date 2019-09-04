package com.blog.utils;

import com.blog.domain.PageBean;

public class PageTool {
	public static void getPageBean(PageBean pageBean){
		int totalPage = pageBean.getTotalPage();
		int begin = 1;
		int end = totalPage;
		if(totalPage>0){
			begin = pageBean.getCurrentPage() - 2;
			if(begin<1){
				begin = 1;
			}
			end = begin + 4;
			if(end>totalPage){
				end = totalPage;
			}
			begin = end - 4;
			if(begin<1){
				begin = 1;
			}
		}
		pageBean.setBegin(begin);
		pageBean.setEnd(end);
	}
}
