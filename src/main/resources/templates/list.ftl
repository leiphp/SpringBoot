<!doctype html>
<html>
<head>
    <meta charset="gb2312">
    <title>雷小天SpringBoot开源博客</title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <link href="/css/base.css" rel="stylesheet">
    <link href="/css/list.css" rel="stylesheet">
    <link href="/css/media.css" rel="stylesheet">
    <link rel="shortcut icon" href="/images/favicon.png"/>
    <script type="text/javascript" src="/js/jquery.min.js"></script>
    <script type="text/javascript" src="/js/lrtk.js"></script>
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0">
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
            <h2><span><a href="/" target="_blank">栏目标题</a><a href="/" target="_blank">栏目标题</a><a href="/" target="_blank">栏目标题</a></span><b>文章</b>推荐</h2>
            <#list articles.list as post>
                <div class="blogs">
                    <figure><img src="${commons.show_thumb(post)}"></figure>
                    <ul>
                        <h3><a href="/article/${post.cid}">${post.title}</a></h3>
                        <p>${post.description}</p>
                        <p class="autor"><span class="lm f_l"><a href="/">${post.categories}</a></span><span class="dtime f_l">${(post.created*1000)?number_to_datetime}</span><span class="viewnum f_r">浏览（<a href="/">${post.hits}</a>）</span><span class="pingl f_r">评论（<a href="/">${post.comments_num}</a>）</span></p>
                    </ul>
                </div>
            </#list>
        </div>
        <div class="page">
            <#include "/comm/page.ftl">

            <#--<a title="Total record"><b>106</b> </a>-->
            <#--<b>1</b>-->
            <#--<a href="/news/index_2.html">2</a>-->
            <#--<a href="/news/index_3.html">3</a>-->
            <#--<a href="/news/index_4.html">4</a>-->
            <#--<a href="/news/index_5.html">5</a>-->
            <#--<a href="/news/index_2.html">&gt;</a>-->
            <#--<a href="/news/index_5.html">&gt;&gt;</a>-->
        </div>
    </div>
    <div class="r_box f_r">
        <div class="covers">
            <div id="slide-holder">
                <div id="slide-runner"> <a href="/" target="_blank"><img id="slide-img-1" src="/images/a1.jpg"  alt="" /></a> <a href="/" target="_blank"><img id="slide-img-2" src="/images/a2.jpg"  alt="" /></a> <a href="/" target="_blank"><img id="slide-img-3" src="/images/a3.jpg"  alt="" /></a> <a href="/" target="_blank"><img id="slide-img-4" src="/images/a4.jpg"  alt="" /></a>
                    <div id="slide-controls">
                        <p id="slide-client" class="text"><strong></strong><span></span></p>
                        <p id="slide-desc" class="text"></p>
                        <p id="slide-nav"></p>
                    </div>
                </div>
            </div>
            <script>
                if(!window.slider) {
                    var slider={};
                }

                slider.data= [
                    {
                        "id":"slide-img-1", // 与slide-runner中的img标签id对应
                        "client":"标题1",
                        "desc":"" //这里修改描述
                    },
                    {
                        "id":"slide-img-2",
                        "client":"标题2",
                        "desc":""
                    },
                    {
                        "id":"slide-img-3",
                        "client":"标题3",
                        "desc":""
                    },
                    {
                        "id":"slide-img-4",
                        "client":"标题4",
                        "desc":""
                    }
                ];

            </script>
        </div>
        <#include "/comm/public_right.ftl">
    </div>
    <!--r_box end -->
</article>
<#include "/comm/public_footer.ftl">
</body>
</html>
