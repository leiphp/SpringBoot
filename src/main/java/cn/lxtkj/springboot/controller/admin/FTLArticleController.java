package cn.lxtkj.springboot.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Map;

@Controller
@RequestMapping("/admin/article")
public class FTLArticleController {

    @RequestMapping(value = "/publish")
    public String newArticle() {
        return "admin/article_edit";
    }
//    @RequestMapping(value = "/publish")
//    public String newArticle(HttpServletRequest request) {
//        List<MetaVo> categories = metasService.getMetas(Types.CATEGORY.getType());
//        request.setAttribute("categories", categories);
//        return "admin/article_edit";
//    }


}
