package com.six.elm.controller;

import com.six.elm.po.User;
import com.six.elm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/UserController")
public class UserController {
    @Autowired
    private UserService userService;
    @RequestMapping("/getUserByIdByPass")
    public User getUserByIdByPass(User user) throws Exception{
        return userService.getUserByIdByPass(user);
    }
    @RequestMapping("/getUserById")
    public int getUserById(User user) throws Exception{
        return userService.getUserById(user.getUserId());
    }
    @RequestMapping("/saveUser")
    public int saveUser(User user) throws Exception{
        return userService.saveUser(user);
    }
    @RequestMapping("/getUserByName")
    public User getUserByName(User user) throws Exception{
        return userService.getUserByName(user);
    }
}
