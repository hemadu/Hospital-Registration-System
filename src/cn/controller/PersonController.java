package cn.controller;

import cn.entity.Doctor;
import cn.entity.Person;
import cn.entity.Sector;
import cn.service.PersonService;
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
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/person")
public class PersonController {
    @Autowired
    private PersonService personService;

    public PersonService getPersonService() {
        return personService;
    }

    public void setPersonService(PersonService personService) {
        this.personService = personService;
    }

    @RequestMapping("mlogin")//main login
    public String beforelogin(String username, String password,HttpServletRequest request){
            Person person=personService.login(username, password);
            if(person!=null&&person.getRole()==0){
                request.getSession().setAttribute(Constants.USER_SESSION,person);
                request.getSession().setAttribute("mid",person.getId());
                return "redirect:/doctor/mquery";
            }else{
                return "redirect:/jsp/login.jsp";
            }
    }

    @RequestMapping("mlogout")
    public String mlogout(HttpServletRequest request){
        request.getSession().invalidate();
        return "redirect:/doctor/mquery";

    }

//    @RequestMapping("into")//前台跳往后台
//    public String into( HttpServletRequest request){
//        Person person=(Person) request.getSession().getAttribute("userSession");
//        if(person==null){
//            return "redirect:/manage/jsp/login.jsp";
//        }else{
//            request.getSession().setAttribute("roles","2");
//            return "redirect:/manage/jsp/index.jsp";
//        }
//    }

//    @RequestMapping("login")
//    public String login(String username, String password, HttpServletRequest request){
//        Person person=personService.login(username, password);
//        if(person!=null){
//            request.getSession().setAttribute(Constants.USER_SESSION,person);
//            return "jsp/query";
//        }else{
//            return "login";
//        }
//
//    }

    @RequestMapping("logout")
    public String logout(HttpServletRequest request){
        request.getSession().invalidate();
        return "redirect:/manage/jsp/login.jsp";

    }

    @RequestMapping("mupdatepwd")
    public String mupdatepwd(String password,HttpServletRequest request){
        if(!StringUtils.isNullOrEmpty(password)){
            Integer mid = (Integer) request.getSession().getAttribute("mid");
            Person person=personService.getById(mid);
            person.setPassword(password);
            personService.update(person);
        }
        return "redirect:/person/mlogout";
    }


    @RequestMapping("updatepwd")
    public String updatepwd(String password,HttpServletRequest request){
        if(!StringUtils.isNullOrEmpty(password)){
            Integer mid = (Integer) request.getSession().getAttribute("mid");
            Person person=personService.getById(mid);
            person.setPassword(password);
            if(personService.update(person)>0){
                return "redirect:/person/update?id="+person.getId();
            }
        }

        return "manage/jsp/usermodify";
    }

    @RequestMapping("query")
    public String query(String name,Integer role,Integer pageIndex, HttpServletRequest request){
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
            request.setAttribute("name", name);
        }
        if(role!=null){
            params.put("role",role);
            request.setAttribute("role", role);
        }
        PageInfo<Person> pageInfo = personService.getByMap(params);
        request.setAttribute("pageInfo", pageInfo);
        return "manage/jsp/personlist";
    }

    @RequestMapping("exist")
    @ResponseBody//将java对象转为json格式的数据
    public HashMap<String, String> exist(String username, HttpServletResponse response){
        HashMap<String, String> resultMap = new HashMap<String, String>();
        if(StringUtils.isNullOrEmpty(username)){
            //userCode == null || userCode.equals("")
            resultMap.put("username","error");
        }else{
            Person person = personService.check(username);
            if(null != person){
                resultMap.put("username","exist");
            }else{
                resultMap.put("username", "notexist");
            }
        }
        return resultMap;
    }

    @RequestMapping("madd")
    public String madd(Person person){
        person.setRole(0);
        person.setIsdel(0);
        if(personService.add(person)>0){
            return "redirect:/jsp/login.jsp";
        }else{
            return "redirect:/error";
        }
    }

    @RequestMapping("add")
    public String add(Person person){
//        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//        Date now=new Date();
//        person.setCard(simpleDateFormat.format(now));
        person.setRole(0);
        person.setIsdel(0);
        if(personService.add(person)>0){
            return "redirect:/manage/jsp/login.jsp";
        }else{
            return "redirect:/error";
        }
    }
    //    @RequestMapping("del")
//    public String del(Integer id){
//        if(personService.del(id)>0){
//            return "redirect:/person/query";
//        }
//        return "redirect:/person/query";
//    }
    @RequestMapping("del/{id}")
    @ResponseBody//将java对象转为json格式的数据
    public HashMap<String, String> del(@PathVariable("id") Integer id, HttpServletResponse response){
        HashMap<String, String> resultMap = new HashMap<String, String>();
        if(personService.del(id)>0){
            resultMap.put("delResult", "true");
        }else{
            resultMap.put("delResult", "false");
        }
        return resultMap;
    }



    @RequestMapping("updateList")
    public String updateList(Integer id,HttpServletRequest request){
        Person person=personService.getById(id);
        request.setAttribute("person",person);
        List<Sector>sectorList=null;
        return "manage/jsp/personmodify";
    }
    @RequestMapping("updateListexe")
    public String updateListexe(Person person){
            if(personService.update(person)>0){
                return "redirect:/person/query";
            }
        return "manage/jsp/personmodify";
    }

    @RequestMapping("mupdate")
    public String mupdate(Integer id,HttpServletRequest request){
        Person person=personService.getById(id);
        request.getSession().setAttribute(Constants.USER_SESSION,person);
        return "jsp/person";
    }

    @RequestMapping("mupdateexe")
    public String mupdateexe(Person person,HttpServletRequest request){
        if(personService.update(person)>0){
            return "redirect:/person/mupdate?id="+person.getId();
        }else{
            return "jsp/person";
        }
    }

    @RequestMapping("update")
    public String update(Integer id,HttpServletRequest request){
        Person person=personService.getById(id);
        request.setAttribute("person",person);
        return "manage/jsp/usermodify";
    }


    @RequestMapping("updateexe")
    public String updateexe(Person person,HttpServletRequest request){
        if(personService.update(person)>0){
            request.getSession().setAttribute(Constants.USER_SESSION,person);
            return "redirect:/person/update?id="+person.getId();
        }else{
            return "manage/jsp/usermodify";
        }
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
            String sessionPwd = ((Person)o).getPassword();
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
            Person person=((Person)o);
            person.setPassword(newpassword);
            flag = personService.update(person);
            if(flag>0){
                request.setAttribute(Constants.SYS_MESSAGE, "修改密码成功,请退出并使用新密码重新登录！");
                //removeAttribute(Constants.USER_SESSION);//session注销
            }else{
                request.setAttribute(Constants.SYS_MESSAGE, "修改密码失败！");
            }
        }else{
            request.setAttribute(Constants.SYS_MESSAGE, "修改密码失败！");
        }
        return "jsp/pwdupdate";
    }
}
