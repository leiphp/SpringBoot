<!DOCTYPE html>
<html lang="en">
<#--<header th:replace="admin/header::headerFragment(${title},${active})"></header>-->
<#assign title = "保存页面" active ="page">
<#include "head.ftl">
<link href="/admin/plugins/toggles/toggles.css" rel="stylesheet"/>
<link href="/admin/plugins/md/css/style.css" rel="stylesheet"/>


<body class="fixed-left">
<div id="wrapper">
    <#--<div th:replace="admin/header::header-body"></div>-->
    <#include "header-body.ftl">
    <div class="content-page">
        <div class="content">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <h4 class="page-title">
                            <#--判断不为null-->
                            <#if contents??>
                                编辑页面
                            <#else>
                                发布新页面
                            </#if>
                            <#--<th:block th:if="${null != contents}">-->
                                <#--编辑页面-->
                            <#--</th:block>-->
                            <#--<th:block th:unless="${null != contents}">-->
                                <#--发布新页面-->
                            <#--</th:block>-->
                        </h4>
                    </div>
                    <div class="col-md-12">
                        <form id="articleForm" role="form" novalidate="novalidate">
                            <input type="hidden" name="categories" id="categories"/>
                            <#if contents??>
                                <input type="hidden" name="cid" value="${contents.cid}" id="cid"/>
                            <#else>
                                <input type="hidden" name="cid" value="" id="cid"/>
                            </#if>
                            <#if contents??>
                                <input type="hidden" name="status" value="${contents.status}" id="status"/>
                            <#else>
                                <input type="hidden" name="status" value="publish" id="status"/>
                            </#if>
                            <input type="hidden" name="content" id="content-editor"/>

                            <div class="form-group">
                                <#if contents??>
                                    <input type="text" class="form-control" placeholder="请输入页面标题" name="title" required="" aria-required="true"  value="${contents.title}"/>
                                <#else>
                                    <input type="text" class="form-control" placeholder="请输入页面标题" name="title" required="" aria-required="true"  value=""/>
                                </#if>
                            </div>

                            <div class="form-group">
                                <#if contents??>
                                    <input type="text" class="form-control" placeholder="请输入页面访问名" name="slug" required="" aria-required="true" value="${contents.slug}"/>
                                <#else>
                                    <input type="text" class="form-control" placeholder="请输入页面访问名" name="slug" required="" aria-required="true" value=""/>
                                </#if>
                            </div>

                            <div class="form-group">
                                <textarea style="height: 450px" autocomplete="off" id="text" name="text" class="markdown-textarea" utext=""></textarea>
                                <#--<#if contents??>-->
                                    <#--<textarea style="height: 450px" autocomplete="off" id="text" name="text" class="markdown-textarea" utext="${contents.content}"></textarea>-->
                                <#--<#else>-->
                                    <#--<textarea style="height: 450px" autocomplete="off" id="text" name="text" class="markdown-textarea" utext=""></textarea>-->
                                <#--</#if>-->
                            </div>

                            <div class="text-right">
                                <button type="submit" class="btn btn-primary waves-effect waves-light">保存页面</button>
                                <button type="submit" class="btn btn-warning waves-effect waves-light">存为草稿</button>
                            </div>
                        </form>
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
<script src="/admin/plugins/md/js/jquery.scrollto.js"></script>
<script src="/admin/plugins/md/js/pagedown.js"></script>
<script src="/admin/plugins/md/js/pagedown-extra.js"></script>
<script src="/admin/plugins/md/js/diff.js"></script>
<script src="/admin/plugins/md/js/md.js"></script>

<script src="http://cdn.bootcss.com/jquery-toggles/2.0.4/toggles.min.js"></script>
<script src="http://cdn.bootcss.com/jquery-validate/1.15.1/jquery.validate.min.js"></script>
<script src="http://cdn.bootcss.com/jquery-validate/1.15.1/localization/messages_zh.min.js"></script>
<script type="text/javascript">
    /*<![CDATA[*/
    var tale = new $.tale();
    // validate the comment form when it is submitted
    $('#articleForm').validate({
        submitHandler: function (form) {
            $('#content-editor').val($('#text').val());
            $("#articleForm #categories").val($('#multiple-sel').val());
            var params = $("#articleForm").serialize();
            var url = $('#articleForm #cid').val() != '' ? '/admin/page/modify' : '/admin/page/publish';

            tale.post({
                url:url,
                data:params,
                success: function (result) {
                    if (result && result.success) {
                        tale.alertOk({
                            text:'页面保存成功',
                            then: function () {
                                setTimeout(function () {
                                    window.location.href = '/admin/page';
                                }, 500);
                            }
                        });
                    } else {
                        tale.alertError(result.msg || '页面文章失败');
                    }
                }
            });
        }
    });

    var textarea = $('#text'),
        toolbar = $('<div class="markdown-editor" id="md-button-bar" />').insertBefore(textarea.parent())
    preview = $('<div id="md-preview" class="md-hidetab" />').insertAfter('.markdown-editor');

    markdown(textarea, toolbar, preview);
    /*]]>*/
</script>

</body>
</html>