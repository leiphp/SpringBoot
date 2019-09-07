package cn.lxtkj.springboot.service;

import org.apache.log4j.Logger;
import cn.lxtkj.springboot.mapper.RelationshipMapper;
import cn.lxtkj.springboot.entity.RelationshipVo;
import cn.lxtkj.springboot.entity.Relationship;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class RelationshipService {
    private static Logger log = Logger.getLogger(RelationshipService.class);

    @Resource
    private RelationshipMapper relationshipMapper;


    public void deleteById(Integer cid, Integer mid) {
        RelationshipVo relationshipVo = new RelationshipVo();
        RelationshipVo.Criteria criteria = relationshipVo.createCriteria();
        if (cid != null) {
            criteria.andCidEqualTo(cid);
        }
        if (mid != null) {
            criteria.andMidEqualTo(mid);
        }
        relationshipMapper.deleteByExample(relationshipVo);
    }


    public List<Relationship> getRelationshipById(Integer cid, Integer mid) {
        RelationshipVo relationshipVo = new RelationshipVo();
        RelationshipVo.Criteria criteria = relationshipVo.createCriteria();
        if (cid != null) {
            criteria.andCidEqualTo(cid);
        }
        if (mid != null) {
            criteria.andMidEqualTo(mid);
        }
        return relationshipMapper.selectByExample(relationshipVo);
    }

    public void insertVo(Relationship relationship) {
        relationshipMapper.insert(relationship);
    }


    public int countById(Integer cid, int mid) {
        log.debug("Enter countById method:cid={},mid={}"+cid+mid);
        int num = relationshipMapper.countByExample(cid, mid);
        log.debug("Exit countById method return num={}"+num);
        return num;
    }
}
