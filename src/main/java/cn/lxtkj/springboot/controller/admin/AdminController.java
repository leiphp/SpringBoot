package cn.lxtkj.springboot.controller.admin;

import cn.lxtkj.springboot.mapper.UserMapper;
import cn.lxtkj.springboot.model.ResultMap;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Map;


/**
 * Created with IntelliJ IDEA
 *
 * @Author yuanhaoyue swithaoy@gmail.com
 * @Description 权限：管理员
 * @Date 2018-04-06
 * @Time 20:31
 */
@RestController
@RequestMapping("/admin")
public class AdminController {
    private final ResultMap resultMap;
    private final UserMapper userMapper;

    @Autowired
    public AdminController(ResultMap resultMap,UserMapper userMapper) {
        this.resultMap = resultMap;
        this.userMapper = userMapper;
    }
    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String Login(Map<String, Object> map) {
        map.put("comments","11");
        map.put("articles","11");
        map.put("statistics","11");
        map.put("logs","11");
        return "admin/index";
    }
    @RequestMapping(value = "/getMessage", method = RequestMethod.GET)
    public ResultMap getMessage() {
        return resultMap.success().message("您拥有管理员权限，可以获得该接口的信息！");
    }



}
