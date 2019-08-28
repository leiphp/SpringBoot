package cn.lxtkj.springboot.mapper;

import cn.lxtkj.springboot.entity.Comment;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface CommentMapper {
    @Select("SELECT * FROM COMMENTS WHERE TITLE = #{TITLE}")
    Comment findByTitle(@Param("title") String title);

    @Insert("INSERT INTO COMMENTS(title, slug, tags, content, author_id, type, categories, created, modified) VALUES(#{title}, #{slug}, #{tags}, #{content}, #{author_id}, #{type}, #{categories}, #{created}, #{modified})")
    int insert(@Param("title") String title, @Param("slug") String slug, @Param("tags") String tags, @Param("content") String content, @Param("author_id") Integer author_id, @Param("type") String type, @Param("categories") String categories, @Param("created") Integer created, @Param("modified") Integer modified);

    @Select("SELECT * FROM COMMENTS WHERE TYPE = #{type} ORDER BY ${sort}")
    List<Comment> list(@Param("type") String type, @Param("sort") String sort);

    @Select("SELECT * FROM COMMENTS WHERE cid = #{cid}")
    Comment selectByCid(@Param("cid") Integer cid);

    @Update("UPDATE COMMENTS SET title=#{title},tags=#{tags},content=#{content}, categories=#{categories},modified=#{modified} where cid=#{cid}")
    int update(@Param("cid") Integer cid, @Param("title") String title, @Param("tags") String tags, @Param("content") String content, @Param("categories") String categories, @Param("modified") Integer modified);

    @Delete("DELETE FROM COMMENTS WHERE cid = #{cid}")
    int delete(@Param("cid") Integer cid);
}
