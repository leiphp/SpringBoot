package cn.lxtkj.springboot.service;

import cn.lxtkj.springboot.constant.WebConst;
import cn.lxtkj.springboot.entity.Article;
import cn.lxtkj.springboot.mapper.ArticleMapper;
import cn.lxtkj.springboot.model.Vo.ContentVo;
import cn.lxtkj.springboot.dto.Types;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ArticleService {
    @Autowired
    private ArticleMapper articleMapper;
    @Autowired
    private MetasService metasService;

    public int insertArticle(String title, String slug, String tags, String description, String content, Integer author_id, String type, String categories, Integer created, Integer modified){
        int insertArticleResult = articleMapper.insert(title, slug, tags, description, content, author_id, type, categories,created, modified);
        return insertArticleResult;
    }

    public PageInfo<Article> findArticleList(String type, int page, int pageSize, String sort){
        //mysql查询limit
        //pageHelper 帮我们生产分页语句
        PageHelper.startPage(page, pageSize);
        List<Article> listArticle = articleMapper.findArticleList(type, sort);
        //返回给客户端展示
        PageInfo<Article> pageInfoArticleList = new PageInfo<Article>(listArticle);
        return pageInfoArticleList;
    }
    public String publish(ContentVo contents){
        if (null == contents) {
            return "文章对象为空";
        }
        if (StringUtils.isBlank(contents.getTitle())) {
            return "文章标题不能为空";
        }
        if (StringUtils.isBlank(contents.getContent())) {
            return "文章内容不能为空";
        }
        int titleLength = contents.getTitle().length();
        if (titleLength > WebConst.MAX_TITLE_COUNT) {
            return "文章标题过长";
        }
        int contentLength = contents.getContent().length();
        if (contentLength > WebConst.MAX_TEXT_COUNT) {
            return "文章内容过长";
        }
        if (null == contents.getAuthorId()) {
            return "请登录后发布文章";
        }
        if (StringUtils.isNotBlank(contents.getSlug())) {
            if (contents.getSlug().length() < 5) {
                return "路径太短了";
            }
            long count = 0;
            if (count > 0) return "该路径已经存在，请重新输入";
        } else {
            contents.setSlug(null);
        }
        int insertArticleResult = articleMapper.insert(contents.getTitle(),contents.getSlug(), contents.getTags(), contents.getDescription(), contents.getContent(), contents.getAuthorId(),contents.getType(), contents.getCategories(), contents.getCreated(), contents.getModified());
        if(insertArticleResult==1){
            metasService.saveMetas(contents.getCid(), contents.getTags(), Types.TAG.getType());
//撤销            metasService.saveMetas(contents.getCid(), contents.getCategories(), Types.CATEGORY.getType());
            return WebConst.SUCCESS_RESULT;
        }else{
            return WebConst.FAILURE_RESULT;
        }
//        return insertArticleResult;
    }
    public Article getArticle(Integer cid){
        Article article = articleMapper.selectByCid(cid);
       return article;

    }
    public Article getNextArticle(Integer cid){
        Article article = articleMapper.selectNextByCid(cid);
        return article;

    }
    public Article getPrevArticle(Integer cid){
        Article article = articleMapper.selectPrevByCid(cid);
        return article;

    }
    public String updateArticle(ContentVo contents){
        if (null == contents) {
            return "文章对象为空";
        }
        if (StringUtils.isBlank(contents.getTitle())) {
            return "文章标题不能为空";
        }
        if (StringUtils.isBlank(contents.getContent())) {
            return "文章内容不能为空";
        }
        int titleLength = contents.getTitle().length();
        if (titleLength > WebConst.MAX_TITLE_COUNT) {
            return "文章标题过长";
        }
        int contentLength = contents.getContent().length();
        if (contentLength > WebConst.MAX_TEXT_COUNT) {
            return "文章内容过长";
        }
        if (null == contents.getAuthorId()) {
            return "请登录后发布文章";
        }
        int insertArticleResult = articleMapper.update(contents.getCid(),contents.getTitle(), contents.getTags(), contents.getDescription(), contents.getContent(), contents.getCategories(), contents.getModified());
        if(insertArticleResult==1){
            metasService.saveMetas(contents.getCid(), contents.getTags(), Types.TAG.getType());
            metasService.saveMetas(contents.getCid(), contents.getCategories(), Types.CATEGORY.getType());
            return WebConst.SUCCESS_RESULT;
        }else{
            return WebConst.FAILURE_RESULT;
        }

    }
    public String deleteByCid(Integer cid){
        int deleteArticleResult = articleMapper.delete(cid);
        if(deleteArticleResult==1){
            return WebConst.SUCCESS_RESULT;
        }else{
            return WebConst.FAILURE_RESULT;
        }

    }
    //更新文章评论数
    public String updateCommentNum(Integer cid, Integer comments_num){
        int insertResult = articleMapper.updateCommentNum(cid,comments_num);
        if(insertResult==1){
            return WebConst.SUCCESS_RESULT;
        }else{
            return WebConst.FAILURE_RESULT;
        }
    }
    //获取最新7条数据
    public List<Article> getNewArticleList(int limit){
        //mysql查询limit
        List<Article> listArticle = articleMapper.getRecentList(limit);
        return listArticle;
    }

    //获取最新6条数据
    public List<Article> getLikeArticleList(){
        //mysql查询limit
        List<Article> listArticle = articleMapper.selectLike();
        return listArticle;
    }

    //获取点击量最高的6条数据
    public List<Article> getTophitArticleList(int limit){
        //mysql查询limit
        List<Article> listArticle = articleMapper.getTophitList(limit);
        return listArticle;
    }

    //获取站长推荐的6条数据
    public List<Article> getRecommendArticleList(int limit){
        //mysql查询limit
        List<Article> listArticle = articleMapper.getRecommList(limit);
        return listArticle;
    }

    //获取tag所有文章
    public PageInfo<Article> getArticleByTag(int page, int pageSize, String tag){
        //mysql查询limit
        //pageHelper 帮我们生产分页语句
        PageHelper.startPage(page, pageSize);
        List<Article> listArticle = articleMapper.getTagArticleList(tag);
        //返回给客户端展示
        PageInfo<Article> pageInfoArticleList = new PageInfo<Article>(listArticle);
        return pageInfoArticleList;
    }
    //获取categories所有文章
    public PageInfo<Article> getArticleByCategories(int page, int pageSize, String categories){
        //mysql查询limit
        //pageHelper 帮我们生产分页语句
        PageHelper.startPage(page, pageSize);
        List<Article> listArticle = articleMapper.getCategoriesArticleList(categories);
        //返回给客户端展示
        PageInfo<Article> pageInfoArticleList = new PageInfo<Article>(listArticle);
        return pageInfoArticleList;
    }
}
