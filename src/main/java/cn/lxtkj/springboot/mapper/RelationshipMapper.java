package cn.lxtkj.springboot.mapper;


import cn.lxtkj.springboot.entity.Relationship;
import cn.lxtkj.springboot.entity.RelationshipVo;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface RelationshipMapper {
    @Select("SELECT * FROM OPTIONS WHERE name = #{name}")
    List<Relationship> selectByExample(RelationshipVo relationshipVo);

    @Insert("INSERT INTO relationships(cid, mid) VALUES(#{cid}, #{mid})")
    int insert(Relationship relationship);


    @Update("UPDATE OPTIONS SET value=#{value} where name=#{name}")
    int update(@Param("name") String name, @Param("value") String value);

    @Delete("DELETE FROM OPTIONS WHERE cid = #{cid}")
    int deleteByExample(RelationshipVo relationshipVo);

    @Select("SELECT count(*) FROM RELATIONSHIPS WHERE cid = #{cid} AND mid=#{mid}")
    int countByExample(@Param("cid") Integer cid,@Param("mid") int mid);
}
