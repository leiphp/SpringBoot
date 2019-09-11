<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org" th:with="title='个人设置',active='home'">
<#--<header th:replace="admin/header::headerFragment(${title},${active})"></header>-->
<#assign title = "个人设置" active="home">
<#include "head.ftl">
<body>
<div id="wrapper">
    <#include "header-body.ftl">
    <div class="content-page">
        <div class="content">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <h4 class="page-title">个人设置</h4>
                    </div>

                    <div class="col-md-6">
                        <div class="panel panel-color panel-primary">
                            <div class="panel-heading">
                                <h3 class="panel-title">个人信息</h3>
                            </div>
                            <div class="panel-body">
                                <form class="form-horizontal" role="form" id="user-form">
                                    <div class="form-group">
                                        <label class="col-md-3 control-label">账号</label>
                                        <div class="col-md-9">
                                            <input type="text" value="${session.login_user.username}" class="form-control"  readonly="readonly" disabled="disabled"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-3 control-label">姓名</label>
                                        <div class="col-md-9">
                                            <input type="text" class="form-control" name="screenName" placeholder="输入您的姓名"
                                                   value="${session.login_user.screenName}" required="required" aria-required="true"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-3 control-label">邮箱</label>
                                        <div class="col-md-9">
                                            <input type="text" class="form-control" name="email" placeholder="输入您的邮箱"
                                                   value="${session.login_user.email}" required="required" aria-required="true"/>
                                        </div>
                                    </div>
                                    <div class="clearfix pull-right">
                                        <button type="button" class="btn btn-primary waves-effect waves-light" onclick="saveSetting()">
                                            保存信息
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="panel panel-color panel-danger">
                            <div class="panel-heading">
                                <h3 class="panel-title">修改密码</h3>
                            </div>
                            <div class="panel-body">
                                <form class="form-horizontal" role="form" id="pwd-form">
                                    <div class="form-group">
                                        <label class="col-md-3 control-label">输入旧密码</label>
                                        <div class="col-md-9">
                                            <input type="password" class="form-control" name="oldPassword" required="required"
                                                   aria-required="true"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-3 control-label">输入新密码</label>
                                        <div class="col-md-9">
                                            <input type="password" name="password" id="password1" class="form-control" required="required"
                                                   aria-required="true" rangelength="[6,14]"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-3 control-label">确认新密码</label>
                                        <div class="col-md-9">
                                            <input type="password" name="repass" class="form-control" equalTo="#password1"/>
                                        </div>
                                    </div>
                                    <div class="clearfix pull-right">
                                        <button type="submit" class="btn btn-danger waves-effect waves-light">
                                            设置密码
                                        </button>
                                    </div>
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
<#include "footer-content.ftl">
<#include "footer.ftl">
<script src="http://cdn.bootcss.com/jquery-validate/1.15.1/jquery.validate.min.js"></script>
<script src="http://cdn.bootcss.com/jquery-validate/1.15.1/localization/messages_zh.min.js"></script>
<script type="text/javascript">
    /*<![CDATA[*/
    var tale = new $.tale();

    /**
     * 保存个人信息
     */
    function saveSetting() {
        var param = $('#user-form').serialize();
        tale.post({
            url : '/admin/profile',
            data: param,
            success: function (result) {
                if(result && result.success){
                    tale.alertOk('保存成功');
                } else {
                    tale.alertError(result.msg || '保存失败');
                }
            }
        });
    }

    $('#pwd-form').validate({
        submitHandler: function (form) {
            var params = $("#pwd-form").serialize();
            tale.post({
                url : '/admin/password',
                data: params,
                success: function (result) {
                    if(result && result.success){
                        tale.alertOk('密码修改成功');
                    } else {
                        tale.alertError(result.msg || '密码修改失败');
                    }
                }
            });
        }
    });
    /*]]>*/
</script>
</body>
</html>