package com.gsm.bb.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.gsm.bb.model.Product;

public interface ProductRepository extends JpaRepository<Product, String> {
}
