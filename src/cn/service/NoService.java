package cn.service;


import cn.entity.Doctor;
import cn.entity.No;
import com.github.pagehelper.PageInfo;

import java.util.Date;
import java.util.List;
import java.util.Map;

public interface NoService {
	public int add(No no);
	public int del(Integer id);
	public int update(No no);
	public PageInfo<No> getByMap(Map<String,Object> params);
	public No getById(Integer id);
	public List<Map<String, Object>>getSum(Date date);
	public int getByDid(Integer did,Date date,Integer time);
}
