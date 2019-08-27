package cn.lxtkj.springboot.service;

import cn.lxtkj.springboot.constant.WebConst;
import cn.lxtkj.springboot.entity.Article;
import cn.lxtkj.springboot.mapper.ArticleMapper;
import cn.lxtkj.springboot.model.Vo.ContentVo;
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

    public int insertArticle(String title, String tags, String content, Integer author_id, String categories, Integer created, Integer modified){
        int insertArticleResult = articleMapper.insert(title, tags, content, author_id, categories,created, modified);
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
        int insertArticleResult = articleMapper.insert(contents.getTitle(), contents.getTags(), contents.getContent(), contents.getAuthorId(), contents.getCategories(), contents.getCreated(), contents.getModified());
        if(insertArticleResult==1){
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
        int insertArticleResult = articleMapper.update(contents.getCid(),contents.getTitle(), contents.getTags(), contents.getContent(), contents.getCategories(), contents.getModified());
        if(insertArticleResult==1){
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
}
