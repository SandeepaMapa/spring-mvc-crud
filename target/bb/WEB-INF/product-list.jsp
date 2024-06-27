<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Product List</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
   <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Product Management</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="/bb/api/products/new">Add Product</a>
                    </li>
                </ul>
            </div>
            <button class="btn btn-outline-secondary" href= "/bb/home">Back</button>
        </div>
    </nav>
<div class="container mt-5">
    <h2 class="mb-4">Product List</h2>
    
    <!-- Success Alert -->
    <c:if test="${not empty param.successMessage}">
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            ${param.successMessage}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </c:if>

    <br>
    <a href="${pageContext.request.contextPath}/api/products/new" class="btn btn-success">Add New Product</a>
    <br>
    <br>
    <table class="table table-bordered">
        <thead class="thead-dark">
            <tr>
                <th>ID</th>
                <th>Title</th>
                <th>Description</th>
                <th>Price</th>
                <th>Image 1</th>
                <th>Image 2</th>
                <th>Image 3</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="product" items="${products}">
                <tr>
                    <td>${product.productId}</td>
                    <td>${product.title}</td>
                    <td>${product.description}</td>
                    <td>${product.price}</td>
                    <td><img src="${pageContext.request.contextPath}/api/products/image/${product.productId}/1" class="img-thumbnail" width="100" height="100"/></td>
                    <td><img src="${pageContext.request.contextPath}/api/products/image/${product.productId}/2" class="img-thumbnail" width="100" height="100"/></td>
                    <td><img src="${pageContext.request.contextPath}/api/products/image/${product.productId}/3" class="img-thumbnail" width="100" height="100"/></td>
                    <td>
                        <a href="${pageContext.request.contextPath}/api/products/edit/${product.productId}" class="btn btn-primary btn-sm mb-4">Edit</a>
                        <button class="btn btn-danger btn-sm" data-toggle="modal" data-target="#deleteModal" data-id="${product.productId}">Delete</button>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<!-- Delete Confirmation Modal -->
<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="deleteModalLabel">Confirm Delete</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                Are you sure you want to delete this product?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                <a href="#" class="btn btn-danger" id="confirmDelete">Delete</a>
            </div>
        </div>
    </div>
</div>

<script>
    $('#deleteModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget);
        var productId = button.data('id');
        var deleteUrl = '${pageContext.request.contextPath}/api/products/delete/' + productId;
        $('#confirmDelete').attr('href', deleteUrl);
    });

    $(document).ready(function() {
        setTimeout(function() {
            $('.alert').alert('close');
        }, 6000); // 6000 milliseconds = 6 seconds
    });
</script>
</body>
</html>
