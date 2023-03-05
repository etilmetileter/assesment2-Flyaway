<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>FlyAway</title>
    <meta charset="UTF-8">
    <title>FlyAway</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
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
    <h3 class="d-flex justify-content-center">LIST OF FLIGHTS</h3>
    <table class="table">
        <tr>
            <th>SOURCE</th>
            <th>DESTINATION</th>
            <th>DATE</th>
            <th>AIRLINE</th>
            <th>AVAILABLE SEATS</th>
            <th>TICKET PRICE (TL)</th>
            <th>BOOK</th>
        </tr>
        <c:forEach var="matchedFlight" items="${requestScope.matchedFlightList}">
            <tr>
                <td>${matchedFlight.source}</td>
                <td>${matchedFlight.destination}</td>
                <td>${matchedFlight.date}</td>
                <td>${matchedFlight.airline}</td>
                <td>${matchedFlight.availableSeats}</td>
                <td>${matchedFlight.price}</td>
                <td><a href="book?source=${matchedFlight.source}
                            &destination=${matchedFlight.destination}
                            &date=${matchedFlight.date}
                            &airline=${matchedFlight.airline}
                            &members=${requestScope.members}
                            &price=${matchedFlight.price}">Book</a> </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>