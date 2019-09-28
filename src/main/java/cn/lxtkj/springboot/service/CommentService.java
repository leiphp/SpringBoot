package cn.lxtkj.springboot.service;

import cn.lxtkj.springboot.constant.WebConst;
import cn.lxtkj.springboot.entity.Article;
import cn.lxtkj.springboot.entity.Comment;
import cn.lxtkj.springboot.mapper.CommentMapper;
import cn.lxtkj.springboot.utils.TaleUtils;
import cn.lxtkj.springboot.model.Vo.ContentVo;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentService {

    @Autowired
    private ArticleService articleService;
    @Autowired
    private CommentMapper commentMapper;

    public String insertComment(Comment comment){
        Article article = articleService.getArticle(comment.getCid());
        if (null == article) {
            return "不存在的文章";
        }
        int insertCommentResult = commentMapper.insert(comment.getCid(), comment.getCreated(), comment.getAuthor(), comment.getMail(), comment.getUrl(), comment.getIp(), comment.getContent(),comment.getParent());
        if(insertCommentResult==1){
            //更新文章评论条数
            articleService.updateCommentNum(comment.getCid(),article.getComments_num() + 1);
            return "SUCCESS";
        }
        return "FAILURE";
    }

    public PageInfo<Comment> getCommentList(String type, int page, int pageSize, String sort){
        //mysql查询limit
        //pageHelper 帮我们生产分页语句
        PageHelper.startPage(page, pageSize);
        List<Comment> listArticle = commentMapper.list(type, sort);
        //返回给客户端展示
        PageInfo<Comment> pageInfoArticleList = new PageInfo<Comment>(listArticle);
        return pageInfoArticleList;
    }
    public String publish(Comment comment){
        if (null == comment) {
            return "评论对象为空";
        }
        if (StringUtils.isBlank(comment.getAuthor())) {
            comment.setAuthor("热心网友");
        }
        if (StringUtils.isNotBlank(comment.getMail()) && !TaleUtils.isEmail(comment.getMail())) {
            return "请输入正确的邮箱格式";
        }
        if (StringUtils.isBlank(comment.getContent())) {
            return "评论内容不能为空";
        }
        if (comment.getContent().length() < 5 || comment.getContent().length() > 2000) {
            return "评论字数在5-2000个字符";
        }
        if (null == comment.getCid()) {
            return "评论文章不能为空";
        }
        Article article = articleService.getArticle(comment.getCid());
        if (null == article) {
            return "不存在的文章";
        }
        int insertArticleResult = commentMapper.insert(comment.getCid(), comment.getCreated(), comment.getAuthor(), comment.getMail(), comment.getUrl(), comment.getIp(), comment.getContent(),comment.getParent());
        if(insertArticleResult==1){
            return WebConst.SUCCESS_RESULT;
        }else{
            return WebConst.FAILURE_RESULT;
        }
//        return insertArticleResult;
    }
    public Comment getCommentById(Integer coid){
        Comment comment = commentMapper.selectByCoid(coid);
       return comment;

    }
    //获取categories所有文章
    public PageInfo<Comment> getCommentById(int page, int pageSize, int cid){
        //mysql查询limit
        //pageHelper 帮我们生产分页语句
        PageHelper.startPage(page, pageSize);
        List<Comment> listArticle = commentMapper.selectByCid(cid);
        //返回给客户端展示
        PageInfo<Comment> pageInfoArticleList = new PageInfo<Comment>(listArticle);
        return pageInfoArticleList;
    }

    public String updateComment(Comment comment){
        int insertArticleResult = commentMapper.update(comment.getCoid(),comment.getStatus());
        if(insertArticleResult==1){
            return WebConst.SUCCESS_RESULT;
        }else{
            return WebConst.FAILURE_RESULT;
        }

    }
    public String deleteByCoid(Integer coid){
        int result = commentMapper.delete(coid);
        if(result==1){
            return WebConst.SUCCESS_RESULT;
        }else{
            return WebConst.FAILURE_RESULT;
        }

    }
}
