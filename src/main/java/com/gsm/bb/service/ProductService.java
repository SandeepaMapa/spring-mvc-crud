package com.gsm.bb.service;

import java.util.List;
import com.gsm.bb.model.Product;

public interface ProductService {
    List<Product> findAll();
    Product findById(String productId);
    Product save(Product product);
    void deleteById(String productId);
}
