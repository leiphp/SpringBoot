package cn.lxtkj.springboot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
    @RequestMapping("/")
    public String Index(){
        return "home";
    }
    @RequestMapping("/list")
    public String List(){
        return "list";
    }
    @RequestMapping(value="/article/{id}", method = RequestMethod.GET)
    public String Article(){
        return "article";
    }
}
