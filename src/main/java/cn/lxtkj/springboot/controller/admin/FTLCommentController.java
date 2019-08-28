package cn.lxtkj.springboot.controller.admin;

import cn.lxtkj.springboot.constant.WebConst;
import cn.lxtkj.springboot.controller.BaseController;
import cn.lxtkj.springboot.dto.Types;
import cn.lxtkj.springboot.entity.Comment;
import cn.lxtkj.springboot.model.Bo.RestResponseBo;
import cn.lxtkj.springboot.model.Vo.ContentVo;
import cn.lxtkj.springboot.service.CommentService;
import cn.lxtkj.springboot.utils.DateKit;
import com.github.pagehelper.PageInfo;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;


@Controller
@RequestMapping("/admin/comments")
public class FTLCommentController extends BaseController {
    private static Logger log = Logger.getLogger(FTLArticleController.class);

    @Autowired
    private CommentService commentService;

    @RequestMapping(value = "")
    public String index(@RequestParam(value = "type", defaultValue = "comment") String type,@RequestParam(value = "page", defaultValue = "1") int page, @RequestParam(value = "limit", defaultValue = "10") int limit,@RequestParam(value = "sort", defaultValue = "created desc") String sort, HttpServletRequest request) {
        PageInfo<Comment> commentPaginator = commentService.getCommentList(type, page, limit, sort);
        request.setAttribute("comments", commentPaginator);
        request.setAttribute("pageInfo", commentPaginator);
        return "admin/comment_list";
    }




//    @RequestMapping(value = "delete")
//    @ResponseBody
//    public RestResponseBo delete(@RequestParam int cid, HttpServletRequest request) {
//        String result = articleService.deleteByCid(cid);
//        if (!WebConst.SUCCESS_RESULT.equals(result)) {
//            return RestResponseBo.fail(result);
//        }
//        return RestResponseBo.ok();
//    }


    @RequestMapping(value = "/status", method = RequestMethod.POST)
    @ResponseBody
    public RestResponseBo status(@RequestParam Integer coid, @RequestParam String status) {
        try {
            Comment comments = commentService.getCommentById(coid);
            if (comments != null) {
                comments.setCoid(coid);
                comments.setStatus(status);
                commentService.updateComment(comments);
            } else {
                return RestResponseBo.fail("操作失败");
            }
        } catch (Exception e) {
            String msg = "操作失败";
            return RestResponseBo.fail(msg);
        }
        return RestResponseBo.ok();
    }

}
