package com.gsm.bb.service;

import com.gsm.bb.dao.AdminDAO;
import com.gsm.bb.model.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminDAO adminDAO;

    @Override
    public Admin validateAdmin(String username, String password) {
        return adminDAO.findByUsernameAndPassword(username, password);
    }
}