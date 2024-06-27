package com.gsm.bb.service;

import com.gsm.bb.model.Admin;

public interface AdminService {
    Admin validateAdmin(String username, String password);
}