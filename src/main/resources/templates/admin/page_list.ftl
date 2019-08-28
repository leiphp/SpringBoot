<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org" th:with="title='页面管理',active='page'">
<#--<header th:replace="admin/header::headerFragment(${title},${active})"></header>-->
<#assign title = "页面管理">
<#include "head.ftl">
<body class="fixed-left">
<div id="wrapper">
    <#--<div th:replace="admin/header::header-body"></div>-->
    <#include "header-body.ftl">
    <div class="content-page">
        <div class="content">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <h4 class="page-title">页面管理</h4>
                    </div>
                    <div class="col-md-12">
                        <div class="pull-right">
                            <a href="/admin/page/new" class="btn btn-success waves-effect waves-light m-b-5">添加新页面</a>
                        </div>
                        <table class="table table-striped table-bordered">
                            <thead>
                            <tr>
                                <th>页面名称</th>
                                <th>页面路径</th>
                                <th width="20%">发布时间</th>
                                <th width="12%">发布状态</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <#--<th:block th:each="post : ${articles.list}">-->
                                <#list articles.list as post>
                                <tr cid=${post.cid}>
                                    <td>${post.title}</td>
                                    <td>${post.slug}</td>
                                    <td>${(post.created*1000)?number_to_datetime}</td>
                                    <td>
                                        <#if post.status == 'publish'>
                                            <span class="label label-success">已发布</span>
                                        </#if>
                                        <#if post.status == 'draft'>
                                            <span class="label label-default">草稿</span>
                                        </#if>
                                    </td>
                                    <td>
                                        <a href="/admin/page/${post.cid}" class="btn btn-primary btn-sm waves-effect waves-light m-b-5"><i class="fa fa-edit"></i> <span>编辑</span></a>
                                        <a href="javascript:void(0)" onclick="delPost(${post.cid});" class="btn btn-danger btn-sm waves-effect waves-light m-b-5"><i class="fa fa-trash-o"></i> <span>删除</span></a>
                                        <a class="btn btn-warning btn-sm waves-effect waves-light m-b-5" href="/${post.slug}" target="_blank"><i class="fa fa-rocket"></i> <span>预览</span></a>
                                    </td>
                                </tr>
                            <#--</th:block>-->
                                </#list>
                            </tbody>
                        </table>
                    </div>
                </div>
                <#--<div th:replace="admin/footer :: footer-content"></div>-->
                <#include "footer-content.ftl">
            </div>
        </div>
    </div>
</div>
<#--<div th:replace="admin/footer :: footer"></div>-->
<#include "footer-content.ftl">
<#include "footer.ftl">
<script type="text/javascript">
    /*<![CDATA[*/
    var tale = new $.tale();
    function delPost(cid) {
        tale.alertConfirm({
            title:'确定删除这个页面吗?',
            then: function () {
                tale.post({
                    url : '/admin/page/delete',
                    data: {cid: cid},
                    success: function (result) {
                        if(result && result.success){
                            tale.alertOkAndReload('页面删除成功');
                        } else {
                            tale.alertError(result.msg || '页面删除失败');
                        }
                    }
                });
            }
        });
    }
    /*]]>*/
</script>
</body>
</html>