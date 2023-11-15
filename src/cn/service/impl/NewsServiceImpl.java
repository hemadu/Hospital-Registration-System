package cn.service.impl;

import cn.dao.NewsMapper;
import cn.entity.Doctor;
import cn.entity.News;
import cn.service.NewsService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
@Service
public class NewsServiceImpl implements NewsService {

    @Autowired
    private NewsMapper newsMapper;

    public NewsMapper getNewsMapper() {
        return newsMapper;
    }

    public void setNewsMapper(NewsMapper newsMapper) {
        this.newsMapper = newsMapper;
    }

    @Override
    public int add(News news) {
        return newsMapper.insert(news);
    }

    @Override
    public int del(Integer id) {
        return newsMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int update(News news) {
        return newsMapper.updateByPrimaryKeySelective(news);
    }

    @Override
    public PageInfo<News> getByMap(Map<String,Object> parmas) {
        PageHelper.startPage((Integer)parmas.get("currentPageNo"),(Integer) parmas.get("pageSize"));
        List<News> newsList=null;
        newsList=newsMapper.selectAll(parmas);
        return new PageInfo<News>(newsList);
    }

    @Override
    public News getById(Integer id) {
        return newsMapper.selectByPrimaryKey(id);
    }
}
