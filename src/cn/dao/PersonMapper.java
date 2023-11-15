package cn.dao;

import cn.entity.Person;

import java.util.List;
import java.util.Map;

public interface PersonMapper {
    int deleteByPrimaryKey(Integer id);

    int delete(Integer id);

    int insert(Person record);

    int insertSelective(Person record);

    Person selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Person record);

    int updateByPrimaryKey(Person record);

    Person check(String username);

    List<Person> selectAll(Map<String,Object> params);
}