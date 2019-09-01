package cn.lxtkj.springboot.mapper;

import cn.lxtkj.springboot.entity.Options;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface OptionsMapper {
    @Select("SELECT * FROM OPTIONS WHERE name = #{name}")
    Options selectByName(@Param("name") String name);

    @Insert("INSERT INTO OPTIONS(name, value) VALUES(#{name}, #{value})")
    int insert(@Param("name") String name, @Param("value") String value);

    @Select("SELECT * FROM OPTIONS ")
    List<Options> select();

    @Select("SELECT * FROM OPTIONS WHERE cid = #{cid}")
    Options selectByCid(@Param("cid") Integer cid);

    @Update("UPDATE OPTIONS SET value=#{value} where name=#{name}")
    int update(@Param("name") String name, @Param("value") String value );

    @Delete("DELETE FROM OPTIONS WHERE cid = #{cid}")
    int delete(@Param("cid") Integer cid);
}
