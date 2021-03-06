package cn.lxtkj.springboot.controller.admin;

import com.github.pagehelper.PageInfo;
import cn.lxtkj.springboot.constant.WebConst;
import cn.lxtkj.springboot.controller.BaseController;
import cn.lxtkj.springboot.dto.LogActions;
import cn.lxtkj.springboot.dto.Types;
import cn.lxtkj.springboot.model.Bo.RestResponseBo;
import cn.lxtkj.springboot.entity.Attach;
//import cn.lxtkj.springboot.model.Vo.UserVo;
import cn.lxtkj.springboot.entity.User;
import cn.lxtkj.springboot.service.AttachService;
//import cn.lxtkj.springboot.service.ILogService;
import cn.lxtkj.springboot.utils.Commons;
import cn.lxtkj.springboot.utils.TaleUtils;
import org.apache.log4j.Logger;

import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;


@Controller
@RequestMapping("admin/attach")
public class AttachController extends BaseController {
    private static Logger log = Logger.getLogger(FTLArticleController.class);

    public static final String CLASSPATH = TaleUtils.getUploadFilePath();

    @Resource
    private AttachService attachService;

//    @Resource
//    private ILogService logService;
    @Resource
    private Commons commons;

    /**
     * 附件页面
     *
     * @param request
     * @param page
     * @param limit
     * @return
     */
    @RequestMapping(value = "")
    public String index(HttpServletRequest request, @RequestParam(value = "page", defaultValue = "1") int page, @RequestParam(value = "limit", defaultValue = "12") int limit, @RequestParam(value = "sort", defaultValue = "id desc") String sort) {
        PageInfo<Attach> attachPaginator = attachService.getAttachs(page, limit, sort);
        request.setAttribute("attachs", attachPaginator);
        request.setAttribute("pageInfo", attachPaginator);
        request.setAttribute(Types.ATTACH_URL.getType(), Commons.site_option(Types.ATTACH_URL.getType(), Commons.site_url()));
        request.setAttribute("max_file_size", WebConst.MAX_FILE_SIZE / 1024);
        request.setAttribute("commons", commons);
        return "admin/attach";
    }

    /**
     * 上传文件接口
     *
     * @param request
     * @return
     */
    @RequestMapping(value = "/upload", method = RequestMethod.POST)
    @ResponseBody
    public RestResponseBo upload(HttpServletRequest request, @RequestParam("file") MultipartFile[] multipartFiles) throws IOException {
//        User users = this.user(request);
//        Integer uid = users.getId();
        int uid =4;
        List<String> errorFiles = new ArrayList<>();
        try {
            for (MultipartFile multipartFile : multipartFiles) {
                String fname = multipartFile.getOriginalFilename();
                if (multipartFile.getSize() <= WebConst.MAX_FILE_SIZE) {
                    String fkey = TaleUtils.getFileKey(fname);
                    String ftype = TaleUtils.isImage(multipartFile.getInputStream()) ? Types.IMAGE.getType() : Types.FILE.getType();
                    File file = new File(CLASSPATH + fkey);
                    try {
                        FileCopyUtils.copy(multipartFile.getInputStream(), new FileOutputStream(file));
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                    attachService.save(fname, fkey, ftype, uid);
                } else {
                    errorFiles.add(fname);
                }
            }
        } catch (Exception e) {
            return RestResponseBo.fail();
        }
        return RestResponseBo.ok(errorFiles);
    }

//    @RequestMapping(value = "delete")
//    @ResponseBody
//    public RestResponseBo delete(@RequestParam Integer id, HttpServletRequest request) {
//        try {
//            AttachVo attach = attachService.selectById(id);
//            if (null == attach) {
//                return RestResponseBo.fail("不存在该附件");
//            }
//            attachService.deleteById(id);
//            new File(CLASSPATH + attach.getFkey()).delete();
//            logService.insertLog(LogActions.DEL_ARTICLE.getAction(), attach.getFkey(), request.getRemoteAddr(), this.getUid(request));
//        } catch (Exception e) {
//            String msg = "附件删除失败";
//            LOGGER.error(msg, e);
//            return RestResponseBo.fail(msg);
//        }
//        return RestResponseBo.ok();
//    }

}
