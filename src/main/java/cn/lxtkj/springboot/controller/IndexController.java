package cn.lxtkj.springboot.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController//注解表示该类所以方法，都会返回json格式数据（@Controller+@ResponseBody）
public class IndexController {

    @RequestMapping(value = "/hello", method = RequestMethod.GET)
    public String say(){
        return "hello world!";
    }
}
