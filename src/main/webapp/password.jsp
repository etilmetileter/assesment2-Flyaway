<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>FlyAway</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">FLYAWAY INC.</a>

        <div class="d-flex justify-content-end" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item"><a class="nav-link" aria-current="page" href="password.jsp">Change Password</a></li>
                <li class="nav-item"><a class="nav-link" aria-current="page" href="index.jsp">Logout</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container">
    <div>
        <div class="wrapper fadeInDown">
            <div id="formContent">
                <div class="fadeIn first">
                    <h2 class='sign'>Enter a new password</h2>
                </div>
                <form action="passwordChange" method="POST">
                    <input type="text" id="password" class="fadeIn second" name="password" placeholder="new password"/>
                    <input type="submit" class="fadeIn fourth" value="Change"/>
                </form>
                <%
                    String error = request.getParameter("error");
                    if (error != null) {
                %>
                <div class="error" style="color: red"><%= error %>
                </div>
                <%} %>
                <%
                    String success = request.getParameter("success");
                    if (success != null) {
                %>
                <div class="success" style="color: green"><%= success %>
                </div>
                <%} %>
            </div>
        </div>
    </div>
</div>

</body>
</html>