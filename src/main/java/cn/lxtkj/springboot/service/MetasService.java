package cn.lxtkj.springboot.service;

import cn.lxtkj.springboot.constant.WebConst;
import cn.lxtkj.springboot.entity.Article;
import cn.lxtkj.springboot.entity.Metas;
import cn.lxtkj.springboot.entity.MetasVo;
import org.apache.log4j.Logger;
import cn.lxtkj.springboot.entity.Relationship;
import cn.lxtkj.springboot.mapper.MetasMapper;
import cn.lxtkj.springboot.service.RelationshipService;
import cn.lxtkj.springboot.model.Vo.ContentVo;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.commons.lang3.StringUtils;
import cn.lxtkj.springboot.exception.TipException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class MetasService {
    private static Logger log = Logger.getLogger(MetasService.class);

    @Autowired
    private MetasMapper metasMapper;

    public List<Metas> getMetaList(String type, String orderby, int limit) {
        if (StringUtils.isNotBlank(type)) {
            if (StringUtils.isBlank(orderby)) {
                orderby = "count desc, a.mid desc";
            }
            if (limit < 1 || limit > WebConst.MAX_POSTS) {
                limit = 10;
            }
            Map<String, Object> paraMap = new HashMap<>();
            paraMap.put("type", type);
            paraMap.put("order", orderby);
            paraMap.put("limit", limit);
            return metasMapper.selectByParm(paraMap);
        }
        return null;
    }


    public List<Metas> getMetas(String type) {
        if (StringUtils.isNotBlank(type)) {
            String orderby = "count desc, a.mid desc";
            Map<String, Object> paraMap = new HashMap<>();
            paraMap.put("type", type);
            paraMap.put("order", orderby);
            return metasMapper.selectMetas(paraMap);
        }
        return null;
    }
    
    public String saveMeta(String type, String cname, Integer  mid){
        int insertArticleResult;
        if(mid>0){
             insertArticleResult = metasMapper.update(type, cname, mid);
        }else{
             insertArticleResult = metasMapper.insert(type, cname);
        }
        if(insertArticleResult==1){
            return WebConst.SUCCESS_RESULT;
        }else{
            return WebConst.FAILURE_RESULT;
        }
    }

    public String saveLink(String type, String cname,String slug, Integer sort, Integer mid){
        int insertArticleResult;
        if(mid>0){
            insertArticleResult = metasMapper.updateLink(type, cname, slug, sort, mid);
        }else{
            insertArticleResult = metasMapper.insertLink(type, cname, slug, sort);
        }
        if(insertArticleResult==1){
            return WebConst.SUCCESS_RESULT;
        }else{
            return WebConst.FAILURE_RESULT;
        }
    }

    public Article getArticle(Integer cid){
        Article article = metasMapper.selectByCid(cid);
       return article;

    }

    public String deleteMeta(Integer mid){
        int deleteArticleResult = metasMapper.delete(mid);
        if(deleteArticleResult==1){
            return WebConst.SUCCESS_RESULT;
        }else{
            return WebConst.FAILURE_RESULT;
        }

    }


    @Transactional
    public void saveMetas(Integer cid, String names, String type) {
        if (null == cid) {
            throw new TipException("项目关联id不能为空");
        }
        if (StringUtils.isNotBlank(names) && StringUtils.isNotBlank(type)) {
            String[] nameArr = StringUtils.split(names, ",");
            log.info("nameArr是："+nameArr);
            for (String name : nameArr) {
                this.saveOrUpdate(cid, name, type);
            }
        }
    }

    private void saveOrUpdate(Integer cid, String name, String type) {

        Metas metas = new Metas();
        int num = metasMapper.selectByExample(name,type);
        int mid;
        if (num == 1) {
            mid = metasMapper.selectMidByWhere(name,type);
//            mid = metas.getMid();
        } else if (num > 1) {
            throw new TipException("查询到多条数据");
        } else {
            metas = new Metas();
            metas.setSlug(name);
            metas.setName(name);
            metas.setType(type);
            metasMapper.insertSelective(metas);
            mid = metas.getMid();//报错
            log.info("mid是："+mid);
        }
        if (mid != 0) {
            RelationshipService relationshipService = new RelationshipService();
            int count = relationshipService.countById(cid, mid);
            if (count == 0) {
                Relationship relationships = new Relationship();
                relationships.setCid(cid);
                relationships.setMid(mid);
                relationshipService.insertVo(relationships);
            }
        }
    }

}
