package cn.lxtkj.springboot.mapper;

import cn.lxtkj.springboot.entity.Article;
import cn.lxtkj.springboot.entity.Metas;
import org.apache.ibatis.annotations.*;

import java.util.List;
import java.util.Map;

public interface MetasMapper {
    @Select("SELECT * FROM ARTICLES WHERE TITLE = #{TITLE}")
    Article findByTitle(@Param("title") String title);

    @Insert("INSERT INTO METAS(type, name) VALUES(#{type}, #{name})")
    int insert(@Param("type") String type, @Param("name") String name);

    @Select("SELECT * FROM ARTICLES WHERE TYPE = #{type} ORDER BY ${sort}")
    List<Article> findArticleList(@Param("type") String type, @Param("sort") String sort);

    @Select("SELECT * FROM ARTICLES WHERE cid = #{cid}")
    Article selectByCid(@Param("cid") Integer cid);

    @Update("UPDATE ARTICLES SET name=#{name},type=#{type} where mid=#{mid}")
    int update(@Param("type") String type, @Param("name") String name, @Param("mid") Integer mid);

    @Delete("DELETE FROM ARTICLES WHERE cid = #{cid}")
    int delete(@Param("cid") Integer cid);
    
    @Select("select a.*, count(b.cid) as count from metas a left join `t_relationships` b on a.mid = b.mid where a.type = #{type} group by a.mid order by #{order} limit #{limit}")
    List<Metas> selectByParm(Map<String,Object> paraMap);
}
