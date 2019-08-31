package cn.lxtkj.springboot.mapper;

import cn.lxtkj.springboot.entity.Options;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface OptionsMapper {
    @Select("SELECT * FROM OPTIONS WHERE name = #{name}")
    Options selectByName(@Param("name") String name);

    @Insert("INSERT INTO OPTIONS(name, value, description) VALUES(#{name}, #{value}, #{description})")
    int insert(@Param("name") String name, @Param("value") String value, @Param("description") String description );

    @Select("SELECT * FROM OPTIONS ")
    List<Options> select();

    @Select("SELECT * FROM ARTICLES WHERE cid = #{cid}")
    Options selectByCid(@Param("cid") Integer cid);

    @Update("UPDATE ARTICLES SET value=#{value},description=#{description} where name=#{name}")
    int update(@Param("name") String name, @Param("value") String value, @Param("description") String description );

    @Delete("DELETE FROM ARTICLES WHERE cid = #{cid}")
    int delete(@Param("cid") Integer cid);
}
