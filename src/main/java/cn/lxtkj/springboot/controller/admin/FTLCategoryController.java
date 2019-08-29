package cn.lxtkj.springboot.controller.admin;

import cn.lxtkj.springboot.constant.WebConst;
import cn.lxtkj.springboot.controller.BaseController;
import cn.lxtkj.springboot.entity.Metas;
import cn.lxtkj.springboot.model.Bo.RestResponseBo;
import cn.lxtkj.springboot.service.MetasService;
import cn.lxtkj.springboot.utils.AdminCommons;
import com.github.pagehelper.PageInfo;
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
//    @RequestMapping(value = "")
//    public String index(@RequestParam(value = "type", defaultValue = "comment") String type,@RequestParam(value = "page", defaultValue = "1") int page, @RequestParam(value = "limit", defaultValue = "10") int limit,@RequestParam(value = "sort", defaultValue = "created desc") String sort, HttpServletRequest request) {
//        PageInfo<Comment> commentPaginator = commentService.getCommentList(type, page, limit, sort);
//        request.setAttribute("comments", commentPaginator);
//        request.setAttribute("pageInfo", commentPaginator);
//        return "admin/comment_list";
//    }

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


//    @RequestMapping(value = "delete")
//    @ResponseBody
//    public RestResponseBo delete(@RequestParam int coid, HttpServletRequest request) {
//        String result = commentService.deleteByCoid(coid);
//        if (!WebConst.SUCCESS_RESULT.equals(result)) {
//            return RestResponseBo.fail(result);
//        }
//        return RestResponseBo.ok();
//    }



//    @RequestMapping(value = "/status", method = RequestMethod.POST)
//    @ResponseBody
//    public RestResponseBo status(@RequestParam Integer coid, @RequestParam String status) {
//        try {
//            Comment comments = commentService.getCommentById(coid);
//            if (comments != null) {
//                comments.setCoid(coid);
//                comments.setStatus(status);
//                commentService.updateComment(comments);
//            } else {
//                return RestResponseBo.fail("操作失败");
//            }
//        } catch (Exception e) {
//            String msg = "操作失败";
//            return RestResponseBo.fail(msg);
//        }
//        return RestResponseBo.ok();
//    }

}
