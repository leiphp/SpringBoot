package cn.lxtkj.springboot.mapper;

import cn.lxtkj.springboot.entity.User;
import cn.lxtkj.springboot.entity.UserVoExample;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface UserMapper {
    @Select("SELECT * FROM USERS WHERE NAME = #{NAME}")
    User findByName(@Param("name")String name);

    @Insert("INSERT INTO USERS(name, age) VALUES(#{name}, #{age})")
    int insert(@Param("name")String name, @Param("age")Integer age);

    @Select("SELECT * FROM USERS ")
    List<User> findUserList();

    /**
     * 获得密码
     * @param username 用户名
     */
    @Select("SELECT password FROM USERS WHERE username = #{username}")
    String getPassword(String username);

    /**
     * 获得角色权限
     * @param username 用户名
     * @return user/admin
     */
    @Select("SELECT role FROM USERS WHERE username = #{username}")
    String getRole(String username);

    @Select("SELECT * FROM USERS WHERE id = #{id}")
    User selectById(@Param("id") Integer id);

    @Select("SELECT count(*) FROM USERS ")
    long countByExample(UserVoExample userVoExample);

    @Select("SELECT * FROM USERS WHERE username =  #{username}")
    List<User> selectByExample(@Param("username")String username);
}
