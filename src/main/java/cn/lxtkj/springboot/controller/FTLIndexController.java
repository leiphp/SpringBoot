package cn.lxtkj.springboot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Map;

@Controller
public class FTLIndexController {

    @RequestMapping("/ftlindex")
    public String ftlIndex(Map<String, Object> map){
        map.put("name","雷小天");
        map.put("age","28");
        map.put("sex","0");
        return "ftlIndex";
    }
}
