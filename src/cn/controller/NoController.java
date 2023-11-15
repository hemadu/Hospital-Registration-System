package cn.controller;

import cn.entity.Doctor;
import cn.entity.No;
import cn.entity.Sector;
import cn.service.DoctorService;
import cn.service.NoService;
import cn.service.SectorService;
import cn.tools.Constants;
import com.alibaba.fastjson.JSONArray;
import com.github.pagehelper.PageInfo;
import com.mysql.jdbc.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.print.Doc;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/no")
public class NoController {
    @Autowired
    private NoService noService;
    @Autowired
    private SectorService sectorService;
    @Autowired
    private DoctorService doctorService;

    public NoService getNoService() {
        return noService;
    }

    public void setNoService(NoService noService) {
        this.noService = noService;
    }

    public SectorService getSectorService() {
        return sectorService;
    }

    public void setSectorService(SectorService sectorService) {
        this.sectorService = sectorService;
    }

    public DoctorService getDoctorService() {
        return doctorService;
    }

    public void setDoctorService(DoctorService doctorService) {
        this.doctorService = doctorService;
    }

    @RequestMapping("getSumNow")
    @ResponseBody//将java对象转为json格式的数据
    public List<Map<String, Object>> getSumNow( HttpServletRequest request) {
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");
        Date date=new Date(System.currentTimeMillis());
        try {
            String a=simpleDateFormat.format(date);
            date=simpleDateFormat.parse(a);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        return noService.getSum(date);
    }


    @RequestMapping("getSum")
    @ResponseBody//将java对象转为json格式的数据
    public List<Map<String, Object>> getSum(String date, HttpServletRequest request) {
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");
        Date date1=null;
        try {
            date1=simpleDateFormat.parse(date);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return noService.getSum(date1);
    }

    @RequestMapping("mquery")
    public String mquery(Integer state,Integer pageIndex, HttpServletRequest request){

        //设置页面容量
        int pageSize = Constants.pageSize;
        if(pageIndex == null){
            pageIndex=1;
        }
        Map<String,Object> params=new HashMap<String, Object>();
        Integer mid=(Integer) request.getSession().getAttribute("mid");
        params.put("pid",mid);
        params.put("currentPageNo",pageIndex);
        params.put("pageSize",pageSize);
        if(state!=null){
            params.put("state",state);
        }
        PageInfo<No> pageInfo = noService.getByMap(params);
//        Calendar calendar = Calendar.getInstance();
//        for(int i=0;i<pageInfo.getSize();i++){
//            calendar.setTime(pageInfo.getList().get(i).getDate());
//            calendar.add(calendar.DAY_OF_MONTH,+7);
//            pageInfo.getList().get(i).setAtime(calendar.getTime());
//        }
        request.setAttribute("pageInfo", pageInfo);
        request.setAttribute("state", state);

        return "jsp/nodetail";
    }

    @RequestMapping("query")
    public String query(String sid,String type,String name,Integer state,Integer id,Integer pageIndex, HttpServletRequest request){

        //?id=1&roles=0&state=0&type=0&name=0
        //设置页面容量
        int pageSize = Constants.pageSize;
        if(pageIndex == null){
            pageIndex=1;
        }
        Map<String,Object> params=new HashMap<String, Object>();

        String roles=(String) request.getSession().getAttribute("roles");
        Integer mid=(Integer) request.getSession().getAttribute("mid");
        if("0".equals(roles)){//是医生
                params.put("did",mid);

        }else{//不是医生  type拿来查专家
            if(!StringUtils.isNullOrEmpty(roles)){
                if(!StringUtils.isNullOrEmpty(type)){
                    params.put("type",type);
                    request.setAttribute("type", type);
                }
                if(!StringUtils.isNullOrEmpty(sid)){
                    params.put("sid",sid);
                    request.setAttribute("sid", sid);
                }
                params.put("pid",mid);

                List<Sector> sectorList = null;
                sectorList = sectorService.getAll();
                request.setAttribute("sectorList", sectorList);
            }
        }

        params.put("currentPageNo",pageIndex);
        params.put("pageSize",pageSize);

        if(!StringUtils.isNullOrEmpty(name)){
            params.put("name",name);
        }
        if(state!=null){
            params.put("state",state);
        }
        PageInfo<No> pageInfo = noService.getByMap(params);
//        Calendar calendar = Calendar.getInstance();
//        for(int i=0;i<pageInfo.getSize();i++){
//            calendar.setTime(pageInfo.getList().get(i).getDate());
//            calendar.add(calendar.DAY_OF_MONTH,+7);
//            pageInfo.getList().get(i).setAtime(calendar.getTime());
//        }
        request.setAttribute("pageInfo", pageInfo);
        request.setAttribute("state", state);
        request.setAttribute("name", name);
        if("0".equals(roles)){
            return "manage/jsp/dnolist";
        }else if("2".equals(roles)){
            return "manage/jsp/pnolist";
        }else{
            return "manage/jsp/sectorlist";
        }

    }

    @RequestMapping("padd")
    @ResponseBody//将java对象转为json格式的数据
    public Map<String, String> padd(No no,HttpServletRequest request) {
        HashMap<String, String> resultMap = new HashMap<String, String>();
        if(no!=null){
            Integer pid=(Integer) request.getSession().getAttribute("mid");
            Integer num=(Integer) noService.getByDid(no.getDid(),no.getDate(),no.getTime());//时段成功预约量
            Integer sum=doctorService.getById(no.getDid()).getNum();//预约总量
            if(num<sum/4){//预约量有剩余时
                no.setPid(pid);
                no.setState(0);
                no.setIsdel(0);
                if(noService.add(no)>0){
                    resultMap.put("Result", "true");
                }else{
                    resultMap.put("Result", "404");
                }

            }else{
                resultMap.put("Result", "error");
            }
        }else{
            resultMap.put("Result", "false");
        }
        return resultMap;
    }

    @RequestMapping("add")
    public String add(Integer did,HttpServletRequest request) {
        Doctor doctor=doctorService.getById(did);
        //No no=noService.get
        Sector sector=sectorService.getById(doctor.getSid());
        return  null;
    }
    @RequestMapping("addexe")
    public String addexe(No no,HttpServletRequest request){
//        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date now=new Date();
        no.setDate(now);
//        //no.set
        if(noService.add(no)>0){
            return "redirect:/no/query";
        }else{
            return "jsp/noadd";
        }
    }
    //    @RequestMapping("del")
//    public String del(Integer id){
//        if(noService.del(id)>0){
//            return "redirect:/no/query";
//        }
//        return "redirect:/no/query";
//    }
    @RequestMapping("del/{id}")
    @ResponseBody//将java对象转为json格式的数据
    public HashMap<String, String> deluser(@PathVariable("id") Integer id, HttpServletResponse response){
        HashMap<String, String> resultMap = new HashMap<String, String>();
        if(noService.del(id)>0){
            resultMap.put("delResult", "true");
        }else{
            resultMap.put("delResult", "false");
        }
        return resultMap;
    }

    @RequestMapping("daddNo")
    public String daddNo(Integer id,HttpServletRequest request,HttpServletResponse response) throws IOException {
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out=response.getWriter();

        String roles=(String) request.getSession().getAttribute("roles");
        Integer mid=(Integer) request.getSession().getAttribute("mid");
        No no=noService.getById(id);

        Integer num=(Integer) noService.getByDid(no.getDid(),no.getDate(),no.getTime());//时段成功预约量
        Integer sum=doctorService.getById(no.getDid()).getNum();//预约总量
        if(num<sum/4) {//预约量有剩余时
            if(no.getState()==0){
                no.setState(1);
                if(noService.update(no)>0){
                    return "redirect:/no/query?id="+id+"&roles="+roles+"&state="+0;
                }
            }else if(no.getState()==1){
                no.setState(2);
                if(noService.update(no)>0){
                    return "redirect:/no/query?id="+id+"&roles="+roles+"&state="+1;
                }
            }

        }else{
            out.print("<script>alert('该时段预约量已满! ');location.href='"+Constants.ROOT+"no/query?id="+mid+"&roles="+roles+"&state="+0+"';</script>");
            out.close();
            return null;
        }
        out.close();
        return "redirect:/no/query?id="+id+"&roles="+roles+"&state="+0;

    }
    @RequestMapping("ddelNo")
    public String ddelNo(Integer id,HttpServletRequest request){
        String roles=(String) request.getSession().getAttribute("roles");
        Integer mid=(Integer) request.getSession().getAttribute("mid");
        No no=noService.getById(id);
        if(no.getState()==0){
            no.setState(3);
            if(noService.update(no)>0){
                return "redirect:/no/query?id="+mid+"&roles="+roles+"&state="+0;
            }
        }
        return "manage/jsp/dnolist";
    }


    @RequestMapping("update")
    public String update(Integer id,HttpServletRequest request){
        No no=noService.getById(id);
        request.setAttribute("no",no);
        return "jsp/nomodify";
    }

    @RequestMapping("updateexe")
    public String updateexe(No no){
        if(noService.update(no)>0){
            return "redirect:/no/query";
        }else{
            return "jsp/nomodify";
        }
    }
}
