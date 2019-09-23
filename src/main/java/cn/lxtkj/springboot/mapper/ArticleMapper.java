package cn.lxtkj.springboot.mapper;

import cn.lxtkj.springboot.entity.Article;
import cn.lxtkj.springboot.entity.ContentVo;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface ArticleMapper {
    @Select("SELECT * FROM ARTICLES WHERE TITLE = #{TITLE}")
    Article findByTitle(@Param("title") String title);

    @Insert("INSERT INTO ARTICLES(title, slug, tags, description, content, author_id, type, categories, created, modified) VALUES(#{title}, #{slug}, #{tags}, #{description}, #{content}, #{author_id}, #{type}, #{categories}, #{created}, #{modified})")
    int insert(@Param("title") String title, @Param("slug") String slug, @Param("tags") String tags, @Param("description") String description, @Param("content") String content, @Param("author_id") Integer author_id, @Param("type") String type, @Param("categories") String categories, @Param("created") Integer created, @Param("modified") Integer modified);

    @Select("SELECT * FROM ARTICLES WHERE TYPE = #{type} ORDER BY ${sort}")
    List<Article> findArticleList(@Param("type") String type, @Param("sort") String sort);

    @Select("SELECT * FROM ARTICLES ")
    List<Article> getList();

    @Select("SELECT a.*,count(c.coid)as count FROM ARTICLES as a LEFT JOIN comments as c on c.cid=a.cid WHERE a.type='post' GROUP BY a.cid ORDER BY a.created desc LIMIT  #{limit} ")
    List<Article> getRecentList(@Param("limit") Integer limit);

    @Select("SELECT * FROM ARTICLES WHERE cid = #{cid}")
    Article selectByCid(@Param("cid") Integer cid);

    @Select("SELECT * FROM ARTICLES WHERE cid > #{cid} AND type='post' limit 1")
    Article selectNextByCid(@Param("cid") Integer cid);

    @Select("SELECT * FROM ARTICLES WHERE cid < #{cid} AND type='post' limit 1")
    Article selectPrevByCid(@Param("cid") Integer cid);

    @Select("SELECT * FROM ARTICLES WHERE type='post' ORDER BY rand() limit 6")
    List<Article> selectLike();

    @Update("UPDATE ARTICLES SET title=#{title},tags=#{tags},description=#{description},content=#{content}, categories=#{categories},modified=#{modified} where cid=#{cid}")
    int update(@Param("cid") Integer cid, @Param("title") String title, @Param("tags") String tags,@Param("description") String description, @Param("content") String content,  @Param("categories") String categories,  @Param("modified") Integer modified);

    @Delete("DELETE FROM ARTICLES WHERE cid = #{cid}")
    int delete(@Param("cid") Integer cid);

    @Select("SELECT count(*) FROM ARTICLES WHERE status = 'publish' AND type = 'post'")
    Long countByExample(ContentVo contentVo);
}
