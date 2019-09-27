<!doctype html>
<html>
<#assign title = "雷小天SpringBoot开源博客首页">
<#include "/comm/public_head.ftl">
<body>
<#include "/comm/public_header.ftl">
<article>
    <div class="l_box f_l">
        <div class="topnews">
            <h2>您现在的位置是：<a href="/">首页</a>><a href="/about">关于</a></h2>
            <div class="news_title">关于</div>
            <div class="news_about"><strong>站长</strong> 雷小天</div>
            <div class="news_about"><strong>网站</strong> https://www.100txy.com</div>
            <div class="news_about"><strong>简介</strong> 一个后台开发程序员</div>
            <div class="news_content">
                欢迎大家光临，本程序是有sprinboot+shiro+mybatis+freemarker+redis开发<br/>
                欢迎大家，交流学习！
            </div>
        </div>
    </div>
    <div class="r_box f_r">
        <div class="tit01">
            <h3>关注我们</h3>
            <div class="gzwm">
                <ul>
                    <li><a class="xlwb" href="http://weibo.com/100txy" target="_blank">新浪微博</a></li>
                    <li><a class="txwb" href="https://www.100txy.com" target="_blank">腾讯微博</a></li>
                    <li><a class="rss" href="https://www.100txy.com" target="_blank">邮箱</a></li>
                    <li><a class="wx" href="mailto:admin@admin.com"  onmouseover="tip.start(this)" tips="<font color='#fff'>关注<b>雷小天博客</b>公众号</font><br><b><img src='images/weixintop.jpg'></b>">微信</a></li>
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
                <#list alllinks as link>
                    <li><a href="${link.slug}" target="_blank">${link.name}</a></li>
                </#list>
            </ul>
        </div>
    </div>
    <!--r_box end -->
</article>
<#include "/comm/public_footer.ftl">
</body>
</html>
