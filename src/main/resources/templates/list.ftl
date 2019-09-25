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

</head>
<body>
<header>
    <div class="topbg">
        <ul class="topnav">
            <a href="/ " target="_blank">Home</a><a href="/ " target="_blank">官方微博</a><a href="/ " target="_blank">关于我们</a>
        </ul>
    </div>
    <div class="topbgline"></div>
    <div class="logo">
        <div class="logo_l f_l"><a href="/"><img src="/images/logo.png"></a></div>
        <div class="logo_r f_r"><a href="/"><img src="/images/search.png"></a></div>
    </div>
    <nav id="topnav">
        <ul>
            <a href="/">网站首页</a>
            <a href="/list">新闻中心</a>
            <a href="/article/1">产品中心</a>
            <a href="a.html">关于我们</a>
            <a href="c.html">联系我们</a>
            <a href="b.html"">网上留言</a>
        </ul>
        <script src="/js/silder.js"></script>
    </nav>
</header>
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
<footer>
    <div class="endfoot">
        <div class="ft-info f_l">
            <div class="ftlogo"><a href="#" target="_blank"><img src="/images/ftlogo.png"></a></div>
            <div class="ft-title">
                <p>时尚设计，国内最优化的模板设计平台! </p>
            </div>
        </div>
        <div class="ft-list f_r">
            <div class="ft-nav"> <a href="#" target="_blank">关于我们</a> <a href="#" target="_blank">联系我们</a> <a href="#" target="_blank">版权声明</a> <a href="#" id="qaurl">问题反馈</a> <a href="#" target="_blank">商务合作</a> </div>
            <p class="ft-copyright"> Copyright 2014 Comsenz Inc. Powered by Discuz! X3.2. 粤ICP2014008000-3号</p>
        </div>
    </div>
    <div id="tbox"> <a id="togbook" href="/"></a> <a id="gotop" href="javascript:void(0)"></a> </div>
</footer>
</body>
</html>
