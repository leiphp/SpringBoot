<!doctype html>
<html>
<head>
    <meta charset="gb2312">
    <title>雷小天博客文章标题-SpringBoot开源博客</title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <link href="/css/index.css" rel="stylesheet">
    <link href="/css/base.css" rel="stylesheet">
    <link href="/css/view.css" rel="stylesheet">
    <link href="/css/media.css" rel="stylesheet">
    <link rel="shortcut icon" href="/images/favicon.png"/>
    <link rel="stylesheet" href="http://cdn.bootcss.com/highlight.js/9.9.0/styles/xcode.min.css">
    <script type="text/javascript" src="/js/jquery.min.js"></script>
    <script type="text/javascript" src="/js/myfocus-2.0.4.min.js"></script>


    <!--[if lt IE 9]>
    <script src="/js/modernizr.js"></script>
    <![endif]-->

    <!-- 返回顶部调用 begin -->
    <script type="text/javascript" src="/js/up/jquery.js"></script>
    <script type="text/javascript" src="/js/up/js.js"></script>
    <!-- 返回顶部调用 end-->
    <style type="text/css">
        /*主导航菜单*/
        #topnav .menu li{position:relative;float:left;display:inline;font-size:14px;}
        #topnav .menu li h3{font-weight:normal;display:inline-block;float:left;}
        #topnav .menu li a.selected,#topnav .menu li a.navhover,#topnav .menu li a.xialaguang:hover{color:#1a529c;}
        #topnav .menu li a.navhover, #topnav .menu li a.xialaguang:hover{background-color:#FFF;}
        #topnav .menu li a.xialaguang span{height:30px;line-height:25px;display:inline-block;font-weight:bold;}
        #topnav .menu li a.selected span,#topnav .menu li a.navhover span,#topnav .menu li a.xialaguang:hover span{cursor:pointer;}
        #topnav .menu li a.navhover span, #topnav .menu li a.xialaguang:hover span{width:100px;}
        #topnav .menu ul.children{display:none;position:absolute;top:50px;left:2px;width:100px;background:#FFF;border:2px solid #31A9B3;border-top:0;line-height:normal;z-index:99;}
        #topnav .menu ul.children li{width:100px;padding:0px;display:inline-block;font-size:12px;border-top:1px solid #ccc;}
        #topnav .menu ul.children li h3{display:block; width:100%;}
        #topnav .menu ul.children li a{width:100%;height:16px;line-height:16px;overflow:hidden;padding:3px 0;display:block;color:#1a529c;text-align:center;
            text-decoration:none; font-size:12px;}
        #topnav .menu ul.children li a:hover{background-color:#eee;text-decoration:none;}
    </style>
</head>
<body>
<#include "/comm/public_header.ftl">
<article>
    <div class="l_box f_l">
        <div class="topnews">
            <h2>您现在的位置是：<a href="/">门户</a>><a href="/">文章</a>> 查看内容</h2>
            <div class="news_title">${article.title}</div>
            <div class="news_author">
                <span class="au01">雷小天</span>
                <span class="au02">${commons.fmtdate(article.created)}</span>
                <span class="au03">共<b>${article.hits}</b>人围观</span>
                <#if article.comments_num==0>
                    <strong class="au04 f_r">暂无评论</strong>
                <#else>
                    <strong class="au04 f_r">${article.comments_num}条评论</strong>
                </#if>
            </div>
            <div class="tags">
                ${commons.show_tags(article.tags)}
                <#--<a href="/" target="_blank">手机</a>-->
                <#--<a href="/" target="_blank">电话</a>-->
                <#--<a href="/" target="_blank">欠费</a>-->
            </div>

            <div class="news_about"><strong>简介</strong> ${article.description}</div>
            <div class="news_content">
                ${commons.article(article.content)}
            </div>
            <div class="fenx">分享：</div>
            <div class="nextinfo">
                <p>上一篇：<#if prevarticle?? ><a href="/article/${prevarticle.cid}" >${prevarticle.title}</a><#else>没有了</#if> </p>
                <p>下一篇：<#if nextarticle?? ><a href="/article/${nextarticle.cid}" >${nextarticle.title}</a><#else>没有了</#if> </p>
            </div>
            <div class="otherlink">
                <h2>相关文章</h2>
                <ul>
                    <#list likearticles as article>
                        <li><a href="/article/${article.cid}" title="${article.title}">${article.title}</a></li>
                    </#list>
                </ul>
            </div>
            <div class="news_pl">
                <h2>文章评论</h2>
                <ul>
                </ul>
                <#include "/comments.ftl">
            </div>
        </div>
    </div>
    <div class="r_box f_r">
        <script type="text/javascript">
            //设置
            myFocus.set({
                id:'myFocus',//ID
                pattern:'mF_kdui'//风格
            });
        </script>
        <div id="myFocus"><!--焦点图盒子-->
            <div class="loading"></div>
            <!--载入画面(可删除)-->
            <div class="pic"><!--图片列表-->
                <ul>
                    <li><a href="#1"><img src="/images/1m.jpg" thumb="" alt="酷站代码整理" text="图片1更详细的描述文字" /></a></li>
                    <li><a href="#2"><img src="/images/2m.jpg" thumb="" alt="酷站代码特效大全" text="图片2更详细的描述文字" /></a></li>
                    <li><a href="#3"><img src="/images/3m.jpg" thumb="" alt="酷站代码特效" text="图片3更详细的描述文字" /></a></li>
                    <li><a href="#4"><img src="/images/4m.jpg" thumb="" alt="酷站代码素材" text="图片4更详细的描述文字" /></a></li>
                    <li><a href="#5"><img src="/images/5m.jpg" thumb="" alt="酷站代码教程" text="图片5更详细的描述文字" /></a></li>
                </ul>
            </div>
        </div>

        <!--banner代码 结束 -->
        <#include "/comm/public_right.ftl">
        <#--<script type="text/javascript">-->
            <#--jQuery.noConflict();-->
            <#--jQuery(function() {-->
                <#--var elm = jQuery('#r_ad');-->
                <#--var startPos = jQuery(elm).offset().top;-->
                <#--jQuery.event.add(window, "scroll", function() {-->
                    <#--var p = jQuery(window).scrollTop();-->
                    <#--jQuery(elm).css('position',((p) > startPos) ? 'fixed' : 'static');-->
                    <#--jQuery(elm).css('top',((p) > startPos) ? '30px' : '');-->
                <#--});-->
            <#--});-->
        <#--</script>-->
    </div>
    <!--r_box end -->
</article>
<#include "/comm/public_footer.ftl">
</body>
</html>
