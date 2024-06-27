package com.gsm.bb.service;

import com.gsm.bb.model.User;

import java.util.List;

public interface UserService {
    void saveUser(User user);
    List<User> getAllUsers();
    void update(User user);
    void delete(int id);
    User getUserById(int id);
}