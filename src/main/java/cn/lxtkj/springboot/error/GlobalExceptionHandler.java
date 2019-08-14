package cn.lxtkj.springboot.error;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

/**
 * 全局捕获异常案例
 * 1.返回json格式
 * 2.捕获返回页面
 */
@ControllerAdvice(basePackages = "cn.lxtkj.springboot.config")
public class GlobalExceptionHandler {
    //@ResponseBody 返回json格式
    //modeAndView 返回页面
    @ExceptionHandler(RuntimeException.class)//运行时异常
    @ResponseBody
    public Map<String, Object> errorResult(){
         Map<String, Object> errorResultMap = new HashMap<String, Object>();
         errorResultMap.put("errorCode", "500");
         errorResultMap.put("errorMsg", "系统错误");
        return errorResultMap;
    }
}
