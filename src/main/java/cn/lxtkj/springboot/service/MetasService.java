package cn.lxtkj.springboot.service;

import cn.lxtkj.springboot.constant.WebConst;
import cn.lxtkj.springboot.entity.Article;
import cn.lxtkj.springboot.entity.Metas;
import cn.lxtkj.springboot.mapper.MetasMapper;
import cn.lxtkj.springboot.model.Vo.ContentVo;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class MetasService {
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

}
