package cn.lxtkj.springboot.controller.admin;

import cn.lxtkj.springboot.constant.WebConst;
import cn.lxtkj.springboot.controller.BaseController;
import cn.lxtkj.springboot.dto.Types;
import cn.lxtkj.springboot.entity.Metas;
import cn.lxtkj.springboot.model.Bo.RestResponseBo;
import cn.lxtkj.springboot.service.MetasService;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;


@Controller
@RequestMapping("admin/links")
public class LinksController extends BaseController {

    private static Logger log = Logger.getLogger(FTLArticleController.class);

    @Resource
    private MetasService metasService;

    @RequestMapping(value = "")
    public String index(HttpServletRequest request) {
        List<Metas> metas = metasService.getMetaList(Types.LINK.getType(), null, WebConst.MAX_POSTS);
        request.setAttribute("links", metas);
        return "admin/links";
    }

    @RequestMapping(value = "save")
    @ResponseBody
    public RestResponseBo saveLink(@RequestParam String title, @RequestParam String url, @RequestParam String logo, @RequestParam Integer mid, @RequestParam(value = "sort", defaultValue = "0") int sort) {
        if(mid==null){
            mid =0;
        }
        try {
//            Metas metas = new Metas();
//            metas.setName(title);
//            metas.setSlug(url);
//            metas.setDescription(logo);
//            metas.setSort(sort);
//            metas.setType(Types.LINK.getType());
            metasService.saveLink(Types.LINK.getType(), title, url, sort, mid);
        } catch (Exception e) {
            String msg = "友链保存失败";
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
