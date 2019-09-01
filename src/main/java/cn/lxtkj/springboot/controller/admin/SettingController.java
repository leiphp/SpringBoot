package cn.lxtkj.springboot.controller.admin;

import cn.lxtkj.springboot.constant.WebConst;
import cn.lxtkj.springboot.controller.BaseController;
import cn.lxtkj.springboot.dto.LogActions;
import cn.lxtkj.springboot.exception.TipException;
import cn.lxtkj.springboot.model.Bo.BackResponseBo;
import cn.lxtkj.springboot.model.Bo.RestResponseBo;
import cn.lxtkj.springboot.entity.Options;
import cn.lxtkj.springboot.service.LogsService;
import cn.lxtkj.springboot.service.OptionsService;
import cn.lxtkj.springboot.service.SiteService;
import cn.lxtkj.springboot.utils.GsonUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by wangq on 2017/3/20.
 */
@Controller
@RequestMapping("/admin/setting")
public class SettingController extends BaseController {
    private static Logger log = Logger.getLogger(SettingController.class);

    @Autowired
    private OptionsService optionService;

    @Autowired
    private LogsService logService;

    @Autowired
    private SiteService siteService;

    /**
     * 系统设置
     */
    @RequestMapping(value = "")
    public String setting(HttpServletRequest request) {
        List<Options> voList = optionService.getOptions();
        Map<String, String> options = new HashMap<>();
        voList.forEach((option) -> {
            options.put(option.getName(), option.getValue());
        });
        if (options.get("site_record") == null) {
            options.put("site_record", "");
        }
        request.setAttribute("options", options);
        return "admin/setting";
    }

    /**
     * 保存系统设置
     */
    @PostMapping(value = "")
    @ResponseBody
    public RestResponseBo saveSetting(@RequestParam(required = false) String site_theme, HttpServletRequest request) {
        try {
            Map<String, String[]> parameterMap = request.getParameterMap();
            Map<String, String> querys = new HashMap<>();
            parameterMap.forEach((key, value) -> {
                querys.put(key, join(value));
            });
            optionService.saveOptions(querys);
            WebConst.initConfig = querys;
            if (StringUtils.isNotBlank(site_theme)) {
                BaseController.THEME = "themes/" + site_theme;
            }
            int uid= 4;
            logService.insertLog(LogActions.SYS_SETTING.getAction(), GsonUtils.toJsonString(querys), request.getRemoteAddr(), uid);
            return RestResponseBo.ok();
        } catch (Exception e) {
            String msg = "保存设置失败";
            return RestResponseBo.fail(msg);
        }
    }


    /**
     * 系统备份
     *
     * @return
     */
    @PostMapping(value = "backup")
    @ResponseBody
    public RestResponseBo backup(@RequestParam String bk_type, @RequestParam String bk_path, HttpServletRequest request) {
        if (StringUtils.isBlank(bk_type)) {
            return RestResponseBo.fail("请确认信息输入完整");
        }
        try {
            BackResponseBo backResponse = siteService.backup(bk_type, bk_path, "yyyyMMddHHmm");
            logService.insertLog(LogActions.SYS_BACKUP.getAction(), null, request.getRemoteAddr(), this.getUid(request));
            return RestResponseBo.ok(backResponse);
        } catch (Exception e) {
            String msg = "备份失败";
            if (e instanceof TipException) {
                msg = e.getMessage();
            } else {
                log.error(msg, e);
            }
            return RestResponseBo.fail(msg);
        }
    }


    /**
     * 数组转字符串
     *
     * @param arr
     * @return
     */
    private String join(String[] arr) {
        StringBuilder ret = new StringBuilder();
        String[] var3 = arr;
        int var4 = arr.length;

        for (int var5 = 0; var5 < var4; ++var5) {
            String item = var3[var5];
            ret.append(',').append(item);
        }

        return ret.length() > 0 ? ret.substring(1) : ret.toString();
    }

}
