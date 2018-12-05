package cn.hengxin.serviceImpl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Date;
import java.util.List;
import java.util.logging.SimpleFormatter;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.hengxin.dao.NewsMapper;
import cn.hengxin.dao.UserMapper;
import cn.hengxin.entity.News;
import cn.hengxin.entity.User;
import cn.hengxin.service.INewsService;
import cn.hengxin.service.IUserService;

@Service
@Transactional
public class NewsServiceImpl implements INewsService{

	@Autowired
	private NewsMapper newsMapper;
	@Autowired
	private ServletContext servletContext;
	
	@Override
	public int newsRelease(News news) {
		// TODO Auto-generated method stub
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		news.setTime(sdf.format(new Date()));
		
		news.setImgAddr(getImgAddress(news.getContent()));
		
		return newsMapper.insertNews(news);

	}
	
	public int newsUpdate(News news){
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		news.setTime(sdf.format(new Date()));
		news.setImgAddr(getImgAddress(news.getContent()));
		
		return newsMapper.updateNews(news);
	}

	@Override
	public List<News> listNews() {
		// TODO Auto-generated method stub
		return newsMapper.listNews();
	}
	
	public News getNews(Integer newsid){
		return newsMapper.getNews(newsid);
	}

	@Override
	public int newsDelete(Integer newsid) {
		
		return newsMapper.deleteNews(newsid);
	}

	@Override
	public int carouselUpdate(Integer newsid,Integer isShow) {
		News news = newsMapper.getNews(newsid);
		news.setIsShow(isShow);
		return newsMapper.updateNews(news);
	}
	
	/*
	 * 从一端html文本中截取img标签的地址
	 */
	private String getImgAddress(String s){
		String regex;
		
		List<String> imgs = new ArrayList<String>();
		regex = "<img.?src=\"(.*?)\".?>";
		Pattern pattern = Pattern.compile(regex,Pattern.DOTALL);
		Matcher matcher = pattern.matcher(s);
		
		while(matcher.find()){
			imgs.add(matcher.group());
		}
	
		if(imgs.size()>0){
			List<String> imgAddress = new ArrayList<String>();
			regex = "src=\"(.*?)\"";
			pattern = Pattern.compile(regex,Pattern.DOTALL);
			for(int i=0;i<imgs.size();++i){
				matcher = pattern.matcher(imgs.get(i));
				while(matcher.find()){
					imgAddress.add(matcher.group(1));
				}
			}
			
			if(imgAddress.size()>0)
				return imgAddress.get(0);
			
		}
		
		return servletContext.getContextPath()+"/assets/images/without.png";
		
	}

	@Override
	public List<News> listLatestNews() {
		// TODO Auto-generated method stub
		return newsMapper.listLatestNews();
	}

	@Override
	public List<News> listCarousel() {
		// TODO Auto-generated method stub
		return newsMapper.listCarousel();
	}
}
