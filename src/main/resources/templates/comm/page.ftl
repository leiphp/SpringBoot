
<div>
    <div class="clearfix">
        <ul class="pagination m-b-5 pull-right">
            <#if pageInfo.hasPreviousPage>
            <li >
                <a href="?page=${pageInfo.prePage}" aria-label="Previous">
                    <i class="fa fa-angle-left"></i>&nbsp;上一页</a>
            </li>
            </#if>
            <#--<block each="nav : ${pageInfo.navigatepageNums}">-->
                <#--<li class="${nav==pageInfo.pageNum}?'active':''"><a href="@{'?page='+${nav}}" text="${nav}"></a>-->
                <#--</li>-->
            <#--</block>-->
            <#list pageInfo.navigatepageNums as nav>
            <li class=${(nav==pageInfo.pageNum)?string('active','')}><a href="?page=${nav}">${nav}</a></li>
            </#list>


            <#if pageInfo.hasNextPage>
            <li>
                <a href="?page=${pageInfo.nextPage}" aria-label="Next">
                    下一页&nbsp;<i class="fa fa-angle-right"></i>
                </a>
            </li>
            </#if>

            <li><span>共${pageInfo.pages}页</span></li>
        </ul>
    </div>
</div>
