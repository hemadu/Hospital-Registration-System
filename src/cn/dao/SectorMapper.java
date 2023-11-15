package cn.dao;

import cn.entity.Sector;

import java.util.List;
import java.util.Map;

public interface SectorMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Sector record);

    int insertSelective(Sector record);

    Sector selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Sector record);

    int updateByPrimaryKey(Sector record);

    List<Sector> selectAll();
}