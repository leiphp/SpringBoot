package cn.lxtkj.springboot.mapper;

import cn.lxtkj.springboot.entity.Attach;
import cn.lxtkj.springboot.entity.AttachVo;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface AttachMapper {
    @Select("SELECT * FROM ATTACH WHERE TITLE = #{TITLE}")
    Attach findByTitle(@Param("title") String title);

    @Insert("INSERT INTO ATTACH(fname, ftype, fkey, author_id, created) VALUES(#{fname}, #{ftype}, #{fkey}, #{author_id}, #{created})")
    int insert(@Param("fname") String fname, @Param("ftype") String ftype, @Param("fkey") String fkey, @Param("author_id") Integer author_id, @Param("created") Integer created);

    @Select("SELECT * FROM ATTACH  ORDER BY ${sort}")
    List<Attach> list(@Param("sort") String sort);

    @Select("SELECT * FROM ATTACH WHERE cid = #{cid}")
    Attach selectByCid(@Param("cid") Integer cid);

    @Update("UPDATE ATTACH SET title=#{title},tags=#{tags},content=#{content}, categories=#{categories},modified=#{modified} where cid=#{cid}")
    int update(@Param("cid") Integer cid, @Param("title") String title, @Param("tags") String tags, @Param("content") String content, @Param("categories") String categories, @Param("modified") Integer modified);

    @Delete("DELETE FROM ATTACH WHERE cid = #{cid}")
    int delete(@Param("cid") Integer cid);

    @Select("SELECT count(*) FROM ATTACH ")
    Long countByExample(AttachVo attachVo);
}
