<head>
    <meta charset="utf-8">
    <title>${title}</title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <link rel="shortcut icon" href="/images/favicon.png"/>
    <link href="/css/base.css" rel="stylesheet">
    <link href="/css/index.css" rel="stylesheet">
    <link href="/css/media.css" rel="stylesheet">
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
        #topnav .menu ul.children{display:none;position:absolute;top:40px;left:3px;width:100px;background:#FFF;border:2px solid #1a529c;border-top:0;line-height:normal;}
        #topnav .menu ul.children li{width:100px;padding:0px;display:inline-block;font-size:12px;border-top:1px solid #ccc;}
        #topnav .menu ul.children li h3{display:block; width:100%;}
        #topnav .menu ul.children li a{width:100%;height:16px;line-height:16px;overflow:hidden;padding:3px 0;display:block;color:#1a529c;text-align:center;
            text-decoration:none; font-size:12px;}
        #topnav .menu ul.children li a:hover{background-color:#eee;text-decoration:none;}
    </style>
    <script type="text/javascript">
        $('#topnav .menu > li').hover(function(){
            $(this).find('.children').animate({ opacity:'show', height:'show' },200);
            $(this).find('.xialaguang').addClass('navhover');
        }, function() {
            $('.children').stop(true,true).hide();
            $('.xialaguang').removeClass('navhover');
        });
    </script>
</head>