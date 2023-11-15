package cn.service;

import cn.entity.Doctor;
import com.github.pagehelper.PageInfo;

import java.util.List;
import java.util.Map;

public interface DoctorService {
	public int add(Doctor doctor);
	public int del(Integer id);
	public int update(Doctor doctor);
	public PageInfo<Doctor> getByMap(Map<String,Object> params);
	public Doctor getById(Integer id);
	public Doctor login(String username,String password);
	public Doctor check(String username);


}
