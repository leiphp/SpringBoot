package cn.lxtkj.springboot.controller;

import cn.lxtkj.springboot.dto.Types;
import cn.lxtkj.springboot.entity.Article;
import cn.lxtkj.springboot.entity.Comment;
import cn.lxtkj.springboot.entity.Metas;
import cn.lxtkj.springboot.service.MetasService;
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

    @RequestMapping("/ftlindex")
    public String ftlIndex(Map<String, Object> map){
        map.put("name","雷小天");
        map.put("age","28");
        map.put("sex","0");
        return "ftlIndex";
    }
    @RequestMapping("/")
    public String Index(){
        return "home";
    }
    @RequestMapping("/list")
    public String List(){
        return "list";
    }
    @RequestMapping(value="/article/{id}", method = RequestMethod.GET)
    public String Article(HttpServletRequest request, @PathVariable String id){
//        Article article = articleService.getArticle(Integer.valueOf(id));
//        if (null == article || "draft".equals(article.getStatus())) {
//            return this.render_404();
//        }
//        request.setAttribute("article", article);
//        request.setAttribute("is_post", true);
//        completeArticle(request, article);
//        if (!checkHitsFrequency(request, cid)) {
//            updateArticleHit(contents.getCid(), contents.getHits());
//        }
//        return this.render("post");


        log.info("cid是："+id);
        Article article = articleService.getArticle(Integer.valueOf(id));
        log.info("article是："+article);
        request.setAttribute("article", article);
        List<Metas> categories = metasService.getMetas(Types.CATEGORY.getType());
        request.setAttribute("categories", categories);
        return "article";
    }
    @RequestMapping("/login")
    public String Login(Map<String, Object> map){
        map.put("pic",(int)(1+Math.random()*5));
        return "admin/login";
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
