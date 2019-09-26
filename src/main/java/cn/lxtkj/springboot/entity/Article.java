package cn.lxtkj.springboot.entity;

public class Article {

    private Integer cid;
    private String title;
    private String slug;
    private Integer created;
    private Integer modified;
    private String description;
    private String content;
    private String status;
    private String categories;
    private String tags;
    private Integer hits;
    private Integer comments_num;
    /**
     * 是否允许评论
     */
    private Boolean allow_comment;

    public Integer getComments_num() {
        return comments_num;
    }

    public void setComments_num(Integer comments_num) {
        this.comments_num = comments_num;
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSlug() {
        return slug;
    }

    public void setSlug(String slug) {
        this.slug = slug;
    }

    public Integer getCreated() {
        return created;
    }

    public void setCreated(Integer created) {
        this.created = created;
    }

    public Integer getModified() {
        return modified;
    }

    public void setModified(Integer modified) {
        this.modified = modified;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getTags() {
        return tags;
    }

    public void setTags(String tags) {
        this.tags = tags;
    }

    public String getCategories() {
        return categories;
    }

    public void setCategories(String categories) {
        this.categories = categories;
    }

    public Integer getHits() {
        return hits;
    }

    public void setHits(Integer hits) {
        this.hits = hits;
    }

    public Boolean getAllow_comment() {
        return allow_comment;
    }

    public void setAllow_comment(Boolean allow_comment) {
        this.allow_comment = allow_comment;
    }
}
