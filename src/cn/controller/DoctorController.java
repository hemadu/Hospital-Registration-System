package cn.controller;

import cn.entity.Doctor;
import cn.entity.No;
import cn.entity.Person;
import cn.entity.Sector;
import cn.service.DoctorService;
import cn.service.NoService;
import cn.service.PersonService;
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
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/doctor")
public class DoctorController {
    @Autowired
    private DoctorService doctorService;
    @Autowired
    private PersonService personService;
    @Autowired
    private SectorService sectorService;
    @Autowired
    private NoService noService;

    public NoService getNoService() {
        return noService;
    }

    public void setNoService(NoService noService) {
        this.noService = noService;
    }

    public PersonService getPersonService() {
        return personService;
    }

    public void setPersonService(PersonService personService) {
        this.personService = personService;
    }

    public DoctorService getDoctorService() {
        return doctorService;
    }

    public void setDoctorService(DoctorService doctorService) {
        this.doctorService = doctorService;
    }

    public SectorService getSectorService() {
        return sectorService;
    }

    public void setSectorService(SectorService sectorService) {
        this.sectorService = sectorService;
    }


        @RequestMapping("login")
    public String login(String username, String password, String roles, HttpServletRequest request){
            request.getSession().setAttribute("roles",roles);
            if("0".equals(roles)){//是医生
           Doctor doctor=doctorService.login(username, password);
            if(doctor!=null){
                request.getSession().setAttribute(Constants.USER_SESSION,doctor);
                request.getSession().setAttribute("mid",doctor.getId());
                return "redirect:/manage/jsp/index.jsp";
            }else{
                return "redirect:/manage/jsp/login.jsp";
            }
        }else{
            Person person=personService.login(username, password);
            if(person!=null){
                request.getSession().setAttribute(Constants.USER_SESSION,person);
                request.getSession().setAttribute("mid",person.getId());
                return "redirect:/manage/jsp/index.jsp";
            }else{
                return "redirect:/manage/jsp/login.jsp";
            }
        }
    }

    @RequestMapping("logout")
    public String logout(HttpServletRequest request){
        request.getSession().invalidate();
        return "redirect:/manage/jsp/login.jsp";
    }

    @RequestMapping("main")
    public String main(HttpServletRequest request){
        request.getSession().invalidate();
        return "redirect:/doctor/mquery";
    }

    @RequestMapping("mquery")
    public String mquery(String name,Integer sid,Integer type,Integer pageIndex, HttpServletRequest request){
        //设置页面容量
        int pageSize = 9;
        if(pageIndex == null){
            pageIndex=1;
        }
        Map<String,Object>params=new HashMap<String,Object>();
        params.put("currentPageNo",pageIndex);
        params.put("pageSize",pageSize);
        if(!StringUtils.isNullOrEmpty(name)){
            params.put("name",name);
        }
        if(sid!=null&&sid!=0){
            params.put("sid",sid);
            request.setAttribute("sid", sid);
        }
        if(type!=null){
            params.put("type",type);
            request.setAttribute("type", type);
        }
        PageInfo<Doctor> pageInfo = doctorService.getByMap(params);
        request.setAttribute("pageInfo", pageInfo);
        List<Sector>sectorList=null;
        sectorList=sectorService.getAll();
        request.setAttribute("sectorList", sectorList);
        request.setAttribute("name", name);
        request.setAttribute("sid", sid);
        return "jsp/doctorlist";
    }


    @RequestMapping("query")
    public String query(String name,Integer sid,Integer type,Integer pageIndex, HttpServletRequest request){
        //设置页面容量
        int pageSize = Constants.pageSize;
        if(pageIndex == null){
            pageIndex=1;
        }
        Map<String,Object>params=new HashMap<String,Object>();
        params.put("currentPageNo",pageIndex);
        params.put("pageSize",pageSize);
        if(!StringUtils.isNullOrEmpty(name)){
            params.put("name",name);
        }
        if(sid!=null&&sid!=0){
            params.put("sid",sid);
            request.setAttribute("sid", sid);
        }
        if(type!=null){
            params.put("type",type);
            request.setAttribute("type", type);
        }
        PageInfo<Doctor> pageInfo = doctorService.getByMap(params);
        request.setAttribute("pageInfo", pageInfo);
        List<Sector>sectorList=null;
        sectorList=sectorService.getAll();
        request.setAttribute("sectorList", sectorList);
        request.setAttribute("name", name);
        request.setAttribute("sid", sid);
        return "manage/jsp/doctorlist";
    }

    @RequestMapping("exist")
    @ResponseBody//将java对象转为json格式的数据
    public HashMap<String, String> exist(String username, HttpServletResponse response){
        HashMap<String, String> resultMap = new HashMap<String, String>();
        if(StringUtils.isNullOrEmpty(username)){
            //userCode == null && userCode.equals("")
            resultMap.put("username","error");
        }else{
            Doctor doctor = doctorService.check(username);
            if(null != doctor){
                resultMap.put("username","exist");
            }else{
                resultMap.put("username", "notexist");
            }
        }
        return resultMap;
    }

    @RequestMapping("add")
    public String add(HttpServletRequest request){
        List<Sector>sectorList=null;
        sectorList=sectorService.getAll();
        request.setAttribute("sectorList", sectorList);
        return "manage/jsp/doctoradd";

    }

    @RequestMapping("addexe")
    public String addexe(Doctor doctor,HttpServletRequest request){
        doctor.setIsdel(0);
        if(doctorService.add(doctor)>0){
            return "redirect:/doctor/query";
        }else{
            return "manage/jsp/doctoradd";
        }
    }
//    @RequestMapping("del")
//    public String del(Integer id){
//        if(doctorService.del(id)>0){
//            return "redirect:/doctor/query";
//        }
//        return "redirect:/doctor/query";
//    }
    @RequestMapping("del/{id}")
    @ResponseBody//将java对象转为json格式的数据
    public HashMap<String, String> del(@PathVariable("id") Integer id, HttpServletResponse response){
        HashMap<String, String> resultMap = new HashMap<String, String>();
            if(doctorService.del(id)>0){
                resultMap.put("delResult", "true");
            }else{
                resultMap.put("delResult", "false");
            }
        return resultMap;
    }

    @RequestMapping("mupdate")
    public String mupdate(Integer id,HttpServletRequest request){
        Doctor doctor=doctorService.getById(id);
        Calendar calendar = Calendar.getInstance();
        Date now=new Date();
        List<Date> dateList=new ArrayList<Date>();
        for(int i=1;i<=7;i++){
            calendar.setTime(now);
            calendar.add(calendar.DAY_OF_MONTH,+i);
            dateList.add(calendar.getTime());
        }
        request.setAttribute("doctor",doctor);
        request.setAttribute("dateList",dateList);
        return "jsp/doctor";
    }

    @RequestMapping("update")
    public String update(Integer id,HttpServletRequest request){
        Doctor doctor=doctorService.getById(id);
        request.setAttribute("doctor",doctor);
        return "manage/jsp/usermodify";
    }

    @RequestMapping("updateexe")
    public String updateexe(Doctor doctor,HttpServletRequest request){
    if(doctorService.update(doctor)>0){
        request.getSession().setAttribute(Constants.USER_SESSION,doctor);
        return "redirect:/doctor/update?id="+doctor.getId();
    }else{
        return "manage/jsp/usermodify";
    }
    }

    @RequestMapping("updateList")
    public String updateList(Integer id,HttpServletRequest request){
        Doctor doctor=doctorService.getById(id);
        request.setAttribute("doctor",doctor);
        List<Sector>sectorList=null;
        sectorList=sectorService.getAll();
        request.setAttribute("sectorList", sectorList);
        return "manage/jsp/doctormodify";
    }
    @RequestMapping("updateListexe")
    public String updateListexe(Doctor doctor){
            if(doctorService.update(doctor)>0){
                return "redirect:/doctor/query";
            }
        return "manage/jsp/doctormodify";
    }


    @RequestMapping("updatepwd")
    public String updatepwd(String password,HttpServletRequest request){
        if(!StringUtils.isNullOrEmpty(password)){
            Integer mid = (Integer) request.getSession().getAttribute("mid");
            Doctor doctor=doctorService.getById(mid);
            doctor.setPassword(password);
            if(doctorService.update(doctor)>0){
                return "redirect:/doctor/update?id="+doctor.getId();
            }
        }

        return "manage/jsp/usermodify";
    }



    @RequestMapping("pwdupdate")
    @ResponseBody//将java对象转为json格式的数据
    public Map<String, String> pwdupdate(String oldpassword, HttpServletRequest request,HttpServletResponse response){
            Object o = request.getSession().getAttribute(Constants.USER_SESSION);
            Map<String, String> resultMap = new HashMap<String, String>();
            if(null == o ){//session过期
                resultMap.put("result", "sessionerror");
            }else if(StringUtils.isNullOrEmpty(oldpassword)){//旧密码输入为空
                resultMap.put("result", "error");
            }else{
                String sessionPwd = ((Doctor)o).getPassword();
                if(oldpassword.equals(sessionPwd)){
                    resultMap.put("result", "true");
                }else{//旧密码输入不正确
                    resultMap.put("result", "false");
                }
            }
            return resultMap;
    }

    @RequestMapping("pwdsave")
    public String pwdsave(String newpassword, HttpServletRequest request){
        Object o = request.getSession().getAttribute(Constants.USER_SESSION);
        int flag = 0;
        if(o != null && !StringUtils.isNullOrEmpty(newpassword)){
            Doctor doctor=((Doctor)o);
            doctor.setPassword(newpassword);
            flag = doctorService.update(doctor);
            if(flag>0){
                request.setAttribute(Constants.SYS_MESSAGE, "修改密码成功,请退出并使用新密码重新登录！");
                //removeAttribute(Constants.USER_SESSION);//session注销
            }else{
                request.setAttribute(Constants.SYS_MESSAGE, "修改密码失败！");
            }
        }else{
            request.setAttribute(Constants.SYS_MESSAGE, "修改密码失败！");
        }
        return "manage/jsp/pwdupdate";
    }
}
