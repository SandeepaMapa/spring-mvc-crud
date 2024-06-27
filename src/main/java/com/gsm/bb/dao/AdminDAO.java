package com.gsm.bb.dao;

import com.gsm.bb.model.Admin;

public interface AdminDAO {
    Admin findByUsernameAndPassword(String username, String password);
}