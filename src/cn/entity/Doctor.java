package cn.entity;

public class Doctor {
    private Integer id;

    private String pic;

    private String username;

    private String password;

    private Integer sid;

    private Integer type;

    private Integer num;

    private String sex;

    private String name;

    private Integer age;

    private String phone;

    private Integer isdel;

    private Sector sector;

    public Doctor(Integer id, String pic, String username, String password, Integer sid, Integer type, Integer num, String sex, String name, Integer age, String phone, Integer isdel) {
        this.id = id;
        this.pic = pic;
        this.username = username;
        this.password = password;
        this.sid = sid;
        this.type = type;
        this.num = num;
        this.sex = sex;
        this.name = name;
        this.age = age;
        this.phone = phone;
        this.isdel = isdel;
    }

    public Sector getSector() {
        return sector;
    }

    public void setSector(Sector sector) {
        this.sector = sector;
    }

    public Doctor() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic == null ? null : pic.trim();
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public Integer getSid() {
        return sid;
    }

    public void setSid(Integer sid) {
        this.sid = sid;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex == null ? null : sex.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public Integer getIsdel() {
        return isdel;
    }

    public void setIsdel(Integer isdel) {
        this.isdel = isdel;
    }
}