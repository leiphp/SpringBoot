<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org" th:fragment="comments">
<body>
<div >
    <div class="comment-container">
        <div id="comments" class="clearfix">
            <#if article.allow_comment??>
            <div >
                <span class="response">
                     <#if Session.login_user??>
                        Hi，<a href="#" data-no-instant="" >${Session.login_user.username}</a>如果你想 <a href="/logout" title="注销" data-no-instant="">注销</a> ?
                     <#else>

                     </#if>
            </span>
                <form method="post" id="comment-form" class="comment-form" role="form"
                      onsubmit="return TaleComment.subComment();">
                    <input type="hidden" name="coid" id="coid"/>
                    <input type="hidden" name="cid" id="cid" value="${article.cid}"/>
                    <input type="hidden" name="_csrf_token" value="${_csrf_token}"/>
                    <input type="text" name="author" maxlength="12" id="author"
                           class="form-control input-control clearfix"
                           placeholder="姓名 (*)"
                    />
                    <input type="email" name="mail" id="mail" class="form-control input-control clearfix"
                           placeholder="邮箱 (*)"
                    />
                    <input type="url" name="url" id="url" class="form-control input-control clearfix"
                           placeholder="网址 (http://)"
                    />
                    <textarea name="text" id="textarea" class="form-control" placeholder="以上信息可以为空,评论不能为空哦!"
                              required="required" minlength="5"
                              maxlength="2000"></textarea>
                    <button type="submit" class="submit" id="misubmit">提交</button>
                </form>
            </div>
            <#else>
            <div >
                <span class="response">评论已关闭.${article.allow_comment}</span>
            </div>
            </#if>

            <#if comments??>
            <div >
                <ol class="comment-list">
                <#list comments.list as comment>
                        <li id="'li-comment-'+${comment.coid}" class="comment-body comment-parent comment-odd">
                            <div id="'comment-'+${comment.coid}">
                                <div class="comment-view" onclick="">
                                    <div class="comment-header">
                                        <!--设置get请求的参数-->
                                        <img class="avatar"src="${commons.gravatar(comment.mail)}" title="${comment.author}" width="80" height="80"/>
                                        <span class="comment-author">
                                            <a href="##" rel="external nofollow" >${comment.author}</a>
                                        </span>
                                    </div>
                                    <div class="comment-content">
                                        <span class="comment-author-at"></span>
                                        <p >${commons.article(comment.content)}</p>
                                    </div>
                                    <div class="comment-meta">
                                        <time class="comment-time" >${commons.fmtdate(comment.created)}</time>
                                        <span class="comment-reply"></span>
                                    </div>
                                </div>
                            </div>
                        </li>
                </#list>
                </ol>
                <div class="lists-navigator clearfix">
                    <ol class="page-navigator">
                        <#if comments.hasPreviousPage>
                            <li class="prev"><a href="?cp=${comments.prePage}#comments">←</a></li>
                        </#if>
                        <#list comments.navigatepageNums as navIndex>
                            <li class=${(comments.pageNum==navIndex)?string('current','')}><a href="?cp=${navIndex}#comments">${navIndex}</a></li>
                        </#list>
                        <#if comments.hasNextPage>
                            <li class="next"><a href="?cp=${comments.nextPage}#comments">→</a></li>
                        </#if>
                    </ol>
                </div>
            </div>
            </#if>
        </div>
    </div>
</div>
</body>
<#--<div th:replace="comm/tale_comment::tale_comment"></div>-->
<#include "/comm/tale_comment.ftl">
</html>