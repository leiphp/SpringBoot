package cn.lxtkj.springboot.mapper;

import cn.lxtkj.springboot.entity.Relationship;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface RelationshipsMapper {
    @Select("SELECT count(*) FROM relationships WHERE cid = #{cid} AND mid=#{mid}")
    Integer count(@Param("cid") Integer cid, @Param("mid") Integer mid);

    @Insert("INSERT INTO relationships(cid, mid) VALUES(#{cid}, #{mid})")
    int insert(Relationship relationship);

    @Select("SELECT * FROM relationships WHERE name = #{name}")
    List<Relationship> selectByExample(Relationship relationship);

    @Delete("DELETE FROM relationships WHERE cid = #{cid}")
    int deleteByExample(Relationship relationship);
}
