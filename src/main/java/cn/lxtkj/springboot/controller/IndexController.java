package cn.lxtkj.springboot.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController//注解表示该类所以方法，都会返回json格式数据（@Controller+@ResponseBody）
public class IndexController {
    @Value("${name}")
    private String name;
    @Value("${http_url}")
    private String httpUrl;

    @RequestMapping(value = "/hello", method = RequestMethod.GET)
    public String say(){
        return "hello world!";
    }

    @RequestMapping("/getName")
    public String getName(){
        return name;
    }

    @RequestMapping("/httpUrl")
    public String httpUrl(){
        return httpUrl;
    }
}
