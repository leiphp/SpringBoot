package cn.lxtkj.springboot.service;

import cn.lxtkj.springboot.entity.Options;
import cn.lxtkj.springboot.mapper.OptionsMapper;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class OptionsService {
    private static Logger log = Logger.getLogger(OptionsService.class);

    @Autowired
    private OptionsMapper optionsMapper;

    public void insertOption(Options option) {
        log.debug("Enter insertOption method:optionVo={}"+option);
        optionsMapper.insert(option.getName(),option.getValue(),option.getDescription());
        log.debug("Exit insertOption method.");
    }



    public void insertOption(String name, String value) {
        log.debug("Enter insertOption method:name={},value={}"+ name);
        Options option = new Options();
        option.setName(name);
        option.setValue(value);
        if (optionsMapper.selectByName(name) == null) {
            optionsMapper.insert(option.getName(),option.getValue(),option.getDescription());
        } else {
            optionsMapper.update(option.getName(),option.getValue(),option.getDescription());
        }
        log.debug("Exit insertOption method.");
    }



    public void saveOptions(Map<String, String> options) {
        if (null != options && !options.isEmpty()) {
            options.forEach(this::insertOption);
        }
    }


    public Options getOptionByName(String name) {
        return optionsMapper.selectByName(name);
    }


    public List<Options> getOptions() {
        return optionsMapper.select();
    }
}
