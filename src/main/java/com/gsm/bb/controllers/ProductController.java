package com.gsm.bb.controllers;


import com.gsm.bb.model.Product;
import com.gsm.bb.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/api/products")
public class ProductController {

    @Autowired
    private ProductService productService;
    
    @Autowired
    public void setProductService(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/new")
    public String showNewProductForm(Model model) {
        model.addAttribute("product", new Product());
        return "addProduct";
    }

    @PostMapping("/save")
    public String saveProduct(@RequestParam("productId") String productId,
                              @RequestParam("title") String title,
                              @RequestParam("description") String description,
                              @RequestParam("price") double price,
                              @RequestParam("productImage1") MultipartFile productImage1,
                              @RequestParam("productImage2") MultipartFile productImage2,
                              @RequestParam("productImage3") MultipartFile productImage3,
                              Model model) throws IOException {
        Product product = new Product();
        product.setProductId(productId);
        product.setTitle(title);
        product.setDescription(description);
        product.setPrice(price);
        product.setProductImage1(productImage1.getBytes());
        product.setProductImage2(productImage2.getBytes());
        product.setProductImage3(productImage3.getBytes());

        productService.save(product);

        return "redirect:/api/products/list?successMessage=Product+added+successfully!";
    }


    @GetMapping("/list")
    public String listProducts(Model model, @RequestParam(value = "successMessage", required = false) String successMessage) {
        List<Product> products = productService.findAll();
        model.addAttribute("products", products);
        if (successMessage != null) {
            model.addAttribute("successMessage", successMessage);
        }
        return "product-list";
    }


    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable("id") String id, Model model) {
        Product product = productService.findById(id);
        model.addAttribute("product", product);
        return "editProduct"; // Assuming your edit JSP is named "editProduct.jsp"
    }

    @PostMapping("/update")
    public String updateProduct(
            @RequestParam("productId") String productId,
            @RequestParam("title") String title,
            @RequestParam("description") String description,
            @RequestParam("price") double price,
            @RequestParam(value = "productImage1", required = false) MultipartFile productImage1,
            @RequestParam(value = "productImage2", required = false) MultipartFile productImage2,
            @RequestParam(value = "productImage3", required = false) MultipartFile productImage3) throws IOException {

        Product product = productService.findById(productId);
        product.setTitle(title);
        product.setDescription(description);
        product.setPrice(price);

        if (productImage1 != null && !productImage1.isEmpty()) {
            product.setProductImage1(productImage1.getBytes());
        }
        if (productImage2 != null && !productImage2.isEmpty()) {
            product.setProductImage2(productImage2.getBytes());
        }
        if (productImage3 != null && !productImage3.isEmpty()) {
            product.setProductImage3(productImage3.getBytes());
        }

        productService.save(product);
        return "redirect:/api/products/list"; // Redirect to the product list page after updating
    }


    @GetMapping("/delete/{id}")
    public String deleteProduct(@PathVariable("id") String id) {
        productService.deleteById(id);
        return "redirect:/api/products/list"; // Redirect to the product list page after deleting
    }
    
    @GetMapping("/image/{productId}/{imageNumber}")
    public ResponseEntity<byte[]> getProductImage(@PathVariable String productId, @PathVariable int imageNumber) {
        Product product = productService.findById(productId);

        byte[] image = null;
        switch (imageNumber) {
            case 1:
                image = product.getProductImage1();
                break;
            case 2:
                image = product.getProductImage2();
                break;
            case 3:
                image = product.getProductImage3();
                break;
            default:
                return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }

        final HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.IMAGE_JPEG);

        return new ResponseEntity<>(image, headers, HttpStatus.OK);
    }
}
