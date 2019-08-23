package cn.lxtkj.springboot.service;

import cn.lxtkj.springboot.entity.Article;
import cn.lxtkj.springboot.mapper.ArticleMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ArticleService {
    @Autowired
    private ArticleMapper articleMapper;

    public int insertArticle(String title, Integer slug, String content){
        int insertArticleResult = articleMapper.insert(title, slug, content);
        return insertArticleResult;
    }

    public PageInfo<Article> findArticleList(int page, int pageSize){
        //mysql查询limit
        //pageHelper 帮我们生产分页语句
        PageHelper.startPage(page, pageSize);
        List<Article> listArticle = articleMapper.findArticleList();
        //返回给客户端展示
        PageInfo<Article> pageInfoArticleList = new PageInfo<Article>(listArticle);
        return pageInfoArticleList;
    }
}
