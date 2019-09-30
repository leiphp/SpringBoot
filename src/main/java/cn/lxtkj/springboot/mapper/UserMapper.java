package cn.lxtkj.springboot.mapper;

import cn.lxtkj.springboot.entity.User;
import cn.lxtkj.springboot.entity.UserVoExample;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface UserMapper {
    @Select("SELECT * FROM users WHERE NAME = #{NAME}")
    User findByName(@Param("name")String name);

    @Insert("INSERT INTO users(name, age) VALUES(#{name}, #{age})")
    int insert(@Param("name")String name, @Param("age")Integer age);

    @Select("SELECT * FROM users ")
    List<User> findUserList();

    /**
     * 获得密码
     * @param username 用户名
     */
    @Select("SELECT password FROM users WHERE username = #{username}")
    String getPassword(String username);

    /**
     * 获得角色权限
     * @param username 用户名
     * @return user/admin
     */
    @Select("SELECT role FROM users WHERE username = #{username}")
    String getRole(String username);

    @Select("SELECT * FROM users WHERE id = #{id}")
    User selectById(@Param("id") Integer id);

    @Select("SELECT count(*) FROM users ")
    long countByExample(UserVoExample userVoExample);

    @Select("SELECT * FROM users WHERE username =  #{username}")
    List<User> selectByExample(@Param("username")String username);

    @Update("UPDATE users SET name=#{name},email=#{email} where id=#{id}")
    int update(User user);

    @Update("UPDATE users SET password=#{password} where id=#{id}")
    int updatePassword(User user);
}
