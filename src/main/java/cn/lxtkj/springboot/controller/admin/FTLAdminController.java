package cn.lxtkj.springboot.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Map;

@Controller
@RequestMapping("/admin")
public class FTLAdminController {

    @RequestMapping("/ftlindex")
    public String ftlIndex(Map<String, Object> map){
        map.put("name","雷小天");
        map.put("age","28");
        map.put("sex","0");
        return "ftlIndex";
    }
    @RequestMapping("/index")
    public String Index(){
        return "admin/index";
    }


}
