package cn.lxtkj.springboot.controller;

import cn.lxtkj.springboot.dto.Types;
import cn.lxtkj.springboot.entity.Article;
import cn.lxtkj.springboot.entity.Comment;
import cn.lxtkj.springboot.entity.Metas;
import cn.lxtkj.springboot.service.MetasService;
import cn.lxtkj.springboot.utils.Commons;
import com.github.pagehelper.PageInfo;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import cn.lxtkj.springboot.service.ArticleService;
import cn.lxtkj.springboot.service.CommentService;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Controller
public class FTLIndexController extends BaseController{
    private static Logger log = Logger.getLogger(FTLIndexController.class);

    @Autowired
    private ArticleService articleService;
    @Autowired
    private MetasService metasService;

    @Autowired
    private CommentService commentService;

    @Resource
    private Commons commons;

    @RequestMapping("/ftlindex")
    public String ftlIndex(Map<String, Object> map){
        map.put("name","雷小天");
        map.put("age","28");
        map.put("sex","0");
        return "ftlIndex";
    }

    @RequestMapping("/")
    public String Index(HttpServletRequest request){
        List<Article> articles = articleService.getNewArticleList(7);
        request.setAttribute("articles", articles);
        request.setAttribute("commons", commons);
        List<Article> recentArticle = super.getRecentArticle();
        request.setAttribute("recentarticle", recentArticle);
        List<Article> topArticle = super.getTophitArticle();
        request.setAttribute("toparticle", topArticle);
        return "home";
    }

    @RequestMapping("/list")
    public String List(){
        return "list";
    }

    @RequestMapping(value="/article/{id}", method = RequestMethod.GET)
    public String Article(HttpServletRequest request, @PathVariable String id){
        log.info("cid是："+id);
        Article article = articleService.getArticle(Integer.valueOf(id));
        if (null == article || "draft".equals(article.getStatus())) {
            return "comm/error_404";
        }
        log.info("article是："+article);
        request.setAttribute("article", article);

        Article nextArticle = articleService.getNextArticle(Integer.valueOf(id));
        request.setAttribute("nextarticle", nextArticle);

        Article prevArticle = articleService.getPrevArticle(Integer.valueOf(id));
        request.setAttribute("prevarticle", prevArticle);

        List<Article> likeArticles = articleService.getLikeArticleList();
        request.setAttribute("likearticles", likeArticles);

        List<Metas> categories = metasService.getMetas(Types.CATEGORY.getType());
        request.setAttribute("categories", categories);
        request.setAttribute("commons", commons);
        return "article";
    }
    @RequestMapping("/login")
    public String Login(Map<String, Object> map){
        map.put("pic",(int)(1+Math.random()*5));
        return "admin/login";
    }


    @RequestMapping(value="/tag/{tag}", method = RequestMethod.GET)
    public String tag(HttpServletRequest request, @PathVariable String tag, @RequestParam(value = "page", defaultValue = "1") int page, @RequestParam(value = "limit", defaultValue = "7") int limit){
        log.info("tag是："+tag);
        PageInfo<Article> articlePaginator = articleService.getArticleByTag(page, limit, '%'+tag+'%');
        request.setAttribute("articles", articlePaginator);
        request.setAttribute("pageInfo", articlePaginator);
        request.setAttribute("commons", commons);
        return "list";



    }

    /**
     * 抽取公共方法
     *
     * @param request
     * @param article
     * */
//    private void completeArticle(HttpServletRequest request, Article article) {
//        if (article.getAllowComment()) {
//            String cp = request.getParameter("cp");
//            if (StringUtils.isBlank(cp)) {
//                cp = "1";
//            }
//            request.setAttribute("cp", cp);
//            PageInfo<Comment> commentsPaginator = commentService.getCommentById(article.getCid(), Integer.parseInt(cp),6);
//            request.setAttribute("comments", commentsPaginator);
//        }
//    }
}
