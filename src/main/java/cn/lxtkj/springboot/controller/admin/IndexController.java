package cn.lxtkj.springboot.controller.admin;

import cn.lxtkj.springboot.constant.WebConst;
import cn.lxtkj.springboot.controller.BaseController;
import cn.lxtkj.springboot.dto.LogActions;
import cn.lxtkj.springboot.exception.TipException;
import cn.lxtkj.springboot.model.Bo.RestResponseBo;
import cn.lxtkj.springboot.model.Bo.StatisticsBo;

import cn.lxtkj.springboot.entity.Comment;
import cn.lxtkj.springboot.entity.Article;
import cn.lxtkj.springboot.entity.Logs;
import cn.lxtkj.springboot.entity.User;
import cn.lxtkj.springboot.model.Vo.UserVo;
import cn.lxtkj.springboot.service.LogsService;
import cn.lxtkj.springboot.service.SiteService;
import cn.lxtkj.springboot.service.UserService;
import cn.lxtkj.springboot.utils.Commons;
import cn.lxtkj.springboot.utils.GsonUtils;
import cn.lxtkj.springboot.utils.TaleUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * 后台管理首页
 * Created by Administrator on 2017/3/9 009.
 */
@Controller("adminIndexController")
@RequestMapping("/admin")
@Transactional(rollbackFor = TipException.class)
public class IndexController extends BaseController {
    private static Logger log = Logger.getLogger(IndexController.class);

    @Resource
    private SiteService siteService;

    @Resource
    private LogsService logsService;

    @Resource
    private UserService userService;

    @Resource
    private Commons commons;

    /**
     * 页面跳转
     * @return
     */
    @GetMapping(value = {"","/index"})
    public String index(HttpServletRequest request){
        log.info("Enter admin index method");
        List<Comment> comments = siteService.recentComments(5);
        List<Article> articles = siteService.recentContents(5);
        StatisticsBo statistics = siteService.getStatistics();
        // 取最新的20条日志
        String sort ="created desc";
        List<Logs> logs = logsService.getLogs(1, 5, sort);

        request.setAttribute("comments", comments);
        request.setAttribute("articles", articles);
        request.setAttribute("statistics", statistics);
        request.setAttribute("logs", logs);
        request.setAttribute("commons", commons);
        log.info("Exit admin index method");
        return "admin/index";
    }

    /**
     * 个人设置页面
     */
    @GetMapping(value = "profile")
    public String profile() {
        return "admin/profile";
    }


    /**
     * 保存个人信息
     */
    @PostMapping(value = "/profile")
    @ResponseBody
    public RestResponseBo saveProfile(@RequestParam String name, @RequestParam String email, HttpServletRequest request, HttpSession session) {
        User user = this.user(request);
        if (StringUtils.isNotBlank(name) && StringUtils.isNotBlank(email)) {
            User temp = new User();
            log.info("获取到的Id为："+user.getId());
            temp.setId(user.getId());
            temp.setName(name);
            temp.setEmail(email);
            userService.updateById(temp);
            logsService.insertLog(LogActions.UP_INFO.getAction(), GsonUtils.toJsonString(temp), request.getRemoteAddr(), this.getUid(request));

            //更新session中的数据
            User original= (User)session.getAttribute(WebConst.LOGIN_SESSION_KEY);
            original.setName(name);
            original.setEmail(email);
            session.setAttribute(WebConst.LOGIN_SESSION_KEY,original);
        }
        return RestResponseBo.ok();
    }

//    /**
//     * 修改密码
//     */
//    @PostMapping(value = "/password")
//    @ResponseBody
//    public RestResponseBo upPwd(@RequestParam String oldPassword, @RequestParam String password, HttpServletRequest request, HttpSession session) {
//        UserVo users = this.user(request);
//        if (StringUtils.isBlank(oldPassword) || StringUtils.isBlank(password)) {
//            return RestResponseBo.fail("请确认信息输入完整");
//        }
//
//        if (!users.getPassword().equals(TaleUtils.MD5encode(users.getUsername() + oldPassword))) {
//            return RestResponseBo.fail("旧密码错误");
//        }
//        if (password.length() < 6 || password.length() > 14) {
//            return RestResponseBo.fail("请输入6-14位密码");
//        }
//
//        try {
//            UserVo temp = new UserVo();
//            temp.setUid(users.getUid());
//            String pwd = TaleUtils.MD5encode(users.getUsername() + password);
//            temp.setPassword(pwd);
//            userService.updateByUid(temp);
//            logService.insertLog(LogActions.UP_PWD.getAction(), null, request.getRemoteAddr(), this.getUid(request));
//
//            //更新session中的数据
//            UserVo original= (UserVo)session.getAttribute(WebConst.LOGIN_SESSION_KEY);
//            original.setPassword(pwd);
//            session.setAttribute(WebConst.LOGIN_SESSION_KEY,original);
//            return RestResponseBo.ok();
//        } catch (Exception e){
//            String msg = "密码修改失败";
//            if (e instanceof TipException) {
//                msg = e.getMessage();
//            } else {
//                LOGGER.error(msg, e);
//            }
//            return RestResponseBo.fail(msg);
//        }
//    }
}
