<%--
  Created by IntelliJ IDEA.
  User: mert.sever
  Date: 5.03.2023
  Time: 20:18
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <head>
        <meta charset="UTF-8">
        <title>FlyAway</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </head>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">FLYAWAY INC.</a>

        <div class="d-flex justify-content-end" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0 ">
                <li class="nav-item"><a class="nav-link" aria-current="page" href="index.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="login.jsp">Admin Login</a></li>
            </ul>
        </div>
    </div>
</nav>
<h2>Confirmation Page</h2>
<table class="table">
    <tr>
        <th>SOURCE</th>
        <th>DESTINATION</th>
        <th>DATE</th>
        <th>AIRLINE</th>
        <th>MEMBERS</th>
        <th>TICKET PRICE (TL)</th>
    </tr>
    <tr>
        <td>${requestScope.source}</td>
        <td>${requestScope.destination}</td>
        <td>${requestScope.date}</td>
        <td>${requestScope.airline}</td>
        <td>${requestScope.members}</td>
        <td>${requestScope.price}</td>
    </tr>
</table>
<div class="d-flex justify-content-end me-4">
    <a class="nav-link btn-secondary text-white" aria-current="page" href="success.jsp">Pay now!</a>
</div>
</body>
</html>
