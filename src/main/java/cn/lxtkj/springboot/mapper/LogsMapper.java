package cn.lxtkj.springboot.mapper;

import cn.lxtkj.springboot.entity.Logs;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface LogsMapper {
    @Select("SELECT * FROM LOGS WHERE name = #{name}")
    Options selectByName(@Param("name") String name);

    @Insert("INSERT INTO LOGS(action, data, author_id, ip, created) VALUES(#{action}, #{data}, #{author_id}, #{ip}, #{created})")
    int insert(@Param("action") String action, @Param("data") String data, @Param("author_id") Integer author_id, @Param("ip") String ip, @Param("created") Integer created);

    @Select("SELECT * FROM LOGS  ORDER BY ${sort}")
    List<Logs> getList(@Param("sort") String sort);

    @Select("SELECT * FROM LOGS WHERE cid = #{cid}")
    Options selectByCid(@Param("cid") Integer cid);

    @Update("UPDATE LOGS SET value=#{value},description=#{description} where name=#{name}")
    int update(@Param("name") String name, @Param("value") String value, @Param("description") String description);

    @Delete("DELETE FROM LOGS WHERE cid = #{cid}")
    int delete(@Param("cid") Integer cid);
}
