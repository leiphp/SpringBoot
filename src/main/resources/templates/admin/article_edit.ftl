<!DOCTYPE html>
<html lang="en">
<#--<header replace="admin/header::headerFragment(${title},${active})"></header>-->
<#assign title = "保存文章">
<#include "head.ftl">
<link href="/admin/plugins/tagsinput/jquery.tagsinput.css" rel="stylesheet"/>
<link href="/admin/plugins/select2.dist.css/select2-bootstrap.css" rel="stylesheet"/>
<link href="/admin/plugins/toggles/toggles.css" rel="stylesheet"/>

<link href="http://cdn.bootcss.com/multi-select/0.9.12/css/multi-select.css" rel="stylesheet"/>
<link href="http://cdn.bootcss.com/select2/3.4.8/select2.min.css" rel="stylesheet"/>
<link href="/admin/plugins/md/css/style.css" rel="stylesheet"/>
<style>
    #tags_tagsinput {
        background-color: #fafafa;
        border: 1px solid #eeeeee;
    }
    #tags_addTag input {
        width: 100%;
    }
    #tags_addTag {
        margin-top: -5px;
    }
</style>
<body class="fixed-left">
<div id="wrapper">
    <#--<div replace="admin/header::header-body"></div>-->
    <#include "header-body.ftl">
    <div class="content-page">
        <div class="content">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <h4 class="page-title">
                            <#if contents??>
                                编辑文章
                            <#else>
                                发布文章
                            </#if>
                            <#--<block if="${null != contents">-->
                                <#--编辑文章-->
                            <#--</block>-->
                            <#--<block unless="${null != contents">-->
                                <#--发布文章-->
                            <#--</block>-->
                        </h4>
                    </div>
                    <div class="col-md-12">
                        <form id="articleForm" role="form" novalidate="novalidate">
                            <input type="hidden" name="categories" id="categories"/>
                            <input type="hidden" name="cid" <#if contents?? >value="${contents.cid}"<#else>value=""</#if> id="cid"/>
                            <input type="hidden" name="status" value="publish" id="status"/>
                            <input type="hidden" name="allowComment" value="true" id="allow_comment"/>
                            <input type="hidden" name="allowPing" value="true" id="allow_ping"/>
                            <input type="hidden" name="allowFeed" value="true" id="allow_feed"/>
                            <input type="hidden" name="content" id="content-editor"/>

                            <div class="form-group col-md-6" style="padding: 0 10px 0 0;">
                                <input type="text" class="form-control" placeholder="请输入文章标题（必须）" name="title" required="required" aria-required="true"
                                    <#if contents??>
                                        value="${contents.title}"
                                    <#else>
                                        value=""
                                    </#if>
                                />
                            </div>

                            <div class="form-group col-md-6" style="padding: 0 0 0 10px;">
                                <input type="text" class="form-control"
                                       placeholder="自定义访问路径，如：my-first-article  默认为文章id" name="slug"
                                        <#if contents?? && contents.slug??>
                                            value="${contents.slug}"
                                        <#else>
                                            value=""
                                        </#if>
                                />
                            </div>

                            <div class="form-group col-md-6" style="padding: 0 10px 0 0;">
                                <input name="tags" id="tags" type="text" class="form-control" placeholder="请填写文章标签"
                                        <#if contents?? && contents.tags??>
                                            value="${contents.tags}"
                                        <#else>
                                            value=""
                                        </#if>
                                />
                            </div>

                            <div class="form-group col-md-6">
                                <select id="multiple-sel" class="select2 form-control" multiple="multiple" data-placeholder="请选择分类..." tabindex="-1">
                                    <#if categories??>
                                        <#list categories as c>

                                            <option value=${c.name}
                                                    <#--<#if contents.categories == c.name>-->
                                                     <#--selected="true"-->
                                                    <#--<#else>-->
                                                     <#--selected="false"-->
                                                    <#--</#if>-->
                                            >
                                                ${c.name}
                                            </option>

                                        </#list>
                                    <#else>
                                        <option value="默认分类" selected="selected">默认分类</option>
                                    </#if>
                                </select>
                            </div>
                            <div class="clearfix"></div>
                            <div class="form-group">
                                <textarea style="height: 450px" autocomplete="off" id="text" name="text" class="markdown-textarea"><#if contents?? && contents.content??>${contents.content}<#else></#if></textarea>
                            </div>

                            <div class="form-group col-md-3 col-sm-4">
                                <label class="col-sm-4">开启评论</label>
                                <div class="col-sm-8">
                                    <div class="toggle toggle-success allow-true" onclick="allow_comment(this);" style="height: 20px; width: 50px;">
                                        <div class="toggle-slide active">
                                            <div class="toggle-inner" style="width: 80px; margin-left: 0px;">
                                                <div class="toggle-on active" style="height: 20px; width: 40px; text-align: center; text-indent: -10px; line-height: 20px;">开启</div>
                                                <div class="toggle-blob" style="height: 20px; width: 20px; margin-left: -10px;"></div>
                                                <div class="toggle-off" style="height: 20px; width: 40px; margin-left: -10px; text-align: center; text-indent: 10px; line-height: 20px;">关闭</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group col-md-3 col-sm-4">
                                <label class="col-sm-4">允许Ping</label>
                                <div class="col-sm-8">
                                    <div class="toggle toggle-success allow-true" onclick="allow_ping(this);" style="height: 20px; width: 50px;">
                                        <div class="toggle-slide active">
                                            <div class="toggle-inner" style="width: 80px; margin-left: 0px;">
                                                <div class="toggle-on active" style="height: 20px; width: 40px; text-align: center; text-indent: -10px; line-height: 20px;">开启</div>
                                                <div class="toggle-blob" style="height: 20px; width: 20px; margin-left: -10px;"></div>
                                                <div class="toggle-off" style="height: 20px; width: 40px; margin-left: -10px; text-align: center; text-indent: 10px; line-height: 20px;">关闭</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group col-md-3 col-sm-4">
                                <label class="col-sm-4">允许订阅</label>
                                <div class="col-sm-8">
                                    <div class="toggle toggle-success allow-true" onclick="allow_feed(this);" style="height: 20px; width: 50px;">
                                        <div class="toggle-slide active">
                                            <div class="toggle-inner" style="width: 80px; margin-left: 0px;"><div class="toggle-on active" style="height: 20px; width: 40px; text-align: center; text-indent: -10px; line-height: 20px;">开启</div>
                                                <div class="toggle-blob" style="height: 20px; width: 20px; margin-left: -10px;"></div>
                                                <div class="toggle-off" style="height: 20px; width: 40px; margin-left: -10px; text-align: center; text-indent: 10px; line-height: 20px;">关闭</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="clearfix"></div>

                            <div class="text-right">
                                <a class="btn btn-default waves-effect waves-light" href="article">返回列表</a>
                                <button type="button" class="btn btn-primary waves-effect waves-light" onclick="subArticle('publish');">
                                    保存文章
                                </button>
                                <button type="button" class="btn btn-warning waves-effect waves-light" onclick="subArticle('draft');">
                                    存为草稿
                                </button>
                            </div>
                        </form>
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

<script src="/admin/plugins/tagsinput/jquery.tagsinput.min.js"></script>
<script src="/admin/plugins/jquery-multi-select/jquery.quicksearch.js"></script>

<script src="/admin/plugins/md/js/jquery.scrollto.js"></script>
<script src="/admin/plugins/md/js/pagedown.js"></script>
<script src="/admin/plugins/md/js/pagedown-extra.js"></script>
<script src="/admin/plugins/md/js/diff.js"></script>
<script src="/admin/plugins/md/js/md.js"></script>

<script src="http://cdn.bootcss.com/multi-select/0.9.12/js/jquery.multi-select.min.js"></script>
<script src="http://cdn.bootcss.com/select2/3.4.8/select2.min.js"></script>
<script src="http://cdn.bootcss.com/jquery-toggles/2.0.4/toggles.min.js"></script>
<script src="/admin/js/article.js"></script>
</body>
</html>