package ink.tsg.blog.bean;

import java.sql.Date;

public class Blog {
    private Integer blogId;

    private String blogTitle;

    private String blogSubheading;

    private java.sql.Date blogUptime;

    private Integer blFcId;

    private Integer blScId;

    private String blogArticle;

    public Integer getBlogId() {
        return blogId;
    }

    public void setBlogId(Integer blogId) {
        this.blogId = blogId;
    }

    public String getBlogTitle() {
        return blogTitle;
    }

    public void setBlogTitle(String blogTitle) {
        this.blogTitle = blogTitle == null ? null : blogTitle.trim();
    }

    public String getBlogSubheading() {
        return blogSubheading;
    }

    public void setBlogSubheading(String blogSubheading) {
        this.blogSubheading = blogSubheading == null ? null : blogSubheading.trim();
    }

    public Date getBlogUptime() {
        return blogUptime;
    }

    public void setBlogUptime(Date blogUptime) {
        this.blogUptime = (java.sql.Date) blogUptime;
    }

    public Integer getBlFcId() {
        return blFcId;
    }

    public void setBlFcId(Integer blFcId) {
        this.blFcId = blFcId;
    }

    public Integer getBlScId() {
        return blScId;
    }

    public void setBlScId(Integer blScId) {
        this.blScId = blScId;
    }

    public String getBlogArticle() {
        return blogArticle;
    }

    public void setBlogArticle(String blogArticle) {
        this.blogArticle = blogArticle == null ? null : blogArticle.trim();
    }

	@Override
	public String toString() {
		return "Blog [blogId=" + blogId + ", blogTitle=" + blogTitle + ", blogSubheading=" + blogSubheading
				+ ", blogUptime=" + blogUptime + ", blFcId=" + blFcId + ", blScId=" + blScId + ", blogArticle="
				+ blogArticle + "]";
	}
}