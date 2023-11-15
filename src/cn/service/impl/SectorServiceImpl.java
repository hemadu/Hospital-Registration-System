package cn.service.impl;

import cn.dao.SectorMapper;
import cn.entity.Sector;
import cn.service.SectorService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class SectorServiceImpl implements SectorService {

    @Autowired
    private SectorMapper sectorMapper;

    public SectorMapper getSectorMapper() {
        return sectorMapper;
    }

    public void setSectorMapper(SectorMapper sectorMapper) {
        this.sectorMapper = sectorMapper;
    }

    @Override
    public int add(Sector sector) {
        return sectorMapper.insert(sector);
    }

    @Override
    public int del(Integer id) {
        return sectorMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int update(Sector sector) {
        return sectorMapper.updateByPrimaryKeySelective(sector);
    }

    @Override
    public Sector getById(Integer id) {
        return sectorMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<Sector> getAll() {
        return sectorMapper.selectAll();
    }
}
