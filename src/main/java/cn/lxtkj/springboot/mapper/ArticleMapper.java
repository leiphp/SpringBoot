package cn.lxtkj.springboot.mapper;

import cn.lxtkj.springboot.entity.Article;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface ArticleMapper {
    @Select("SELECT * FROM ARTICLES WHERE TITLE = #{TITLE}")
    Article findByTitle(@Param("title") String title);

    @Insert("INSERT INTO ARTICLES(title, tags, content, author_id, categories, created, modified) VALUES(#{title}, #{tags}, #{content}, #{author_id}, #{categories}, #{created}, #{modified})")
    int insert(@Param("title") String title, @Param("tags") String tags, @Param("content") String content, @Param("author_id") Integer author_id, @Param("categories") String categories, @Param("created") Integer created, @Param("modified") Integer modified);

    @Select("SELECT * FROM ARTICLES WHERE TYPE = #{type} ORDER BY ${sort}")
    List<Article> findArticleList(@Param("type") String type, @Param("sort") String sort);

    @Select("SELECT * FROM ARTICLES WHERE cid = #{cid}")
    Article selectByCid(@Param("cid") Integer cid);

    @Update("UPDATE ARTICLES SET title=#{title},tags=#{tags},content=#{content}, categories=#{categories},modified=#{modified} where cid=#{cid}")
    int update(@Param("cid") Integer cid, @Param("title") String title, @Param("tags") String tags, @Param("content") String content,  @Param("categories") String categories,  @Param("modified") Integer modified);
}
