package cn.hengxin.service;

import java.util.List;

import cn.hengxin.entity.News;


public interface INewsService {

	List<News> listNews();
	News getNews(Integer newsid);
	int newsRelease(News news);
	int newsUpdate(News news);
	int newsDelete(Integer newsid);
	int carouselUpdate(Integer newsid,Integer isShow);
	List<News> listLatestNews();
	List<News> listCarousel();
}
