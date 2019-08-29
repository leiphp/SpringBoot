package cn.lxtkj.springboot.controller.admin;


import cn.lxtkj.springboot.model.ResultMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Map;


/**
 * Created with IntelliJ IDEA
 *
 * @Author leixiaotian 1124378213@qq.com
 * @Description 权限：管理员
 * @Date 2018-04-06
 * @Time 20:31
 */
@RestController
@RequestMapping("/admin")
public class AdminController {
    private final ResultMap resultMap;

    @Autowired
    public AdminController(ResultMap resultMap) {
        this.resultMap = resultMap;
    }
    @RequestMapping(value = "/getMessage", method = RequestMethod.GET)
    public ResultMap getMessage() {
        return resultMap.success().message("您拥有管理员权限，可以获得该接口的信息！");
    }



}
