package cn.dao;

import cn.entity.Doctor;

import java.util.List;
import java.util.Map;

public interface DoctorMapper {
    int deleteByPrimaryKey(Integer id);

    int delete(Integer id);

    int insert(Doctor record);

    int insertSelective(Doctor record);

    Doctor selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Doctor record);

    int updateByPrimaryKey(Doctor record);

    List<Doctor> selectAll(Map<String,Object> params);

    public Doctor check(String username);

}