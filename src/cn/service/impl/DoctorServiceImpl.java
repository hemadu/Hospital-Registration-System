package cn.service.impl;

import cn.dao.DoctorMapper;
import cn.entity.Doctor;
import cn.service.DoctorService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.print.Doc;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
@Service
public class DoctorServiceImpl implements DoctorService {

    @Autowired
    private DoctorMapper doctorMapper;

    public DoctorMapper getDoctorMapper() {
        return doctorMapper;
    }

    public void setDoctorMapper(DoctorMapper doctorMapper) {
        this.doctorMapper = doctorMapper;
    }

    @Override
    public int add(Doctor doctor) {
        return doctorMapper.insert(doctor);
    }

    @Override
    public int del(Integer id) {
        return doctorMapper.delete(id);
    }

    @Override
    public int update(Doctor doctor) {
        return doctorMapper.updateByPrimaryKeySelective(doctor);
    }

    @Override
    public PageInfo<Doctor> getByMap(Map<String,Object> params) {
        //创建一个分页工具类
        PageHelper.startPage((Integer)params.get("currentPageNo"),(Integer)params.get("pageSize"));
        List<Doctor> doctorList=null;
        doctorList=doctorMapper.selectAll(params);
        return new PageInfo<Doctor>(doctorList);
    }

    @Override
    public Doctor getById(Integer id) {
        return doctorMapper.selectByPrimaryKey(id);
    }

    @Override
    public Doctor login(String username, String password) {
        Doctor doctor=doctorMapper.check(username);
        if(doctor!=null){
            if(doctor.getPassword().equals(password)){
                return doctor;
            }
        }
        return null;
    }

    @Override
    public Doctor check(String username) {
        return doctorMapper.check(username);
    }
}
