package cn.service;



import cn.entity.Sector;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface SectorService {
	public int add(Sector sector);
	public int del(Integer id);
	public int update(Sector sector);
	public Sector getById(Integer id);
	public List<Sector> getAll();
}
