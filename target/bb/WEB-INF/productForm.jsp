<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>
<head>
    <title>Product Form</title>
</head>
<body>
    <h2>Product Form</h2>
    <form:form method="post" action="${pageContext.request.contextPath}/save" modelAttribute="product" enctype="multipart/form-data">
        <table>
            <tr>
                <td>Product ID:</td>
                <td><form:input path="productId" /></td>
            </tr>
            <tr>
                <td>Title:</td>
                <td><form:input path="title" /></td>
            </tr>
            <tr>
                <td>Description:</td>
                <td><form:input path="description" /></td>
            </tr>
            <tr>
                <td>Price:</td>
                <td><form:input path="price" /></td>
            </tr>
            <tr>
                <td>Product Image 1:</td>
                <td><input type="file" name="productImage1" /></td>
            </tr>
            <tr>
                <td>Product Image 2:</td>
                <td><input type="file" name="productImage2" /></td>
            </tr>
            <tr>
                <td>Product Image 3:</td>
                <td><input type="file" name="productImage3" /></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="Save Product" /></td>
            </tr>
        </table>
    </form:form>
</body>
</html>
