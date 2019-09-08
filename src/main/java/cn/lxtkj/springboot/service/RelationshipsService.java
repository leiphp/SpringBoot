package cn.lxtkj.springboot.service;

import cn.lxtkj.springboot.entity.Relationship;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import cn.lxtkj.springboot.mapper.RelationshipsMapper;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RelationshipsService {
    private static Logger log = Logger.getLogger(MetasService.class);

    @Autowired
    private RelationshipsMapper relationshipsMapper;

    public List<Relationship> getRelationshipById(Integer cid, Integer mid) {
        Relationship relationship = new Relationship();
        return relationshipsMapper.selectByExample(relationship);
    }


    public Integer countById(Integer cid, Integer mid) {
        log.debug("Enter countById method:cid={},mid={}"+cid+mid);
        Integer num =relationshipsMapper.count(cid, mid);
        log.debug("Exit countById method return num={}"+num);
        return num;
    }
    public void insertVo(Relationship relationship) {
        relationshipsMapper.insert(relationship);
    }

    public void deleteById(Integer cid, Integer mid) {
        Relationship relationship = new Relationship();
        relationshipsMapper.deleteByExample(relationship);
    }
}
