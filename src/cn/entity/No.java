package cn.entity;

import java.util.Date;

public class No {
    private Integer id;

    private Date date;

    private Integer time;

    private Integer did;

    private Integer pid;

    private Double price;

    private Integer state;

    private Integer isdel;

    private Person person;

    private Doctor doctor;

    private Date atime;//Appointment time

    public No(Integer id, Date date, Integer time, Integer did, Integer pid, Double price, Integer state, Integer isdel) {
        this.id = id;
        this.date = date;
        this.time = time;
        this.did = did;
        this.pid = pid;
        this.price = price;
        this.state = state;
        this.isdel = isdel;
    }

    public Date getAtime() {
        return atime;
    }

    public void setAtime(Date atime) {
        this.atime = atime;
    }

    public Person getPerson() {
        return person;
    }

    public void setPerson(Person person) {
        this.person = person;
    }

    public Doctor getDoctor() {
        return doctor;
    }

    public void setDoctor(Doctor doctor) {
        this.doctor = doctor;
    }

    public No() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Integer getTime() {
        return time;
    }

    public void setTime(Integer time) {
        this.time = time;
    }

    public Integer getDid() {
        return did;
    }

    public void setDid(Integer did) {
        this.did = did;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public Integer getIsdel() {
        return isdel;
    }

    public void setIsdel(Integer isdel) {
        this.isdel = isdel;
    }


}