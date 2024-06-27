package com.gsm.bb.dao;

import com.gsm.bb.model.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;

@Repository
public class AdminDAOImpl implements AdminDAO {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public Admin findByUsernameAndPassword(String username, String password) {
        String sql = "SELECT * FROM admin WHERE username = ? AND password = ?";
        try {
            return jdbcTemplate.queryForObject(sql, new Object[]{username, password}, new RowMapper<Admin>() {
                @Override
                public Admin mapRow(ResultSet rs, int rowNum) throws SQLException {
                    Admin admin = new Admin();
                    admin.setId(rs.getInt("id"));
                    admin.setUsername(rs.getString("username"));
                    admin.setPassword(rs.getString("password"));
                    return admin;
                }
            });
        } catch (Exception e) {
            return null;
        }
    }
}