package cn.service.impl;

import cn.dao.NoMapper;
import cn.entity.No;
import cn.service.NoService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class NoServiceImpl implements NoService {

    @Autowired
    private NoMapper noMapper;

    public NoMapper getNoMapper() {
        return noMapper;
    }

    public void setNoMapper(NoMapper noMapper) {
        this.noMapper = noMapper;
    }

    @Override
    public int add(No no) {//生成预约单
        return noMapper.insert(no);
    }

    @Override
    public int del(Integer id) {
        return noMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int update(No no) {
        return noMapper.updateByPrimaryKeySelective(no);
    }

    @Override
    public int getByDid(Integer did,Date date,Integer time) {
        Map<String,Object>params=new HashMap<String, Object>();
        params.put("did",did);
        params.put("date",date);
        params.put("time",time);
        return noMapper.getByDid(params);
    }

    @Override
    public PageInfo<No> getByMap(Map params) {
        PageHelper.startPage((Integer)params.get("currentPageNo"),(Integer)params.get("pageSize"));
        List<No> noList=null;
        noList=noMapper.getByMap(params);
        return new PageInfo<No>(noList);
    }

    @Override
    public No getById(Integer id) {
        return noMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<Map<String, Object>> getSum(Date date) {
        List<Map<String,Object>>mapList=new ArrayList<Map<String, Object>>();
        Map<String,Object>map=null;
        long a1=(long)noMapper.getSum1(date).get(0).get("num");//全院当天预约挂号数量
        long a2=(long)noMapper.getSum2(date).get(0).get("num");//全院当天实际就诊数量
        map=new HashMap<String, Object>();
        map.put("num1",1.0*a2/a1);//就诊率
        map.put("num2",1-1.0*a2/a1);//失约率
        map.put("noName","院");
        mapList.add(map);

        for(int i=0;i<noMapper.getSum3(date).size();i++){
            map=new HashMap<String, Object>();
            long b1=(long)noMapper.getSum3(date).get(i).get("num");//各科室当天预约挂号数量
            long b2=(long)noMapper.getSum4(date).get(i).get("num");//各科室当天实际就诊数量
            String name=(String)noMapper.getSum3(date).get(i).get("name");//科室名
            map.put("num1",1.0*b2/b1);
            map.put("num2",1-1.0*b2/b1);
            map.put("noName",name);
            mapList.add(map);
        }

        long c1=(long)noMapper.getSum5(date).get(0).get("num");//专家当天预约挂号数量
        long c2=(long)noMapper.getSum6(date).get(0).get("num");//专家当天实际就诊数量

        map=new HashMap<String, Object>();
        map.put("num1",1.0*c2/c1);//就诊率
        map.put("num2",1-1.0*c2/c1);//失约率
        map.put("noName","专家");
        mapList.add(map);
        return mapList;
    }
}
