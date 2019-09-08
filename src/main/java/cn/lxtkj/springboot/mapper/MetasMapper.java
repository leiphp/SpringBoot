package cn.lxtkj.springboot.mapper;

import cn.lxtkj.springboot.entity.Article;
import cn.lxtkj.springboot.entity.Metas;
import cn.lxtkj.springboot.entity.MetasVo;
import org.apache.ibatis.annotations.*;

import java.util.List;
import java.util.Map;

public interface MetasMapper {

    @Insert("INSERT INTO METAS(type, name) VALUES(#{type}, #{name})")
    int insert(@Param("type") String type, @Param("name") String name);

    @Insert("INSERT INTO METAS(type, name, slug, sort) VALUES(#{type}, #{name}, #{slug}, #{sort})")
    int insertLink(@Param("type") String type, @Param("name") String name, @Param("slug") String slug, @Param("sort") Integer sort);

    @Select("SELECT * FROM METAS WHERE TYPE = #{type} ORDER BY ${sort}")
    List<Article> findArticleList(@Param("type") String type, @Param("sort") String sort);

    @Select("SELECT * FROM METAS WHERE cid = #{cid}")
    Article selectByCid(@Param("cid") Integer cid);

    @Update("UPDATE METAS SET name=#{name},type=#{type} where mid=#{mid}")
    int update(@Param("type") String type, @Param("name") String name, @Param("mid") Integer mid);

    @Update("UPDATE METAS SET name=#{name},type=#{type},slug=#{slug},sort=#{sort} where mid=#{mid}")
    int updateLink(@Param("type") String type, @Param("name") String name,  @Param("slug") String slug, @Param("sort") Integer sort, @Param("mid") Integer mid);

    @Delete("DELETE FROM METAS WHERE mid = #{mid}")
    int delete(@Param("mid") Integer mid);
    
    @Select("select a.*, count(b.cid) as count from metas a left join `relationships` b on a.mid = b.mid where a.type = #{type} group by a.mid order by #{order} limit #{limit}")
    List<Metas> selectByParm(Map<String,Object> paraMap);

    @Select("select * from metas   where type = #{type} group by mid order by #{order}")
    List<Metas> selectMetas(Map<String,Object> paraMap);

    @Select("SELECT count(*) FROM METAS WHERE type = 'link'")
    Long countByExample(MetasVo metasVo);

    //根据条件获取mid
    @Select("select mid FROM METAS WHERE type = #{type} AND name = #{name}")
    int selectMidByWhere(@Param("name") String name, @Param("type") String type);

    //下面要调试
    @Select("select count(*) FROM METAS WHERE type = #{type} AND name = #{name}")
    int selectByExample(@Param("name") String name, @Param("type") String type);

    @Insert("INSERT INTO METAS(type, name, slug) VALUES(#{type}, #{name}, #{slug})")
    @Options(useGeneratedKeys=true,keyProperty="mid",  keyColumn="id")
    int insertSelective(Metas metas);
}
