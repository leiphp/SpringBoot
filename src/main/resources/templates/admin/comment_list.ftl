<!DOCTYPE html>
<html lang="en" >
<#--<header th:replace="admin/header::headerFragment(${title},${active})"></header>-->
<#assign title = "评论管理" active="comments">
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
                        <h4 class="page-title">评论管理</h4>
                    </div>
                    <div class="col-md-12">
                        <table class="table table-striped table-bordered">
                            <thead>
                            <tr>
                                <th>评论内容</th>
                                <th>评论人</th>
                                <th>评论时间</th>
                                <th>评论人邮箱</th>
                                <th>评论人网址</th>
                                <th>评论状态</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <#list comments.list as comment>
                            <#--<th:block th:each="comment : ${comments.list}">-->
                                <tr cid=${comment.coid}>
                                    <td>
                                        <a href="/article/${comment.cid}#comments" target="_blank" >${comment.content}</a>
                                    </td>
                                    <td >${comment.author}</td>
                                    <td >${(comment.created*1000)?number_to_datetime}</td>
                                    <td >${comment.mail}</td>
                                    <td><a href="${comment.url}" target="_blank" >${comment.url}</a>
                                    </td>
                                    <td>
                                        <#if comment.status == 'approved'>
                                            <span class="label label-success">审核通过</span>
                                        </#if>
                                        <#if comment.status == 'not_audit'>
                                            <span class="label label-default">未审核</span>
                                        </#if>
                                    </td>
                                    <td>
                                        <#if comment.status == 'not_audit'>
                                            <a href="javascript:void(0)"
                                               onclick="updateStatus(${comment.coid});" class="btn btn-success btn-sm waves-effect waves-light m-b-5"><i class="fa fa-check-square-o"></i>
                                                <span>通过</span>
                                            </a>
                                        </#if>
                                        <a href="javascript:void(0)" onclick="delComment(${comment.coid});" class="btn btn-danger btn-sm waves-effect waves-light m-b-5"><i class="fa fa-trash-o"></i>
                                            <span>删除</span>
                                        </a>
                                    </td>
                                </tr>
                            <#--</th:block>-->
                            </#list>
                            </tbody>
                        </table>
                        <#--<div th:replace="comm/macros :: pageAdminNav(${comments})"></div>-->
                        <#include "/comm/page.ftl">
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

    function delComment(coid) {
        tale.alertConfirm({
            title: '确定删除该评论吗?',
            then: function () {
                tale.post({
                    url: '/admin/comments/delete',
                    data: {coid: coid},
                    success: function (result) {
                        if (result && result.success) {
                            tale.alertOkAndReload('评论删除成功');
                        } else {
                            tale.alertError(result.msg || '评论删除失败');
                        }
                    }
                });
            }
        });
    }

    function updateStatus(coid) {
        tale.alertConfirm({
            title: '确定审核通过吗?',
            then: function () {
                tale.post({
                    url: '/admin/comments/status',
                    data: {coid: coid, status: "approved"},
                    success: function (result) {
                        if (result && result.success) {
                            tale.alertOkAndReload('评论状态设置成功');
                        } else {
                            tale.alertError(result.msg || '评论设置失败');
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