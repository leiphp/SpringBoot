package cn.lxtkj.springboot.controller;

import cn.lxtkj.springboot.constant.WebConst;
import cn.lxtkj.springboot.mapper.UserMapper;
import cn.lxtkj.springboot.model.ResultMap;
import cn.lxtkj.springboot.entity.User;
import cn.lxtkj.springboot.service.UserService;
import cn.lxtkj.springboot.utils.TaleUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.apache.log4j.Logger;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created with IntelliJ IDEA
 *
 * @Author yuanhaoyue swithaoy@gmail.com
 * @Description 登陆 Controller
 * @Date 2018-04-03
 * @Time 22:28
 */
@RestController
public class LoginController {
    private static Logger log = Logger.getLogger(LoginController.class);

    @Resource
    private UserService userService;
    private final ResultMap resultMap;
    private final UserMapper userMapper;

    @Autowired
    public LoginController(ResultMap resultMap, UserMapper userMapper) {
        this.resultMap = resultMap;
        this.userMapper = userMapper;
    }

    @RequestMapping(value = "/notLogin", method = RequestMethod.GET)
    public ResultMap notLogin() {
        return resultMap.success().message("您尚未登陆！");
    }

    @RequestMapping(value = "/notRole", method = RequestMethod.GET)
    public ResultMap notRole() {
        return resultMap.success().message("您没有权限！");
    }

//    @RequestMapping(value = "/logout", method = RequestMethod.GET)
//    public ResultMap logout() {
//        Subject subject = SecurityUtils.getSubject();
//        subject.logout();
//        return resultMap.success().message("成功注销！");
//    }

    /**
     * 注销
     *
     * @param response
     */
    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public void logout( HttpServletResponse response) {
        Subject subject = SecurityUtils.getSubject();
        subject.logout();
        try {
            response.sendRedirect("/login");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 登陆
     *
     * @param username 用户名
     * @param password 密码
     */
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public ResultMap login(String username, String password, HttpServletRequest request) {
        //重新对密码进行加密
         String md5Password = TaleUtils.MD5encode(username + password);
        log.info("md5Password是什么："+md5Password);
        // 从SecurityUtils里边创建一个 subject
        Subject subject = SecurityUtils.getSubject();
        // 在认证提交前准备 token（令牌）
        UsernamePasswordToken token = new UsernamePasswordToken(username, md5Password);
        // 执行认证登陆
        subject.login(token);
        //新增session设置
        User user = userService.login(username, password);
        log.info("use对象是："+user);
        request.getSession().setAttribute(WebConst.LOGIN_SESSION_KEY, user);
        //根据权限，指定返回数据
        String role = userMapper.getRole(username);
        log.info("role是什么："+role);
        if ("user".equals(role)) {
//            return resultMap.success().message("欢迎登陆");
            return resultMap.success().status(true);
        }
        if ("admin".equals(role)) {
//            return resultMap.success().message("欢迎来到管理员页面");
            return resultMap.success().status(true);
        }
        return resultMap.fail().message("权限错误！");
    }
}
