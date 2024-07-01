package com.six.elm.service;

import com.six.elm.po.User;

public interface UserService {
    public User getUserByIdByPass(User user);
    public int getUserById(String userId);
    public int saveUser(User user);

    public User getUserByName(User user);
}
