package com.gsm.bb.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.gsm.bb.model.User;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {
    // You can add custom query methods here if needed
    // For example:
    // List<User> findByName(String name);
    // User findByEmail(String email);
}