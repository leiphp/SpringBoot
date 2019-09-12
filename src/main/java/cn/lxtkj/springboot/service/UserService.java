package cn.lxtkj.springboot.service;

import cn.lxtkj.springboot.constant.WebConst;
import cn.lxtkj.springboot.entity.User;
import cn.lxtkj.springboot.entity.UserVoExample;
import cn.lxtkj.springboot.exception.TipException;
import cn.lxtkj.springboot.mapper.UserMapper;
import cn.lxtkj.springboot.utils.TaleUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {
    private static Logger log = Logger.getLogger(UserService.class);

    @Autowired
    private UserMapper userMapper;

    public int insertUser(String name, Integer age){
        int insertUserResult = userMapper.insert(name, age);
        return insertUserResult;
    }

    public PageInfo<User> findUserList(int page, int pageSize){
        //mysql查询limit
        //pageHelper 帮我们生产分页语句
        PageHelper.startPage(page, pageSize);
        List<User> listUser = userMapper.findUserList();
        //返回给客户端展示
        PageInfo<User> pageInfoUserList = new PageInfo<User>(listUser);
        return pageInfoUserList;
    }
    public User queryUserById(Integer id){
        User user = userMapper.selectById(id);
        return user;

    }
    public String updateById(User user){
        int count = userMapper.update(user);
        if(count==1){
            return WebConst.SUCCESS_RESULT;
        }else{
            return WebConst.FAILURE_RESULT;
        }

    }
    public String updatePasswordById(User user){
        int count = userMapper.updatePassword(user);
        if(count==1){
            return WebConst.SUCCESS_RESULT;
        }else{
            return WebConst.FAILURE_RESULT;
        }

    }
    public User login(String username, String password) {
        if (StringUtils.isBlank(username) || StringUtils.isBlank(password)) {
            throw new TipException("用户名和密码不能为空222");
        }
        UserVoExample example = new UserVoExample();
        UserVoExample.Criteria criteria = example.createCriteria();
        criteria.andUsernameEqualTo(username);
        long count = userMapper.countByExample(example);
        if (count < 1) {
            throw new TipException("不存在该用户222");
        }
        String pwd = TaleUtils.MD5encode(username + password);
        criteria.andPasswordEqualTo(pwd);
        List<User> userVos = userMapper.selectByExample(username);
        log.info("userVos对象是："+userVos);
        if (userVos.size() != 1) {
            throw new TipException("用户名或密码错误222");
        }
        return userVos.get(0);
    }
}
