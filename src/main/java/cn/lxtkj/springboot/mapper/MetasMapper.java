package cn.lxtkj.springboot.mapper;

import cn.lxtkj.springboot.entity.Article;
import cn.lxtkj.springboot.entity.Metas;
import org.apache.ibatis.annotations.*;

import java.util.List;
import java.util.Map;

public interface MetasMapper {
    @Select("SELECT * FROM ARTICLES WHERE TITLE = #{TITLE}")
    Article findByTitle(@Param("title") String title);

    @Insert("INSERT INTO ARTICLES(title, slug, tags, content, author_id, type, categories, created, modified) VALUES(#{title}, #{slug}, #{tags}, #{content}, #{author_id}, #{type}, #{categories}, #{created}, #{modified})")
    int insert(@Param("title") String title, @Param("slug") String slug, @Param("tags") String tags, @Param("content") String content, @Param("author_id") Integer author_id, @Param("type") String type, @Param("categories") String categories, @Param("created") Integer created, @Param("modified") Integer modified);

    @Select("SELECT * FROM ARTICLES WHERE TYPE = #{type} ORDER BY ${sort}")
    List<Article> findArticleList(@Param("type") String type, @Param("sort") String sort);

    @Select("SELECT * FROM ARTICLES WHERE cid = #{cid}")
    Article selectByCid(@Param("cid") Integer cid);

    @Update("UPDATE ARTICLES SET title=#{title},tags=#{tags},content=#{content}, categories=#{categories},modified=#{modified} where cid=#{cid}")
    int update(@Param("cid") Integer cid, @Param("title") String title, @Param("tags") String tags, @Param("content") String content, @Param("categories") String categories, @Param("modified") Integer modified);

    @Delete("DELETE FROM ARTICLES WHERE cid = #{cid}")
    int delete(@Param("cid") Integer cid);
    
    @Select("select a.*, count(b.cid) as count from t_metas a left join `t_relationships` b on a.mid = b.mid where a.type = #{type} group by a.mid order by #{order} limit #{limit}")
    List<Metas> selectByParm(Map<String,Object> paraMap);
}
