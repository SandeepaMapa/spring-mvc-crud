<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>User Form</title>
    <!-- Add the following line to include Bootstrap CDN -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.0/css/bootstrap.min.css">
</head>
<body>
<div class="container">
<h2>User Form</h2>
<form:form modelAttribute="user" method="post" action="save">
    <form:hidden path="id"/>
    <div class="form-group">
        <label for="name">Name:</label>
        <form:input path="name" class="form-control"/>
    </div>
    <div class="form-group">
        <label for="email">Email:</label>
        <form:input path="email" class="form-control"/>
    </div>
    <button type="submit" class="btn btn-primary">Save</button>
</form:form>
<br>
<a href="/cd/users/list" class="btn btn-secondary">View Users</a>
</div>
<!-- Add the following line to include jQuery and Bootstrap JS CDN -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.0/js/bootstrap.min.js"></script>
</body>
</html>