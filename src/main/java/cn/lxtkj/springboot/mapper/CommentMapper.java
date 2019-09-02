package cn.lxtkj.springboot.mapper;

import cn.lxtkj.springboot.entity.Comment;
import cn.lxtkj.springboot.entity.CommentVo;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface CommentMapper {

    @Insert("INSERT INTO COMMENTS(title, slug, tags, content, author_id, type, categories, created, modified) VALUES(#{title}, #{slug}, #{tags}, #{content}, #{author_id}, #{type}, #{categories}, #{created}, #{modified})")
    int insert(@Param("title") String title, @Param("slug") String slug, @Param("tags") String tags, @Param("content") String content, @Param("author_id") Integer author_id, @Param("type") String type, @Param("categories") String categories, @Param("created") Integer created, @Param("modified") Integer modified);

    @Select("SELECT * FROM COMMENTS WHERE TYPE = #{type} ORDER BY ${sort}")
    List<Comment> list(@Param("type") String type, @Param("sort") String sort);

    @Select("SELECT * FROM COMMENTS ")
    List<Comment> getList();

    @Select("SELECT * FROM COMMENTS WHERE coid = #{coid}")
    Comment selectByCoid(@Param("coid") Integer coid);

    @Update("UPDATE COMMENTS SET status=#{status} where coid=#{coid}")
    int update(@Param("coid") Integer coid, @Param("status") String status);

    @Delete("DELETE FROM COMMENTS WHERE coid = #{coid}")
    int delete(@Param("coid") Integer coid);

    @Select("SELECT count(*) FROM COMMENTS ")
    Long countByExample(CommentVo commentVo);
}
