package com.six.elm.service.impl;

import com.six.elm.mapper.UserMapper;
import com.six.elm.po.User;
import com.six.elm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;
    @Override
    public User getUserByIdByPass(User user) {
        return userMapper.getUserByIdByPass(user);
    }
    @Override
    public int getUserById(String userId) {
        return userMapper.getUserById(userId);
    }
    @Override
    public int saveUser(User user) {
        return userMapper.saveUser(user);
    }
    @Override
    public User getUserByName(User user){return userMapper.getUserByName(user);}
}