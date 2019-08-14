package cn.lxtkj.springboot.config;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ErrorController {

    @RequestMapping("/getuser")
    public String getUser(int i){
        int j=0;
        j=1/i;
        return "success"+j;
    }
}
