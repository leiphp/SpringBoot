<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org" th:with="title='分类管理',active='category'">
<#--<header th:replace="admin/header::headerFragment(${title},${active})"></header>-->
<#assign title = "分类管理">
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
                        <h4 class="page-title">分类/标签管理</h4>
                    </div>
                    <div class="col-md-6">
                        <div class="panel panel-color panel-primary">
                            <div class="panel-heading">
                                <h1 class="panel-title">分类列表</h1>
                            </div>
                            <div class="panel-body">
                                <#list categories as c>
                                <#--<th:block th:each="c : ${categories}">-->
                                    <div class="btn-group m-b-10">
                                        <#if c.name == '默认分类'>
                                            <button type="button" class="btn btn-${adminCommons.rand_color()} waves-effect waves-light">
                                                ${c.name}(${c.count})
                                            </button>
                                        <#else>
                                            <button type="button" class="'btn btn-${adminCommons.rand_color()} dropdown-toggle waves-effect waves-light'" data-toggle="dropdown" aria-expanded="false">
                                                ${c.name}(${c.count})
                                                <span class="caret"></span>
                                            </button>
                                            <ul class="dropdown-menu" role="menu">
                                                <li><a href="javascript:void(0)" mid=${c.mid} cname=${c.name} class="edit-category">修改</a></li>
                                                <li><a href="javascript:void(0)" mid=${c.mid} class="del-category">删除</a></li>
                                            </ul>
                                        </#if>
                                    </div>
                                <#--</th:block>-->
                                </#list>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="panel  panel-pink">
                            <div class="panel-heading">
                                <h1 class="panel-title">标签列表</h1>
                            </div>
                            <div class="panel-body">
                                <#list tags as c>
                                    <div class="btn-group m-b-10">
                                        <button type="button" class="btn btn-${adminCommons.rand_color()} dropdown-toggle waves-effect waves-light" data-toggle="dropdown" aria-expanded="false">
                                            ${c.name}(${c.count})
                                            <span class="caret"></span></button>
                                        <ul class="dropdown-menu" role="menu">
                                            <li><a href="javascript:void(0)" mid=${c.mid} class="del-category">删除</a></li>
                                        </ul>
                                    </div>

                                </#list>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <form id="cform" class="form-inline" role="form">
                                    <input type="hidden" id="mid"/>
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="cname" placeholder="请输入分类名称"/>
                                    </div>
                                    <button id="save-category-btn" type="button"
                                            class="btn btn-success waves-effect waves-light m-l-10">保存分类
                                    </button>
                                </form>
                            </div>
                        </div>
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

    $('#save-category-btn').click(function () {
        var cname = $('#cform #cname').val();
        var mid = $('#cform #mid').val();
        if (cname && cname != '') {
            tale.post({
                url: '/admin/category/save',
                data: {mid: mid, cname: cname},
                success: function (result) {
                    $('#cform #mid').val('');
                    $('#cform #cname').val('');
                    if (result && result.success) {
                        tale.alertOkAndReload('分类保存成功');
                    } else {
                        tale.alertError(result.msg || '分类保存失败');
                    }
                }
            });
        }
    });

    $('.edit-category').click(function () {
        var mid = $(this).attr('mid');
        var cname = $(this).attr('cname');
        $('#cform #mid').val(mid);
        $('#cform #cname').val(cname);
    });

    $('.del-category').click(function () {
        var mid = $(this).attr('mid');
        tale.alertConfirm({
            title: '确定删除该项吗?',
            then: function () {
                tale.post({
                    url: '/admin/category/delete',
                    data: {mid: mid},
                    success: function (result) {
                        if (result && result.success) {
                            tale.alertOkAndReload('删除成功');
                        } else {
                            tale.alertError(result.msg || '删除失败');
                        }
                    }
                });
            }
        });
    });
    /*]]>*/
</script>
</body>
</html>