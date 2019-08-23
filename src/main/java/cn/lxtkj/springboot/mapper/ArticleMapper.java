package cn.lxtkj.springboot.mapper;

import cn.lxtkj.springboot.entity.Article;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface ArticleMapper {
    @Select("SELECT * FROM ARTICLES WHERE TITLE = #{TITLE}")
    Article findByTitle(@Param("title") String title);

    @Insert("INSERT INTO ARTICLE(title, slug, content) VALUES(#{title}, #{slug}, #{content})")
    int insert(@Param("title") String title, @Param("slug") Integer slug, @Param("content") String content);

    @Select("SELECT * FROM ARTICLES ")
    List<Article> findArticleList();


}
