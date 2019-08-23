<!DOCTYPE html>
<html lang="en">
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
                        <h4 class="page-title">文章管理</h4>
                    </div>
                    <div class="col-md-12">
                        <table class="table table-striped table-bordered">
                            <thead>
                            <tr>
                                <th width="35%">文章标题</th>
                                <th width="15%">发布时间</th>
                                <th>浏览量</th>
                                <th>所属分类</th>
                                <th width="8%">发布状态</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <#--<block each="post : ${articles.list}">-->
                                <#list articles.list as post>
                                <tr id=${post.cid}>
                                    <td>
                                        <a href="/admin/article/+${post.cid}" >${post.title}</a>
                                    </td>
                                    <td> ${post.created}</td>

                                    <td>${post.hits}</td>
                                    <#--<td>${post.categories}</td>-->
                                    <td>00</td>
                                    <td>
                                        <#if post.status == 'publish'>
                                            <span class="label label-success">已发布</span>
                                        </#if>
                                       <#if post.status == 'draft'>
                                           <span class="label label-default">草稿</span>
                                       </#if>
                                    </td>
                                    <td>
                                        <a href="{'/admin/article/'+${post.cid}}"
                                           class="btn btn-primary btn-sm waves-effect waves-light m-b-5"><i
                                                class="fa fa-edit"></i> <span>编辑</span></a>
                                        <a href="javascript:void(0)" onclick="'delPost('+${post.cid}+');'"
                                           class="btn btn-danger btn-sm waves-effect waves-light m-b-5"><i
                                                class="fa fa-trash-o"></i> <span>删除</span></a>
                                        <a class="btn btn-warning btn-sm waves-effect waves-light m-b-5" href="/article/${post.cid}/preview"
                                           target="_blank"><i
                                                class="fa fa-rocket"></i> <span>预览</span></a>
                                    </td>
                                </tr>
                                </#list>
                            <#--</block>-->

                            </tbody>
                        </table>
                        <div replace="comm/macros :: pageAdminNav(${articles})"></div>
                    </div>
                </div>
                <#--<div replace="admin/footer :: footer-content"></div>-->
                <#include "footer-content.ftl">
            </div>
        </div>
    </div>
</div>
<#--<div replace="admin/footer :: footer"></div>-->
<#include "footer-content.ftl">
<#include "footer.ftl">
<script type="text/javascript">
    /*<![CDATA[*/
    var tale = new $.tale();
    function delPost(cid) {
        tale.alertConfirm({
            title:'确定删除该文章吗?',
            then: function () {
                tale.post({
                    url : '/admin/article/delete',
                    data: {cid: cid},
                    success: function (result) {
                        if(result && result.success){
                            tale.alertOkAndReload('文章删除成功');
                        } else {
                            tale.alertError(result.msg || '文章删除失败');
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