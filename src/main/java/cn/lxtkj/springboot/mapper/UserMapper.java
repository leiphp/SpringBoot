package cn.lxtkj.springboot.mapper;

import cn.lxtkj.springboot.entity.User;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

public interface UserMapper {
    @Select("SELECT * FROM USERS WHERE NAME = #{NAME}")
    User findByName(@Param("name")String name);

    @Insert("INSERT INTO USERS(name, age) VALUES(#{name}, #{age})")
    int insert(@Param("name")String name, @Param("age")Integer age);
}
