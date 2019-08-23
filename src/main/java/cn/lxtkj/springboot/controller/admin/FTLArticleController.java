package cn.lxtkj.springboot.controller.admin;

import cn.lxtkj.springboot.entity.Article;
import cn.lxtkj.springboot.service.ArticleService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;


@Controller
@RequestMapping("/admin/article")
public class FTLArticleController {

    @Autowired
    private ArticleService articleService;

    @RequestMapping(value = "")
    public String index(@RequestParam(value = "page", defaultValue = "1") int page, @RequestParam(value = "limit", defaultValue = "10") int limit, HttpServletRequest request) {
        PageInfo<Article> articlePaginator = articleService.findArticleList(page, limit);
        request.setAttribute("articles", articlePaginator);
        return "admin/article_list";
    }
    @RequestMapping(value = "/publish")
    public String newArticle() {
        return "admin/article_edit";
    }
//    @RequestMapping(value = "/publish")
//    public String newArticle(HttpServletRequest request) {
//        List<MetaVo> categories = metasService.getMetas(Types.CATEGORY.getType());
//        request.setAttribute("categories", categories);
//        return "admin/article_edit";
//    }


}
