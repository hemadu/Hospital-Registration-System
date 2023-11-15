package cn.controller;

import cn.entity.*;
import cn.entity.News;
import cn.service.NewsService;
import cn.tools.Constants;
import com.alibaba.fastjson.JSONArray;
import com.github.pagehelper.PageInfo;
import com.mysql.jdbc.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/news")
public class NewsController {
    @Autowired
    private NewsService newsService;

    public NewsService getNewsService() {
        return newsService;
    }

    public void setNewsService(NewsService newsService) {
        this.newsService = newsService;
    }

    @RequestMapping("mquery")
    public String mquery(String title,Integer type,Integer pageIndex, HttpServletRequest request){
        //设置页面容量
        int pageSize = Constants.pageSize;
        if(pageIndex == null){
            pageIndex=1;
        }
        Map<String,Object>params=new HashMap<String,Object>();
        params.put("currentPageNo",pageIndex);
        params.put("pageSize",pageSize);
        if(!StringUtils.isNullOrEmpty(title)){
            params.put("title",title);
            request.setAttribute("title", title);
        }
        if(type!=null){
            params.put("type",type);
            request.setAttribute("type", type);
        }
        PageInfo<News> pageInfo = newsService.getByMap(params);
        request.setAttribute("pageInfo", pageInfo);
        return "jsp/news";
    }

    @RequestMapping("query")
    public String query(String title,Integer type,Integer pageIndex, HttpServletRequest request){
        //设置页面容量
        int pageSize = Constants.pageSize;
        if(pageIndex == null){
            pageIndex=1;
        }
        Map<String,Object>params=new HashMap<String,Object>();
        params.put("currentPageNo",pageIndex);
        params.put("pageSize",pageSize);
        if(!StringUtils.isNullOrEmpty(title)){
            params.put("title",title);
            request.setAttribute("title", title);
        }
        if(type!=null){
            params.put("type",type);
            request.setAttribute("type", type);
        }
        PageInfo<News> pageInfo = newsService.getByMap(params);
        request.setAttribute("pageInfo", pageInfo);
        return "manage/jsp/newslist";
    }

    @RequestMapping("add")
    public String add(News news,HttpServletRequest request){
//        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date now=new Date();
        news.setTime(now);
        if(newsService.add(news)>0){
            return "redirect:/news/query";
        }else{
            return "manage/jsp/newsadd";
        }
    }
    //    @RequestMapping("del")
//    public String del(Integer id){
//        if(newsService.del(id)>0){
//            return "redirect:/news/query";
//        }
//        return "redirect:/news/query";
//    }
    @RequestMapping("del/{id}")
    @ResponseBody//将java对象转为json格式的数据
    public HashMap<String, String> deluser(@PathVariable("id") Integer id, HttpServletResponse response){
        HashMap<String, String> resultMap = new HashMap<String, String>();
        if(newsService.del(id)>0){
            resultMap.put("delResult", "true");
        }else{
            resultMap.put("delResult", "false");
        }
        return resultMap;
    }

    @RequestMapping("mupdate")
    public String mupdate(Integer id,HttpServletRequest request){
        News news=newsService.getById(id);
        request.setAttribute("news",news);
        return "jsp/newsdetail";
    }

    @RequestMapping("update")
    public String update(Integer id,HttpServletRequest request){
        News news=newsService.getById(id);
        request.setAttribute("news",news);
        return "manage/jsp/newsmodify";
    }

    @RequestMapping("updateexe")
    public String updateexe(News news){
        if(newsService.update(news)>0){
            return "redirect:/news/query";
        }else{
            return "manage/jsp/newsmodify";
        }
    }
}
