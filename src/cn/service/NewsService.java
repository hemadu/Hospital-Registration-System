package cn.service;

import cn.entity.News;
import com.github.pagehelper.PageInfo;

import java.util.List;
import java.util.Map;

public interface NewsService {
	public int add(News news);
	public int del(Integer id);
	public int update(News news);
	public PageInfo<News> getByMap(Map<String,Object> parmas);
	public News getById(Integer id);
}
