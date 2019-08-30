<!DOCTYPE html>
<html lang="en">
<#--<header th:replace="admin/header::headerFragment(${title},${active})"></header>-->
<#assign title = "友链管理">
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
                        <h4 class="page-title">友链管理</h4>
                    </div>
                    <div class="col-md-12">
                        <table class="table table-striped table-bordered">
                            <thead>
                            <tr>
                                <th>链接名称</th>
                                <th>链接地址</th>
                                <th>链接LOGO</th>
                                <th>链接排序</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <#list links as link>
                                <tr mid=${link.mid}>
                                    <td>${link.name}</td>
                                    <td><a href="${link.slug}" target="_blank" >${link.slug}</a></td>
                                    <td >
                                        <#if link.description??>
                                            ${link.description}
                                        <#else>
                                        </#if>
                                    </td>
                                    <td >${link.sort}</td>
                                    <td>
                                        <a href="javascript:void(0)" onclick="editLink(this);"
                                           class="btn btn-primary btn-sm waves-effect waves-light m-b-5">
                                            <i class="fa fa-edit"></i> <span>编辑</span>
                                        </a>
                                        <a href="javascript:void(0)" onclick="delLink(${link.mid});"
                                           class="btn btn-danger btn-sm waves-effect waves-light m-b-5">
                                            <i class="fa fa-trash-o"></i> <span>删除</span></a>
                                    </td>
                                </tr>
                            </#list>
                            </tbody>
                        </table>
                    </div>
                    <div class="row">
                        <div class="col-md-12" style="padding: 20px;">
                            <div class="panel panel-primary">
                                <div class="panel-heading"><h3 class="panel-title">保存友链</h3></div>
                                <div class="panel-body">

                                    <form id="linkForm" class="form-inline" role="form" novalidate="novalidate">

                                        <input type="hidden" id="mid" name="mid"/>

                                        <div class="form-group">
                                            <label class="sr-only">链接标题</label>
                                            <input type="text" id="title" name="title" class="form-control" placeholder="请输入链接标题"
                                                   required="required" aria-required="true"/>
                                        </div>

                                        <div class="form-group">
                                            <label class="sr-only">链接URL</label>
                                            <input type="url" id="url" name="url" class="form-control" placeholder="请输入链接地址" required="required"
                                                   aria-required="true"/>
                                        </div>

                                        <div class="form-group">
                                            <label class="sr-only">链接LOGO</label>
                                            <input type="url" id="logo" name="logo" class="form-control"
                                                   placeholder="请输入链接LOGO，没有则不输入"/>
                                        </div>

                                        <div class="form-group">
                                            <label class="sr-only">链接排序</label>
                                            <input type="number" id="sort" name="sort" class="form-control" value="0"/>
                                        </div>

                                        <button type="submit" class="btn btn-success waves-effect waves-light m-l-10">保存链接</button>
                                    </form>
                                </div> <!-- panel-body -->
                            </div> <!-- panel -->
                        </div> <!-- col -->

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
<script src="http://cdn.bootcss.com/jquery-validate/1.15.1/jquery.validate.min.js"></script>
<script src="http://cdn.bootcss.com/jquery-validate/1.15.1/localization/messages_zh.min.js"></script>
<script type="text/javascript">
    /*<![CDATA[*/
    var tale = new $.tale();

    $('#linkForm').validate({
        submitHandler: function (form) {
            var params = $("#linkForm").serialize();
            tale.post({
                url : '/admin/links/save',
                data: params,
                success: function (result) {
                    $('#linkForm input').val('');
                    $('#linkForm #sort').val('0');
                    if(result && result.success){
                        tale.alertOkAndReload('友链保存成功');
                    } else {
                        tale.alertError(result.msg || '友链保存失败');
                    }
                }
            });
        }
    });

    function editLink(obj) {
        var this_ = $(obj);

        var mid = this_.parents('tr').attr('mid');
        var title = this_.parents('tr').find('td:eq(0)').text();
        var url = this_.parents('tr').find('td:eq(1)').text();
        var logo = this_.parents('tr').find('td:eq(2)').text();
        var sort = this_.parents('tr').find('td:eq(3)').text();

        $('#linkForm #mid').val(mid);
        $('#linkForm #title').val(title);
        $('#linkForm #url').val(url);
        $('#linkForm #logo').val(logo);
        $('#linkForm #sort').val(sort);
    }

    function delLink(mid) {
        tale.alertConfirm({
            title:'确定删除该链接吗?',
            then: function () {
                tale.post({
                    url : '/admin/links/delete',
                    data: {mid: mid},
                    success: function (result) {
                        if(result && result.success){
                            tale.alertOkAndReload('链接删除成功');
                        } else {
                            tale.alertError(result.msg || '链接删除失败');
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