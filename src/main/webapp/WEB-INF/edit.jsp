<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Form</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h2 class="mt-5 mb-3">User Form</h2>
    <form:form modelAttribute="user" method="post" action="/cd/users/update">
        <form:hidden path="id"/>
        <div class="form-group">
            <label for="name">Name:</label>
            <form:input path="name" id="name" class="form-control" required="true"/>
        </div>
        <div class="form-group">
            <label for="email">Email:</label>
            <form:input path="email" id="email" class="form-control" required="true"/>
        </div>
        <button type="submit" class="btn btn-primary">Update</button>
        <a href="/cd/users/list" class="btn btn-secondary">View Users</a>
    </form:form>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
