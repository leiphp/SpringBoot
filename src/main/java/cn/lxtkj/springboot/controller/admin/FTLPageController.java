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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;


@Controller
@RequestMapping("/admin/page")
public class FTLPageController extends BaseController {

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

        if (StringUtils.isBlank(contents.getCategories())) {
            contents.setCategories("默认分类");
        }
        String result = articleService.publish(contents);
        if (!WebConst.SUCCESS_RESULT.equals(result)) {
            return RestResponseBo.fail(result);
        }
        return RestResponseBo.ok();
    }


}
