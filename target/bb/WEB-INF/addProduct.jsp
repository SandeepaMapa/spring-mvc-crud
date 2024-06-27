<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Product</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
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
                        <a class="nav-link" href="/bb/api/products/list">Product List</a>
                    </li>
                </ul>
            </div>
            <button class="btn btn-outline-secondary" href= "/bb/home">Back</button>
        </div>
    </nav>
    
    <div class="container mt-5">
        <h2 class="mb-4">Add Product</h2>
        <form:form modelAttribute="product" method="POST" action="/bb/api/products/save" enctype="multipart/form-data" id="productForm" class="needs-validation" novalidate="true">
            <div class="mb-3">
                <form:label path="productId" class="form-label">Product Id</form:label>
                <form:input path="productId" class="form-control" required="true"/>
                <div class="invalid-feedback">Please provide a product ID.</div>
            </div>
            
            <div class="mb-3">
                <form:label path="title" class="form-label">Title</form:label>
                <form:input path="title" class="form-control" required="true"/>
                <div class="invalid-feedback">Please provide a title.</div>
            </div>
            
            <div class="mb-3">
                <form:label path="description" class="form-label">Description</form:label>
                <form:textarea path="description" class="form-control" rows="3" required="true"/>
                <div class="invalid-feedback">Please provide a description.</div>
            </div>
            
            <div class="mb-3">
                <form:label path="price" class="form-label">Price</form:label>
                <form:input path="price" class="form-control" type="number" step="0.01" required="true"/>
                <div class="invalid-feedback">Please provide a valid price.</div>
            </div>
            
            <div class="mb-3">
                <form:label path="productImage1" class="form-label">Product Image 1</form:label>
                <input type="file" name="productImage1" class="form-control"/>
            </div>
            
            <div class="mb-3">
                <form:label path="productImage2" class="form-label">Product Image 2</form:label>
                <input type="file" name="productImage2" class="form-control"/>
            </div>
            
            <div class="mb-3">
                <form:label path="productImage3" class="form-label">Product Image 3</form:label>
                <input type="file" name="productImage3" class="form-control"/>
            </div>
            
            <button type="submit" class="btn btn-primary" id="submitBtn" disabled>Save</button>
        </form:form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Form validation and submit button enable/disable
        const form = document.getElementById('productForm');
        const submitBtn = document.getElementById('submitBtn');
        const requiredInputs = form.querySelectorAll('input[required], textarea[required]');

        function checkFormValidity() {
            let isValid = true;
            requiredInputs.forEach(input => {
                if (!input.value.trim()) {
                    isValid = false;
                }
            });
            submitBtn.disabled = !isValid;
        }

        requiredInputs.forEach(input => {
            input.addEventListener('input', checkFormValidity);
        });

        // Bootstrap form validation
        form.addEventListener('submit', function(event) {
            if (!form.checkValidity()) {
                event.preventDefault();
                event.stopPropagation();
            }
            form.classList.add('was-validated');
        }, false);
    </script>
</body>
</html>
