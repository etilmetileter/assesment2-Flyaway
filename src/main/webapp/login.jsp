<%--
  Created by IntelliJ IDEA.
  User: mert.sever
  Date: 5.03.2023
  Time: 11:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>FlyAway</title>
    <meta charset="UTF-8">
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
                <li class="nav-item"><a class="nav-link" aria-current="page" href="index.jsp">Home</a></li>
            </ul>
        </div>
    </div>
</nav>
<div class="container">
    <div>
        <div class="wrapper fadeInDown">
            <div id="formContent">
                <div class="fadeIn first">
                    <h2 class='sign'>Admin Login Portal</h2>
                </div>
                <form action="login" method="POST">
                    <input type="text" id="login" class="fadeIn second" name="email" placeholder="Email" value="admin@flywaway.com"/>
                    <input type="password" id="password" class="fadeIn third" name="password" placeholder="Password" value="adminf"/>
                    <input type="submit" class="fadeIn fourth" value="Log In"/>
                </form>
                <%
                    String error = request.getParameter("error");
                    if (error != null) {
                %>
                <div class="error" style="color:red"><%= error %>
                </div>
                <%} %>
            </div>
        </div>
    </div>
</div>
</body>
</html>
