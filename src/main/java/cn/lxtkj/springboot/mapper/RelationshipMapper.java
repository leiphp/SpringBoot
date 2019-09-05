package cn.lxtkj.springboot.mapper;

import cn.lxtkj.springboot.entity.Options;
import cn.lxtkj.springboot.entity.Relationship;
import cn.lxtkj.springboot.entity.RelationshipVo;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface RelationshipMapper {
    @Select("SELECT * FROM OPTIONS WHERE name = #{name}")
    List<Relationship> selectByExample(RelationshipVo relationshipVo);

    @Insert("INSERT INTO OPTIONS(name, value) VALUES(#{name}, #{value})")
    int insert(Relationship relationship);


    @Update("UPDATE OPTIONS SET value=#{value} where name=#{name}")
    int update(@Param("name") String name, @Param("value") String value);

    @Delete("DELETE FROM OPTIONS WHERE cid = #{cid}")
    int deleteByExample(RelationshipVo relationshipVo);

    @Select("SELECT count(*) FROM METAS WHERE type = 'link'")
    Long countByExample(RelationshipVo relationshipVo);
}
