package cn.hengxin.dao;

import java.util.List;

import cn.hengxin.entity.News;

public interface NewsMapper {

	List<News> listNews();
	News getNews(int newsid);
	List<News> listCarousel();
	List<News> listLatestNews();
	int insertNews(News news);
	int updateNews(News news);
	int deleteNews(int newsid);
}
