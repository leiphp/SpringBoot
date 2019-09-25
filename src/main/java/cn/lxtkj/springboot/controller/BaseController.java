package cn.lxtkj.springboot.controller;

//import cn.lxtkj.springboot.model.Vo.UserVo;
import cn.lxtkj.springboot.dto.Types;
import cn.lxtkj.springboot.entity.Article;
import cn.lxtkj.springboot.entity.Metas;
import cn.lxtkj.springboot.entity.User;
import cn.lxtkj.springboot.service.ArticleService;
import cn.lxtkj.springboot.service.MetasService;
import cn.lxtkj.springboot.utils.MapCache;
import cn.lxtkj.springboot.utils.TaleUtils;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by 13 on 2017/2/21.
 */
public abstract class BaseController {
    @Autowired
    private ArticleService articleService;

    @Autowired
    private MetasService metasService;

    public static String THEME = "themes/default";

    protected MapCache cache = MapCache.single();

    /**
     * 主页的页面主题
     * @param viewName
     * @return
     */
    public String render(String viewName) {
        return THEME + "/" + viewName;
    }

    public BaseController title(HttpServletRequest request, String title) {
        request.setAttribute("title", title);
        return this;
    }

    public BaseController keywords(HttpServletRequest request, String keywords) {
        request.setAttribute("keywords", keywords);
        return this;
    }

    /**
     * 获取请求绑定的登录对象
     * @param request
     * @return
     */
    public User user(HttpServletRequest request) {
        return TaleUtils.getLoginUser(request);
    }

    public Integer getUid(HttpServletRequest request){
        return this.user(request).getId();
    }

    public String render_404() {
        return "comm/error_404";
    }

    /**
     * 获取请求最新6条数据
     * @return
     */
    public  List<Article> getRecentArticle() {
        List<Article> articles = articleService.getNewArticleList(6);
       return articles;
    }

    /**
     * 获取请求最新6条数据
     * @return
     */
    public  List<Article> getTophitArticle() {
        List<Article> articles = articleService.getTophitArticleList(6);
        return articles;
    }
//    public String getTophitArticle(HttpServletRequest request) {
//        List<Article> articles = articleService.getTophitArticleList(6);
//        request.setAttribute("toparticle", articles);
//        return "comm/public_right";
//    }
    /**
     * 获取请求站长推荐6条数据
     * @return
     */
    public  List<Article> getRecommendArticle() {
        List<Article> articles = articleService.getRecommendArticleList(6);
        return articles;
    }
    /**
     * 获取所有tag数据
     * @return
     */
    public  List<Metas> getAllTags() {
        List<Metas> tags = metasService.getMetas(Types.TAG.getType());
        return tags;
    }

    /**
     * 获取所有link数据
     * @return
     */
    public  List<Metas> getAllLink() {
        List<Metas> links = metasService.getMetas(Types.LINK.getType());
        return links;
    }

}
