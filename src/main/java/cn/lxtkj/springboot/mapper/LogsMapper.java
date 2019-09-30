package cn.lxtkj.springboot.mapper;

import cn.lxtkj.springboot.entity.Logs;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface LogsMapper {
    @Select("SELECT * FROM logs WHERE name = #{name}")
    Options selectByName(@Param("name") String name);

    @Insert("INSERT INTO logs(action, data, author_id, ip, created) VALUES(#{action}, #{data}, #{author_id}, #{ip}, #{created})")
    int insert(@Param("action") String action, @Param("data") String data, @Param("author_id") Integer author_id, @Param("ip") String ip, @Param("created") Integer created);

    @Select("SELECT * FROM logs  ORDER BY ${sort}")
    List<Logs> getList(@Param("sort") String sort);

    @Select("SELECT * FROM logs WHERE cid = #{cid}")
    Options selectByCid(@Param("cid") Integer cid);

    @Update("UPDATE logs SET value=#{value},description=#{description} where name=#{name}")
    int update(@Param("name") String name, @Param("value") String value, @Param("description") String description);

    @Delete("DELETE FROM logs WHERE cid = #{cid}")
    int delete(@Param("cid") Integer cid);
}
