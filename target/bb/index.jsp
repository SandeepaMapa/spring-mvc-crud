<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored= "false"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.0/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script>
        $(document).ready(function() {
            $('#loginButton').prop('disabled', true);
            $('#username, #password').keyup(function() {
                if ($('#username').val().length > 0 && $('#password').val().length > 0) {
                    $('#loginButton').prop('disabled', false);
                } else {
                    $('#loginButton').prop('disabled', true);
                }
            });
        });
    </script>
</head>
<body>
<div class="container">
    <h2>Login</h2>
    <form action="${pageContext.request.contextPath}/login" method="post">
        <div class="form-group">
            <label for="username">Username</label>
            <input type="text" class="form-control" id="username" name="username" required maxlength="45">
        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <input type="password" class="form-control" id="password" name="password" required maxlength="45">
        </div>
        <button type="submit" id="loginButton" class="btn btn-primary">Login</button>
        <%-- <c:if test="${not empty error}">
            <div class="alert alert-danger mt-3">${error}</div>
        </c:if> --%>
    </form>
</div>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.0/js/bootstrap.min.js"></script>
</body>
</html>