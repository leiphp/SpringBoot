package cn.lxtkj.springboot.service;

import cn.lxtkj.springboot.entity.User;
import cn.lxtkj.springboot.mapper.UserMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {
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
}
