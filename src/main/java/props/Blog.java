package props;

import java.util.Date;

public class Blog {
    private int bid;
    private String title;
    private String detail;
    private Date date;

    public Blog() {
    }

    public Blog(int bid, String title, String detail, Date date) {
        this.bid = bid;
        this.title=title;
        this.detail=detail;
        this.date=date;
    }

    public int getBid() {
        return bid;
    }

    public void setBid(int bid) {
        this.bid = bid;
    }

    public String getTitle() {
        return title;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}
