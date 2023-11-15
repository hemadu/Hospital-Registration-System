package cn.tools;

import cn.entity.Doctor;
import cn.entity.No;
import cn.entity.Sector;
import cn.service.DoctorService;
import cn.service.NoService;
import cn.service.SectorService;
import cn.service.impl.SectorServiceImpl;
import com.github.pagehelper.PageInfo;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class SpringTest {
    public static void main(String[] args){
        //加载配置文件
        ApplicationContext ctx=new ClassPathXmlApplicationContext("applicationContext.xml");
        DoctorService doctorService = (DoctorService)SpringUtil.getBean("doctorServiceImpl");
        SectorService sectorService=(SectorService) SpringUtil.getBean("sectorServiceImpl");
        NoService noService=(NoService) SpringUtil.getBean("noServiceImpl");
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");
        Date date1=null;
        try {
            date1=simpleDateFormat.parse("2020-06-19");
        } catch (ParseException e) {
            e.printStackTrace();
        }
        noService.getSum(date1);
        //Integer a1=(Integer)noMapper.getSum1(date).get(0).get("num");
        sectorService.getAll();

        //add
        // System.out.println(doctorService.add(new Doctor(null,null,"d222","222",2,0,28,"男","陈秋实",30,"15022222222",0)));//userService.getUserCount(null,null)
        //del
        //System.out.println(doctorService.del(2));
        //从容器里面获取对象
        //update
        //System.out.println(doctorService.update(new Doctor(3,"11","d222","222",2,0,28,"男","陈秋实",30,"15022222222",0)));
        //getById




//        Map<String,Object> map=new HashMap<String, Object>();
//        String state="0";
//        String pid="1";
//        map.put("state",state);
//        map.put("pid",pid);
//        map.put("currentPageNo",1);
//        map.put("pageSize",1);
//
//        PageInfo<No> pageInfo = noService.getByMap(map);
//        for(int i=0;i<pageInfo.getSize();i++){
//            System.out.println(pageInfo);
//        }

        //login
        //System.out.println(doctorService.login("d111","112"));
        //check
        //System.out.println(doctorService.check("d111"));


//        Hello hello=(Hello)ctx.getBean("hello");
//        hello.print();
//        Printer printer=(Printer)ctx.getBean("printer");
//        printer.print();
//        BookService bookService=(BookService)ctx.getBean("bookService");
//        bookService.buy("西游记",50,10);
    }

}
