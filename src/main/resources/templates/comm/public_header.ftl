<header>
    <div class="topbg">
        <ul class="topnav">
            <a href="https://www.100txy.com" target="_blank">Home</a>
            <a href="http://weibo.com/100txy" target="_blank">官方微博</a>
            <a href="https://www.100txy.com" target="_blank">关于我们</a>
        </ul>
    </div>
    <div class="topbgline"></div>
    <div class="logo">
        <div class="logo_l f_l"><a href="/"><img src="/images/logo.png"></a></div>
        <div class="logo_r f_r"><a href="/"><img src="/images/search.png"></a></div>
    </div>
    <nav id="topnav">
        <ul class="menu">
            <li class="stmenu"><a href="/"  class="xialaguang">首页</a></li>
            <li class="stmenu"><a href="javascript:void(0)"  class="xialaguang">分类</a>
                    <ul class="children">
                        <#list allcategories as category>
                            <li>${commons.show_categories(category.name)}</li>
                        </#list>
                    </ul>
            </li>
            <li class="stmenu"><a href="javascript:void(0)"  class="xialaguang">说说</a></li>
            <li class="stmenu"><a href="/contact"  class="xialaguang">联系</a></li>
            <li class="stmenu"><a href="/link"  class="xialaguang">友链</a></li>
            <li class="stmenu"><a href="/about"  class="xialaguang">关于</a></li>
        </ul>
        <script src="/js/silder.js"></script>
    </nav>
</header>