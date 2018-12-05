package cn.hengxin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.hengxin.service.ICaseService;
import cn.hengxin.service.ICoreService;
import cn.hengxin.service.INewsService;
import cn.hengxin.service.IServiceService;

@Controller
public class ViewController {

	@Autowired
	private IServiceService serviceService;
	@Autowired
	private ICoreService coreService;
	@Autowired
	private INewsService newsService;
	@Autowired
	private ICaseService caseService;
	
	@RequestMapping("login")
	public String login(){
		
		return "/front/login";
	}
	
	@RequestMapping("/console/home")
	public String console(){
		
		return "/console/home";
	}
	
	@RequestMapping("/index")
	public String index(){
		
		return "/front/index";
	}
	
	@RequestMapping("/service")
	public String service(Integer id,Model model){
		
		model.addAttribute("service", serviceService.getService(id));
		
		return "/front/service";
	}
	
	@RequestMapping("/core")
	public String core(Integer id,Model model){
		
		model.addAttribute("core",coreService.getCore(id) );
		
		return "/front/core";
	}
	
	@RequestMapping("/news")
	public String news(Integer newsid,Model model){
		
		model.addAttribute("news",newsService.getNews(newsid) );
		
		return "/front/news";
	}
	
	@RequestMapping("/newsCenter")
	public String newsCenter(Model model){
		
		model.addAttribute("newsList",newsService.listNews() );
		
		return "/front/newsCenter";
	}
	
	@RequestMapping("/clients")
	public String clients(){
		
		return "/front/clients";
	}
	
	@RequestMapping("/about")
	public String about(){
		
		return "/front/about";
	}
}
