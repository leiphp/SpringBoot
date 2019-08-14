package cn.lxtkj.springboot.service;

import cn.lxtkj.springboot.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {
    @Autowired
    private UserMapper userMapper;

    public int insertUser(String name, Integer age){
        int insertUserResult = userMapper.insert(name, age);
        return insertUserResult;
    }

}
