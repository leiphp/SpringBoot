package cn.lxtkj.springboot.controller;

import cn.lxtkj.springboot.dto.Types;
import cn.lxtkj.springboot.entity.Article;
import cn.lxtkj.springboot.entity.Comment;
import cn.lxtkj.springboot.entity.Metas;
import cn.lxtkj.springboot.service.MetasService;
import cn.lxtkj.springboot.utils.*;
import com.github.pagehelper.PageInfo;
import com.vdurmont.emoji.EmojiParser;
import org.apache.commons.lang3.StringUtils;
import cn.lxtkj.springboot.constant.WebConst;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import cn.lxtkj.springboot.service.ArticleService;
import cn.lxtkj.springboot.service.CommentService;
import cn.lxtkj.springboot.model.Bo.RestResponseBo;
import cn.lxtkj.springboot.dto.ErrorCode;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.net.URLEncoder;
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
        /*公共数据start*/
        List<Article> recentArticle = super.getRecentArticle();
        request.setAttribute("recentarticle", recentArticle);
        List<Article> topArticle = super.getTophitArticle();
        request.setAttribute("toparticle", topArticle);
        List<Article> recommendArticle = super.getRecommendArticle();
        request.setAttribute("recommendarticle", recommendArticle);
        List<Metas> alltags = super.getAllTags();
        request.setAttribute("alltags", alltags);
        List<Metas> alllinks = super.getAllLink();
        request.setAttribute("alllinks", alllinks);
        /*公共数据end*/
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

        completeArticle(request, article);

        request.setAttribute("commons", commons);

        /*公共数据start*/
        List<Article> recentArticle = super.getRecentArticle();
        request.setAttribute("recentarticle", recentArticle);
        List<Article> topArticle = super.getTophitArticle();
        request.setAttribute("toparticle", topArticle);
        List<Article> recommendArticle = super.getRecommendArticle();
        request.setAttribute("recommendarticle", recommendArticle);
        List<Metas> alltags = super.getAllTags();
        request.setAttribute("alltags", alltags);
        /*公共数据end*/
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
        /*公共数据start*/
        List<Article> recentArticle = super.getRecentArticle();
        request.setAttribute("recentarticle", recentArticle);
        List<Article> topArticle = super.getTophitArticle();
        request.setAttribute("toparticle", topArticle);
        List<Article> recommendArticle = super.getRecommendArticle();
        request.setAttribute("recommendarticle", recommendArticle);
        List<Metas> alltags = super.getAllTags();
        request.setAttribute("alltags", alltags);
        /*公共数据end*/
        return "list";
    }
    //列表页面
    @RequestMapping(value="/category/{categories}", method = RequestMethod.GET)
    public String categories(HttpServletRequest request, @PathVariable String categories, @RequestParam(value = "page", defaultValue = "1") int page, @RequestParam(value = "limit", defaultValue = "7") int limit){
        log.info("categories是："+categories);
        PageInfo<Article> articlePaginator = articleService.getArticleByCategories(page, limit, '%'+categories+'%');
        request.setAttribute("articles", articlePaginator);
        request.setAttribute("pageInfo", articlePaginator);
        request.setAttribute("commons", commons);
        /*公共数据start*/
        List<Article> recentArticle = super.getRecentArticle();
        request.setAttribute("recentarticle", recentArticle);
        List<Article> topArticle = super.getTophitArticle();
        request.setAttribute("toparticle", topArticle);
        List<Article> recommendArticle = super.getRecommendArticle();
        request.setAttribute("recommendarticle", recommendArticle);
        List<Metas> alltags = super.getAllTags();
        request.setAttribute("alltags", alltags);
        /*公共数据end*/
        return "list";
    }

    /**
     * 抽取公共方法
     *
     * @param request
     * @param article
     * */
    private void completeArticle(HttpServletRequest request, Article article) {
       // if (article.getAllowComment()) {
            String cp = request.getParameter("cp");
            if (StringUtils.isBlank(cp)) {
                cp = "1";
            }
            request.setAttribute("cp", cp);
            PageInfo<Comment> commentsPaginator = commentService.getCommentById(Integer.parseInt(cp), 5, article.getCid());
            request.setAttribute("comments", commentsPaginator);
       // }
    }

    /**
     * 评论操作
     */
    @RequestMapping(value = "/comment", method = RequestMethod.POST)
    @ResponseBody
    public RestResponseBo comment(HttpServletRequest request, HttpServletResponse response,
                                  @RequestParam Integer cid, @RequestParam Integer coid,
                                  @RequestParam String author, @RequestParam String mail,
                                  @RequestParam String url, @RequestParam String text, @RequestParam String _csrf_token) {

        String ref = request.getHeader("Referer");
        if (StringUtils.isBlank(ref) || StringUtils.isBlank(_csrf_token)) {
            return RestResponseBo.fail(ErrorCode.BAD_REQUEST);
        }

        String token = cache.hget(Types.CSRF_TOKEN.getType(), _csrf_token);
        if (StringUtils.isBlank(token)) {
            return RestResponseBo.fail(ErrorCode.BAD_REQUEST);
        }

        if (null == cid || StringUtils.isBlank(text)) {
            return RestResponseBo.fail("请输入完整后评论");
        }

        if (StringUtils.isNotBlank(author) && author.length() > 50) {
            return RestResponseBo.fail("姓名过长");
        }

        if (StringUtils.isNotBlank(mail) && !TaleUtils.isEmail(mail)) {
            return RestResponseBo.fail("请输入正确的邮箱格式");
        }

        if (StringUtils.isNotBlank(url) && !PatternKit.isURL(url)) {
            return RestResponseBo.fail("请输入正确的URL格式");
        }

        if (text.length() > 200) {
            return RestResponseBo.fail("请输入200个字符以内的评论");
        }

        String val = IPKit.getIpAddrByRequest(request) + ":" + cid;
        Integer count = cache.hget(Types.COMMENTS_FREQUENCY.getType(), val);
        if (null != count && count > 0) {
            return RestResponseBo.fail("您发表评论太快了，请过会再试");
        }

        author = TaleUtils.cleanXSS(author);
        text = TaleUtils.cleanXSS(text);

        author = EmojiParser.parseToAliases(author);
        text = EmojiParser.parseToAliases(text);

        Comment comments = new Comment();
        comments.setAuthor(author);
        comments.setCid(cid);
        comments.setIp(request.getRemoteAddr());
        comments.setUrl(url);
        comments.setContent(text);
        comments.setMail(mail);
        comments.setStatus("not_audit");
        if(coid==null){
            comments.setParent(0);
        }else{
            comments.setParent(coid);
        }
        int time = DateKit.getCurrentUnixTime();
        comments.setCreated(time);
        try {
            String result = commentService.insertComment(comments);
            cookie("tale_remember_author", URLEncoder.encode(author, "UTF-8"), 7 * 24 * 60 * 60, response);
            cookie("tale_remember_mail", URLEncoder.encode(mail, "UTF-8"), 7 * 24 * 60 * 60, response);
            if (StringUtils.isNotBlank(url)) {
                cookie("tale_remember_url", URLEncoder.encode(url, "UTF-8"), 7 * 24 * 60 * 60, response);
            }
            // 设置对每个文章1分钟可以评论一次
            cache.hset(Types.COMMENTS_FREQUENCY.getType(), val, 1, 60);
            if (!WebConst.SUCCESS_RESULT.equals(result)) {
                return RestResponseBo.fail(result);
            }
            return RestResponseBo.ok();
        } catch (Exception e) {
            String msg = "评论发布失败";
            log.error(msg, e);
            return RestResponseBo.fail(msg);
        }
    }
    /**
     * 自定义页面,如关于的页面
     */
//    @GetMapping(value = "/{pagename}")
//    public String page(@PathVariable String pagename, HttpServletRequest request) {
//        ContentVo contents = contentService.getContents(pagename);
//        if (null == contents) {
//            return this.render_404();
//        }
//        if (contents.getAllowComment()) {
//            String cp = request.getParameter("cp");
//            if (StringUtils.isBlank(cp)) {
//                cp = "1";
//            }
//            PageInfo<CommentBo> commentsPaginator = commentService.getComments(contents.getCid(), Integer.parseInt(cp), 6);
//            request.setAttribute("comments", commentsPaginator);
//        }
//        request.setAttribute("article", contents);
//        if (!checkHitsFrequency(request, String.valueOf(contents.getCid()))) {
//            updateArticleHit(contents.getCid(), contents.getHits());
//        }
//        return this.render("page");
//    }

    /**
     * 设置cookie
     *
     * @param name
     * @param value
     * @param maxAge
     * @param response
     */
    private void cookie(String name, String value, int maxAge, HttpServletResponse response) {
        Cookie cookie = new Cookie(name, value);
        cookie.setMaxAge(maxAge);
        cookie.setSecure(false);
        response.addCookie(cookie);
    }

    /**
     * 检查同一个ip地址是否在2小时内访问同一文章
     *
     * @param request
     * @param cid
     * @return
     */
    private boolean checkHitsFrequency(HttpServletRequest request, String cid) {
        String val = IPKit.getIpAddrByRequest(request) + ":" + cid;
        Integer count = cache.hget(Types.HITS_FREQUENCY.getType(), val);
        if (null != count && count > 0) {
            return true;
        }
        cache.hset(Types.HITS_FREQUENCY.getType(), val, 1, WebConst.HITS_LIMIT_TIME);
        return false;
    }

}
