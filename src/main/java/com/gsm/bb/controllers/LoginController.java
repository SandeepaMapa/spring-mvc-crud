package com.gsm.bb.controllers;

import com.gsm.bb.model.Admin;
import com.gsm.bb.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {

    @Autowired
    private AdminService adminService;

    @GetMapping("/login")
    public String showLoginForm() {
        return "index"; // Assuming index.jsp is the login form
    }

    @PostMapping("/login")
    public String login(@RequestParam("username") String username,
                        @RequestParam("password") String password,
                        Model model) {
        Admin admin = adminService.validateAdmin(username, password);
        if (admin != null) {
            //return "redirect:/users/list";
        	return "AdminDashboard";
        } else {
            model.addAttribute("error", "Invalid username or password");
            return "index";
        }
    }
}
