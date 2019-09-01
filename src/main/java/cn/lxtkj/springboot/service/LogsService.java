package cn.lxtkj.springboot.service;

import cn.lxtkj.springboot.constant.WebConst;
import cn.lxtkj.springboot.entity.Logs;
import cn.lxtkj.springboot.mapper.LogsMapper;
import cn.lxtkj.springboot.model.Vo.LogVo;
import cn.lxtkj.springboot.utils.DateKit;
import com.github.pagehelper.PageHelper;
import org.apache.log4j.Logger;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class LogsService {
    private static Logger log = Logger.getLogger(OptionsService.class);

    @Resource
    private LogsMapper logsMapper;


    public void insertLog(Logs logs) {
        logsMapper.insert(logs.getAction(),logs.getData(),logs.getAuthorId(),logs.getIp(),logs.getCreated());
    }


    public void insertLog(String action, String data, String ip, Integer authorId) {
        Logs logs = new Logs();
        logs.setAction(action);
        logs.setData(data);
        logs.setIp(ip);
        logs.setAuthorId(authorId);
        logs.setCreated(DateKit.getCurrentUnixTime());
        logsMapper.insert(logs.getAction(),logs.getData(),logs.getAuthorId(),logs.getIp(),logs.getCreated());
    }


    public PageInfo<Logs> getLogs(int page, int limit,  String sort) {
        //mysql查询limit
        //pageHelper 帮我们生产分页语句
        PageHelper.startPage(page, limit);
        List<Logs> listArticle = logsMapper.getList(sort);
        //返回给客户端展示
        PageInfo<Logs> pageInfoLogsList = new PageInfo<Logs>(listArticle);
        return pageInfoLogsList;
    }
}
