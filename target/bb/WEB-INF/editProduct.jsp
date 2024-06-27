<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Product</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2 class="mb-4">Edit Product</h2>
        <form method="POST" action="${pageContext.request.contextPath}/api/products/update" enctype="multipart/form-data" class="needs-validation" novalidate>
            <input type="hidden" name="productId" value="${product.productId}" />

            <div class="mb-3">
                <label for="title" class="form-label">Title</label>
                <input type="text" name="title" class="form-control" value="${product.title}" required />
            </div>

            <div class="mb-3">
                <label for="description" class="form-label">Description</label>
                <textarea name="description" class="form-control" rows="3" required>${product.description}</textarea>
            </div>

            <div class="mb-3">
                <label for="price" class="form-label">Price</label>
                <input type="number" name="price" class="form-control" step="0.01" value="${product.price}" required />
            </div>

            <div class="mb-3">
                <label for="productImage1" class="form-label">Product Image 1</label>
                <input type="file" name="productImage1" class="form-control" />
            </div>

            <div class="mb-3">
                <label for="productImage2" class="form-label">Product Image 2</label>
                <input type="file" name="productImage2" class="form-control" />
            </div>

            <div class="mb-3">
                <label for="productImage3" class="form-label">Product Image 3</label>
                <input type="file" name="productImage3" class="form-control" />
            </div>

            <button type="submit" class="btn btn-primary">Update</button>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
