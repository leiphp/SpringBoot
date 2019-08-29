package cn.lxtkj.springboot.controller.admin;

import cn.lxtkj.springboot.constant.WebConst;
import cn.lxtkj.springboot.controller.BaseController;
import cn.lxtkj.springboot.entity.Metas;
import cn.lxtkj.springboot.model.Bo.RestResponseBo;
import cn.lxtkj.springboot.service.MetasService;
import cn.lxtkj.springboot.utils.AdminCommons;
import cn.lxtkj.springboot.dto.Types;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;


@Controller
@RequestMapping("/admin/category")
public class FTLCategoryController extends BaseController {
    private static Logger log = Logger.getLogger(FTLArticleController.class);

    @Autowired
    private MetasService metasService;

    @Resource
    private AdminCommons adminCommons;

    @RequestMapping(value = "")
    public String index(HttpServletRequest request) {
        List<Metas> categories = metasService.getMetaList(Types.CATEGORY.getType(), null, WebConst.MAX_POSTS);
        List<Metas> tags = metasService.getMetaList(Types.TAG.getType(), null, WebConst.MAX_POSTS);
        log.info("sort是什么："+categories);
        request.setAttribute("categories", categories);
        request.setAttribute("tags", tags);
        request.setAttribute("adminCommons", adminCommons);
        return "admin/category";
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public RestResponseBo saveCategory(@RequestParam String cname, @RequestParam Integer mid) {
        if(mid==null){
            mid =0;
        }
        log.info("mid是多少："+mid);
        try {
            metasService.saveMeta(Types.CATEGORY.getType(), cname, mid);
        } catch (Exception e) {
            String msg = "分类保存失败";
            log.error(msg, e);
            return RestResponseBo.fail(msg);
        }
        return RestResponseBo.ok();
    }

    @RequestMapping(value = "delete")
    @ResponseBody
    public RestResponseBo delete(@RequestParam int mid) {
        String result = metasService.deleteMeta(mid);
        if (!WebConst.SUCCESS_RESULT.equals(result)) {
            return RestResponseBo.fail(result);
        }
        return RestResponseBo.ok();
    }


}
