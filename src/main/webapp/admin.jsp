<%--
  Created by IntelliJ IDEA.
  User: mert.sever
  Date: 5.03.2023
  Time: 11:50
  To change this template use File | Settings | File Templates.
--%>
<%@page import="com.example.flyawayapp.entity.Flight" %>
<%@page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>FlyAway</title>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
            crossorigin="anonymous">
    <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
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
    <h3 class="d-flex justify-content-center">LIST OF FLIGHTS</h3>
    <table class="table">
        <tr>
            <th>SOURCE</th>
            <th>DESTINATION</th>
            <th>AIRLINE</th>
            <th>TICKET PRICE (TL)</th>
        </tr>
        <c:forEach var="flights" items="${requestScope.flights}">
            <tr>
                <td>${flights.source}</td>
                <td>${flights.destination}</td>
                <td>${flights.airline}</td>
                <td>${flights.price}</td>
            </tr>
        </c:forEach>
    </table>
</div>

<div class="container">
    <h3 class="d-flex justify-content-center">LIST OF SOURCE & DESTINATION </h3>

    <table class="table">
        <tr>
            <th>SOURCE</th>
            <th>DESTINATION</th>
        </tr>
        <c:forEach var="flights" items="${requestScope.flights}">
            <tr>
                <td>${flights.source}</td>
                <td>${flights.destination}</td>
            </tr>
        </c:forEach>
    </table>
</div>
<div class="container">
    <h3 class="d-flex justify-content-center">LIST OF AIRLINES </h3>
    <table class="table">
        <tr>
            <th>AIRLINES</th>
            <c:forEach var="uniqueAirlineList" items="${requestScope.uniqueAirlineList}">
        <tr>
            <td>${uniqueAirlineList.airline}</td>
        </tr>
            </c:forEach>
        </tr>
    </table>
</div>

</body>
</html>