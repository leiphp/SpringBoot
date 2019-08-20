package cn.lxtkj.springboot.controller;

import cn.lxtkj.springboot.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import cn.lxtkj.springboot.model.ResultMap;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping("/user")
@RestController
public class UserController {
    private final ResultMap resultMap;

    @Autowired
    public UserController(ResultMap resultMap) {
        this.resultMap = resultMap;
    }

    @Autowired
    private UserService userService;

    @RequestMapping("/insertUser")
    public Integer insertUser(String name, Integer age){
        return userService.insertUser(name, age);
    }

    @RequestMapping(value = "/getMessage", method = RequestMethod.GET)
    public ResultMap getMessage() {
        return resultMap.success().message("您拥有用户权限，可以获得该接口的信息！");
    }

}
