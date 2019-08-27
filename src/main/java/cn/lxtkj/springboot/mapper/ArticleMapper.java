package cn.lxtkj.springboot.mapper;

import cn.lxtkj.springboot.entity.Article;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface ArticleMapper {
    @Select("SELECT * FROM ARTICLES WHERE TITLE = #{TITLE}")
    Article findByTitle(@Param("title") String title);

    @Insert("INSERT INTO ARTICLES(title, tags, content, author_id, categories, created, modified) VALUES(#{title}, #{tags}, #{content}, #{author_id}, #{categories}, #{created}, #{modified})")
    int insert(@Param("title") String title, @Param("tags") String tags, @Param("content") String content, @Param("author_id") Integer author_id, @Param("categories") String categories, @Param("created") Integer created, @Param("modified") Integer modified);

    @Select("SELECT * FROM ARTICLES WHERE TYPE = #{type}")
    List<Article> findArticleList(@Param("type") String type);


}
