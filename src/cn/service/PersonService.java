package cn.service;

import cn.entity.Person;
import com.github.pagehelper.PageInfo;

import java.util.List;
import java.util.Map;

public interface PersonService {
	public int add(Person person);
	public int del(Integer id);
	public int update(Person person);
	public Person getById(Integer id);
	public Person login(String username,String password);
	public Person check(String username);
	public PageInfo<Person> getByMap(Map<String,Object> params);
}
