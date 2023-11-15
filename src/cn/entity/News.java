package cn.entity;

import java.util.Date;

public class News {
    private Integer id;

    private String pic;

    private String title;

    private String content;

    private Integer type;

    private Date time;

    public News(Integer id, String pic, String title, String content, Integer type, Date time) {
        this.id = id;
        this.pic = pic;
        this.title = title;
        this.content = content;
        this.type = type;
        this.time = time;
    }

    public News() {
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

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }
}