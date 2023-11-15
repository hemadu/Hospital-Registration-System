package cn.entity;

public class Sector {
    private Integer id;

    private String name;

    private Integer isdel;

    public Sector(Integer id, String name, Integer isdel) {
        this.id = id;
        this.name = name;
        this.isdel = isdel;
    }

    public Sector() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Integer getIsdel() {
        return isdel;
    }

    public void setIsdel(Integer isdel) {
        this.isdel = isdel;
    }
}