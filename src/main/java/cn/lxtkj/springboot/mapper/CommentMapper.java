package cn.lxtkj.springboot.mapper;

import cn.lxtkj.springboot.entity.Comment;
import cn.lxtkj.springboot.entity.CommentVo;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface CommentMapper {

    @Insert("INSERT INTO comments(cid, created, author, mail, url, ip, content, parent) VALUES(#{cid}, #{created}, #{author}, #{mail}, #{url}, #{ip}, #{content}, #{parent})")
    int insert(@Param("cid") Integer cid, @Param("created") Integer created, @Param("author") String author, @Param("mail") String mail, @Param("url") String url, @Param("ip") String ip, @Param("content") String content, @Param("parent") Integer parent);

    @Select("SELECT * FROM comments WHERE TYPE = #{type} ORDER BY ${sort}")
    List<Comment> list(@Param("type") String type, @Param("sort") String sort);

    @Select("SELECT * FROM comments ")
    List<Comment> getList();

    @Select("SELECT * FROM comments WHERE coid = #{coid}")
    Comment selectByCoid(@Param("coid") Integer coid);

    @Select("SELECT * FROM comments WHERE cid = #{cid} AND status = 'approved'")
    List<Comment> selectByCid(@Param("cid") Integer cid);

    @Update("UPDATE comments SET status=#{status} where coid=#{coid}")
    int update(@Param("coid") Integer coid, @Param("status") String status);

    @Delete("DELETE FROM comments WHERE coid = #{coid}")
    int delete(@Param("coid") Integer coid);

    @Select("SELECT count(*) FROM comments ")
    Long countByExample(CommentVo commentVo);
}
