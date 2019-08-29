package cn.lxtkj.springboot.service;

import cn.lxtkj.springboot.constant.WebConst;
import cn.lxtkj.springboot.entity.Attach;
import cn.lxtkj.springboot.mapper.AttachMapper;
import cn.lxtkj.springboot.model.Vo.ContentVo;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Service
public class AttachService {

    @Autowired
    private AttachMapper attachMapper;


    public PageInfo<Attach> getAttachs(Integer page, Integer limit, String sort) {
        PageHelper.startPage(page, limit);
        List<Attach> listAttach = attachMapper.list(sort);
        return new PageInfo<>(listAttach);
    }

//    @Override
//    public AttachVo selectById(Integer id) {
//        if(null != id){
//            return attachDao.selectByPrimaryKey(id);
//        }
//        return null;
//    }
//
//    @Override
//    @Transactional
//    public void save(String fname, String fkey, String ftype, Integer author) {
//        AttachVo attach = new AttachVo();
//        attach.setFname(fname);
//        attach.setAuthorId(author);
//        attach.setFkey(fkey);
//        attach.setFtype(ftype);
//        attach.setCreated(DateKit.getCurrentUnixTime());
//        attachDao.insertSelective(attach);
//    }
//
//    @Override
//    @Transactional
//    public void deleteById(Integer id) {
//        if (null != id) {
//            attachDao.deleteByPrimaryKey( id);
//        }
//    }
}
