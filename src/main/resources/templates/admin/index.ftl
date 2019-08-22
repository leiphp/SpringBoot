<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org" with="title='管理中心',active='home'">
<#--<header replace="admin/header::headerFragment(${title},${active})"></header>-->
<#include "head.ftl">
<body class="fixed-left">
<div id="wrapper">
    <#--<div replace="admin/header::header-body"></div>-->
    <#include "header-body.ftl">
    
    <div class="content-page">
        <div class="content">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <h4 class="page-title">仪表盘</h4>
                    </div>

                    <div class="row">
                        <div class="col-sm-6 col-lg-3">
                            <div class="mini-stat clearfix bx-shadow bg-info">
                                <span class="mini-stat-icon"><i class="fa fa-quote-right" aria-hidden="true"></i></span>
                                <div class="mini-stat-info text-right">
                                    发表了<span class="counter" text="${statistics.articles}"></span>篇文章
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-lg-3">
                            <div class="mini-stat clearfix bg-purple bx-shadow">
                                <span class="mini-stat-icon"><i class="fa fa-comments-o" aria-hidden="true"></i></span>
                                <div class="mini-stat-info text-right">
                                    收到了<span class="counter" text="${statistics.comments}"></span>条留言
                                </div>
                            </div>
                        </div>

                        <div class="col-sm-6 col-lg-3">
                            <div class="mini-stat clearfix bg-success bx-shadow">
                                <span class="mini-stat-icon"><i class="fa fa-cloud-upload"
                                                                aria-hidden="true"></i></span>
                                <div class="mini-stat-info text-right">
                                    上传了<span class="counter" text="${statistics.attachs}"></span>个附件
                                </div>
                            </div>
                        </div>

                        <div class="col-sm-6 col-lg-3">
                            <div class="mini-stat clearfix bg-primary bx-shadow">
                                <span class="mini-stat-icon"><i class="fa fa-link" aria-hidden="true"></i></span>
                                <div class="mini-stat-info text-right">
                                    友链了<span class="counter" text="${statistics.links}"></span>个好友
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-4">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">最新文章</h4>
                                </div>
                                <div class="panel-body">
                                    <ul class="list-group">
                                        <li class="list-group-item" each="article : ${articles}">
                            <span class="badge badge-primary"
                                  title="${article.commentsNum}+'条评论'" text="${article.commentsNum}"></span>
                                            <a target="_blank" href="${commons.site_url('/article/')}+${article.cid}"
                                               text="${article.title}"></a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">最新留言</h4>
                                </div>
                                <div class="panel-body">
                                    <div >
                                        <div class="alert alert-warning">
                                            还没有收到留言.
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">系统日志</h4>
                                </div>
                                <div class="panel-body">
                                    <ul class="list-group" >
                                        <#--<li class="list-group-item" each="log : ${logs}">-->
                                            <#--<span text="${commons.fmtdate(log.created, 'yyyy-MM-dd HH:mm:ss')} +' => '+ ${log.action}"></span>-->
                                        <#--</li>-->
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <#--<div replace="admin/footer :: footer-content"></div>-->
                <#include "footer-content.ftl">
            </div>
        </div>
    </div>
</div>
<#--<div replace="admin/footer :: footer"></div>-->
<#include "footer.ftl">
</body>
</html>