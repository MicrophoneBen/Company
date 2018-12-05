package cn.hengxin.controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.hengxin.dao.NewsMapper;
import cn.hengxin.entity.News;
import cn.hengxin.service.INewsService;

@Controller
public class NewsController {

	@Autowired
	private ServletContext servletContext;
	@Autowired
	private INewsService newsService;
	
	@RequestMapping("/console/newsManage")
	public String newsManage(Model model){
		
		model.addAttribute("newsList",newsService.listNews());
		
		return "/console/newsManage";
	}
	
	@RequestMapping("/console/newsRelease")
	public String newsRelease(Model model){
		
		System.out.println("page:newsRelease");
		model.addAttribute("newsAction","newsRelease");
		
		return "/console/newsEdit";
	}
	
	@RequestMapping("/console/newsRelease.action")
	public void newsReleaseAction(News news,HttpServletResponse response) throws IOException{
		
		
		int row = newsService.newsRelease(news);
		
		if(row>0){
			servletContext.setAttribute("latestNews", newsService.listLatestNews());
			servletContext.setAttribute("carousel", newsService.listCarousel());
			response.getWriter().print("success");
		}
			
		else
			response.getWriter().print("fail");
		
	}
	
	@RequestMapping("/console/newsUpdate")
	public String newsUpdate(Integer newsid,HttpServletResponse response,Model model) throws IOException{
		
		
		System.out.println("page:newsUpdate");
		model.addAttribute("newsAction","newsUpdate");
		model.addAttribute("news",newsService.getNews(newsid));
		
		return "/console/newsEdit";
		
	}
	
	@RequestMapping("/console/newsUpdate.action")
	public void newsUpdateAction(News news,HttpServletResponse response) throws IOException{

		int row = newsService.newsUpdate(news);
		
		if(row>0){
			servletContext.setAttribute("latestNews", newsService.listLatestNews());
			servletContext.setAttribute("carousel", newsService.listCarousel());
			response.getWriter().print("success");
		}	
		else
			response.getWriter().print("fail");
		
	}
	
	@RequestMapping("/console/newsDelete.action")
	public void newsDeleteeAction(Integer newsid,HttpServletResponse response) throws IOException{

		int row = newsService.newsDelete(newsid);
		
		if(row>0){
			servletContext.setAttribute("latestNews", newsService.listLatestNews());
			servletContext.setAttribute("carousel", newsService.listCarousel());
			response.getWriter().print(
					"<script>"
					+"alert('success');"
					+"location.href='newsManage';"
					+ "</script>"
					);
		}
			
		else{
			response.getWriter().print(
					"<script>"
					+"alert('fail');"
					+ "</script>"
					);
		}
			
		
	}
	

	@RequestMapping("/console/carouselUpdate.action")
	public void carouselUpdateAction(Integer newsid,Integer isShow,HttpServletResponse response) throws IOException{

		int row = newsService.carouselUpdate(newsid, isShow);
		
		if(row>0){
			servletContext.setAttribute("latestNews", newsService.listLatestNews());
			servletContext.setAttribute("carousel", newsService.listCarousel());
			response.getWriter().print(
					"<script>"
					+"alert('success');"
					+"location.href='newsManage';"
					+ "</script>"
					);
		}
			
		else{
			response.getWriter().print(
					"<script>"
					+"alert('fail');"
					+ "</script>"
					);
		}
		
	}
}
