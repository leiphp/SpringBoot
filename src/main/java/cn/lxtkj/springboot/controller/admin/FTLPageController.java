package cn.lxtkj.springboot.controller.admin;

import cn.lxtkj.springboot.constant.WebConst;
import cn.lxtkj.springboot.controller.BaseController;
import cn.lxtkj.springboot.dto.Types;
import cn.lxtkj.springboot.entity.Article;
import cn.lxtkj.springboot.model.Bo.RestResponseBo;
import cn.lxtkj.springboot.model.Vo.ContentVo;
import cn.lxtkj.springboot.service.ArticleService;
import cn.lxtkj.springboot.utils.DateKit;
import com.github.pagehelper.PageInfo;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;


@Controller
@RequestMapping("/admin/page")
public class FTLPageController extends BaseController {
    private static Logger log = Logger.getLogger(FTLArticleController.class);

    @Autowired
    private ArticleService articleService;

    @RequestMapping(value = "")
    public String index(@RequestParam(value = "type", defaultValue = "page") String type,@RequestParam(value = "page", defaultValue = "1") int page, @RequestParam(value = "limit", defaultValue = "10") int limit,@RequestParam(value = "sort", defaultValue = "created desc") String sort, HttpServletRequest request) {
        PageInfo<Article> articlePaginator = articleService.findArticleList(type, page, limit, sort);
        request.setAttribute("articles", articlePaginator);
        request.setAttribute("pageInfo", articlePaginator);
        return "admin/page_list";
    }
    @RequestMapping(value = "/new")
    public String newPage() {
        return "admin/page_edit";
    }

    @RequestMapping(value = "/{cid}")
    public String editPage(@PathVariable String cid, HttpServletRequest request) {
        Article article = articleService.getArticle(Integer.valueOf(cid));
        request.setAttribute("contents", article);
        return "admin/page_edit";
    }

    @RequestMapping(value = "/publish", method = RequestMethod.POST)
    @ResponseBody
    public RestResponseBo publishArticle(ContentVo contents, HttpServletRequest request) {
//        UserVo users = this.user(request);
//        contents.setAuthorId(users.getId());
        int cid=4;
        contents.setAuthorId(cid);
        contents.setType(Types.PAGE.getType());
        int time = DateKit.getCurrentUnixTime();
        contents.setCreated(time);
        contents.setModified(time);

        String result = articleService.publish(contents);
        if (!WebConst.SUCCESS_RESULT.equals(result)) {
            return RestResponseBo.fail(result);
        }
        return RestResponseBo.ok();
    }

    @RequestMapping(value = "/modify", method = RequestMethod.POST)
    @ResponseBody
    public RestResponseBo modifyArticle(ContentVo contents, HttpServletRequest request) {
//        UserVo users = this.user(request);
//        contents.setAuthorId(users.getUid());
        log.info("获取的标题是："+contents.getTitle());
        log.info("获取的路径是："+contents.getSlug());
        log.info("获取的内容是："+contents.getContent());
        int author_id=4;
        contents.setAuthorId(author_id);
        contents.setType(Types.PAGE.getType());
        int time = DateKit.getCurrentUnixTime();
        contents.setCreated(time);
        contents.setModified(time);
        String result = articleService.updateArticle(contents);
        if (!WebConst.SUCCESS_RESULT.equals(result)) {
            return RestResponseBo.fail(result);
        }
        return RestResponseBo.ok();
    }

//    @RequestMapping(value = "delete")
//    @ResponseBody
//    public RestResponseBo delete(@RequestParam int cid, HttpServletRequest request) {
//        String result = contentsService.deleteByCid(cid);
//        logService.insertLog(LogActions.DEL_ARTICLE.getAction(), cid + "", request.getRemoteAddr(), this.getUid(request));
//        if (!WebConst.SUCCESS_RESULT.equals(result)) {
//            return RestResponseBo.fail(result);
//        }
//        return RestResponseBo.ok();
//    }


}
