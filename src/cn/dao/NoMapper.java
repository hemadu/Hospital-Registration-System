package cn.dao;

import cn.entity.No;

import java.util.Date;
import java.util.List;
import java.util.Map;

public interface NoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(No record);

    int insertSelective(No record);

    No selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(No record);

    int updateByPrimaryKey(No record);

    List<No> getByMap(Map<String,Object>params);
    int getByDid(Map<String,Object>params);


    List<Map<String,Object>>getSum1(Date Date);
    List<Map<String,Object>>getSum2(Date Date);
    List<Map<String,Object>>getSum3(Date Date);
    List<Map<String,Object>>getSum4(Date Date);
    List<Map<String,Object>>getSum5(Date Date);
    List<Map<String,Object>>getSum6(Date Date);
}