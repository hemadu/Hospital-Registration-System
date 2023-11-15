package cn.controller;

import cn.entity.Sector;
import cn.service.SectorService;
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
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/sector")
public class SectorController {
    @Autowired
    private SectorService sectorService;

    public SectorService getSectorService() {
        return sectorService;
    }

    public void setSectorService(SectorService sectorService) {
        this.sectorService = sectorService;
    }

    @RequestMapping("query")
    public String query(HttpServletRequest request){
        List<Sector> sectorList = sectorService.getAll();
        request.setAttribute("sectorList", sectorList);
        return "manage/jsp/sectorlist";
    }

    @RequestMapping("add")
    public String add(Sector sector,HttpServletRequest request){
        sector.setIsdel(0);
        if(sectorService.add(sector)>0){
            return "redirect:/sector/query";
        }else{
            return "manage/jsp/sectoradd";
        }
    }
    //    @RequestMapping("del")
//    public String del(Integer id){
//        if(sectorService.del(id)>0){
//            return "redirect:/sector/query";
//        }
//        return "redirect:/sector/query";
//    }
    @RequestMapping("del/{id}")
    @ResponseBody//将java对象转为json格式的数据
    public HashMap<String, String> deluser(@PathVariable("id") Integer id, HttpServletResponse response){
        HashMap<String, String> resultMap = new HashMap<String, String>();
        if(sectorService.del(id)>0){
            resultMap.put("delResult", "true");
        }else{
            resultMap.put("delResult", "false");
        }
        return resultMap;
    }

    @RequestMapping("update")
    public String update(Integer id,HttpServletRequest request){
        Sector sector=sectorService.getById(id);
        request.setAttribute("sector",sector);
        return "manage/jsp/sectormodify";
    }

    @RequestMapping("updateexe")
    public String updateexe(Sector sector){
        if(!StringUtils.isNullOrEmpty(sector.getName())){
        if(sectorService.update(sector)>0){
            return "redirect:/sector/query";
        }
        }
            return "manage/jsp/sectormodify";
        }
}
