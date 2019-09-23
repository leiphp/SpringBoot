<!doctype html>
<html>
<#assign title = "雷小天SpringBoot开源博客首页">
<#include "/comm/public_head.ftl">
<body>
<#include "/comm/public_header.ftl">
<article>
    <div class="l_box f_l">
        <div class="banner f_l">
            <script type="text/javascript">
                //设置
                myFocus.set({
                    id:'myFocus',//ID
                    pattern:'mF_fancy'//风格
                });
            </script>
            <div id="myFocus"><!--焦点图盒子-->
                <div class="loading"></div>
                <!--载入画面(可删除)-->
                <div class="pic"><!--图片列表-->
                    <ul>
                        <li><a href="#1"><img src="images/1m.jpg" thumb="" alt="酷站代码整理" text="图片1更详细的描述文字" /></a></li>
                        <li><a href="#2"><img src="images/2m.jpg" thumb="" alt="酷站代码特效大全" text="图片2更详细的描述文字" /></a></li>
                        <li><a href="#3"><img src="images/3m.jpg" thumb="" alt="酷站代码特效" text="图片3更详细的描述文字" /></a></li>
                        <li><a href="#4"><img src="images/4m.jpg" thumb="" alt="酷站代码素材" text="图片4更详细的描述文字" /></a></li>
                        <li><a href="#5"><img src="images/5m.jpg" thumb="" alt="酷站代码教程" text="图片5更详细的描述文字" /></a></li>
                    </ul>
                </div>
            </div>
        </div>
        <!--banner代码 结束 -->

        <div class="focustext f_r">
            <section class="ft01">
                <h3><a href="/" target="_blank">住在手机里的朋友</a></h3>
                <p>通信时代，无论是初次相见还是老友重逢，交换联系方式，常常是彼此交换名片</p>
            </section>
            <section class="ft02">
                <h3><a href="/" target="_blank">教你怎样用欠费手机拨...</a></h3>
                <p>在快节奏的生活里，我们不知不觉中就成为住在别人手机里的朋友。</p>
            </section>
        </div>
        <div class="blank"></div>
        <div class="topnews">
            <h2><span><a href="/" target="_blank">栏目标题</a><a href="/" target="_blank">栏目标题</a><a href="/" target="_blank">栏目标题</a></span><b>文章</b>推荐</h2>
            <#list articles as post>
                <div class="blogs">
                    <#--<figure><img src="images/01.jpg"></figure>-->
                    <figure><img src="${commons.show_thumb(post)}"></figure>
                    <ul>
                        <h3><a href="/article/${post.cid}">${post.title}</a></h3>
                        <p>${post.description}</p>
                        <p class="autor"><span class="lm f_l"><a href="/">${post.categories}</a></span><span class="dtime f_l">${(post.created*1000)?number_to_datetime}</span><span class="viewnum f_r">浏览（<a href="/">${post.hits}</a>）</span><span class="pingl f_r">评论（<a href="/">${post.comments_num}</a>）</span></p>
                    </ul>
                </div>
            </#list>
        </div>
    </div>
    <div class="r_box f_r">
        <div class="tit01">
            <h3>关注我们</h3>
            <div class="gzwm">
                <ul>
                    <li><a class="xlwb" href="#" target="_blank">新浪微博</a></li>
                    <li><a class="txwb" href="#" target="_blank">腾讯微博</a></li>
                    <li><a class="rss" href="portal.php?mod=rss" target="_blank">邮箱</a></li>
                    <li><a class="wx" href="mailto:admin@admin.com"  onmouseover="tip.start(this)" tips="<font color='#fff'>关注<b>机友汇</b>微信账号</font><br><b><img src='images/weixintop.jpg'></b>">微信</a></li>
                    <div id="mjs:tip" class="tip" style="position:absolute;left:0;top:0;display:none;"> </div>
                    <script>
                        var tip={$:function(ele){
                                if(typeof(ele)=="object")
                                    return ele;
                                else if(typeof(ele)=="string"||typeof(ele)=="number")
                                    return document.getElementById(ele.toString());
                                return null;
                            },
                            mousePos:function(e){
                                var x,y;
                                var e = e||window.event;
                                return{x:e.clientX+document.body.scrollLeft+document.documentElement.scrollLeft,
                                    y:e.clientY+document.body.scrollTop+document.documentElement.scrollTop};
                            },
                            start:function(obj){
                                var self = this;
                                var t = self.$("mjs:tip");
                                obj.onmousemove=function(e){
                                    var mouse = self.mousePos(e);
                                    t.style.left = mouse.x + 10 + 'px';
                                    t.style.top = mouse.y + 10 + 'px';
                                    t.innerHTML = obj.getAttribute("tips");
                                    t.style.display = '';
                                };
                                obj.onmouseout=function(){
                                    t.style.display = 'none';
                                };
                            }
                        }
                    </script>



                </ul>
            </div>
        </div>
        <!--tit01 end-->
        <div class="ad300x100"> <img src="images/ad300x100.jpg"> </div>
        <#include "/comm/public_right.ftl">
        <div class="links">
            <h3><span>[<a href="/">申请友情链接</a>]</span>友情链接</h3>
            <ul>
                <li><a href="/">手机配件</a></li>
                <li><a href="/">苹果Apple</a></li>
                <li><a href="/">SumSung</a></li>
                <li><a href="/">Sony</a></li>
                <li><a href="/">三星</a></li>
                <li><a href="/">索尼</a></li>
                <li><a href="/">华维荣耀</a></li>
            </ul>
        </div>
    </div>
    <!--r_box end -->
</article>
<#include "/comm/public_footer.ftl">
</body>
</html>
