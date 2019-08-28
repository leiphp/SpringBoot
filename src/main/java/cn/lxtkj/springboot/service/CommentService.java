package cn.lxtkj.springboot.service;

import cn.lxtkj.springboot.constant.WebConst;
import cn.lxtkj.springboot.entity.Comment;
import cn.lxtkj.springboot.mapper.CommentMapper;
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
    private CommentMapper commentMapper;

    public int insert(String title, String slug, String tags, String content, Integer author_id, String type, String categories, Integer created, Integer modified){
        int insertArticleResult = commentMapper.insert(title, slug, tags, content, author_id, type, categories,created, modified);
        return insertArticleResult;
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
        int insertArticleResult = commentMapper.insert(contents.getTitle(),contents.getSlug(), contents.getTags(), contents.getContent(), contents.getAuthorId(),contents.getType(), contents.getCategories(), contents.getCreated(), contents.getModified());
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
