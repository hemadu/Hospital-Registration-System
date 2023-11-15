package cn.service.impl;

import cn.dao.PersonMapper;
import cn.entity.Doctor;
import cn.entity.Person;
import cn.service.PersonService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class PersonServiceImpl implements PersonService {

    @Autowired
    private PersonMapper personMapper;

    public PersonMapper getPersonMapper() {
        return personMapper;
    }

    public void setPersonMapper(PersonMapper personMapper) {
        this.personMapper = personMapper;
    }

    @Override
    public int add(Person person) {
        return personMapper.insert(person);
    }

    @Override
    public int del(Integer id) {
        return personMapper.delete(id);
    }

    @Override
    public int update(Person person) {
        return personMapper.updateByPrimaryKeySelective(person);
    }

    @Override
    public Person getById(Integer id) {
        return personMapper.selectByPrimaryKey(id);
    }

    public Person login(String username, String password) {
        Person person=personMapper.check(username);
        if(person!=null){
            if(person.getPassword().equals(password)){
                return person;
            }
        }
            return null;
    }

    @Override
    public Person check(String username) {
        return personMapper.check(username);
    }

    @Override
    public PageInfo<Person> getByMap(Map<String,Object> params) {
        //创建一个分页工具类
        PageHelper.startPage((Integer)params.get("currentPageNo"),(Integer)params.get("pageSize"));
        List<Person> personList=null;
        personList=personMapper.selectAll(params);
        return new PageInfo<Person>(personList);
    }
}
