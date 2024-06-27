package com.gsm.bb.dao;

import com.gsm.bb.model.User;

import java.util.List;

public interface UserDAO {
    void save(User user);
    List<User> findAll();
    void update(User user);
    void delete(int id);
    User getById(int id);
}
