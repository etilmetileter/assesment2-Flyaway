<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
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
            <ul class="navbar-nav me-auto mb-2 mb-lg-0 ">
                <li class="nav-item"><a class="nav-link" aria-current="page" href="index.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="login.jsp">Admin Login</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container align-items-center>">
    <h2>Search For Flight</h2>
    <form action="search" method="post">
        <input type="text" placeholder="Source" name="source" />
        <input type="text" placeholder="Destination" name="destination" />
        <input type="date" placeholder="Date" name="date" />
        <input type="text" placeholder="Members" name="members" />
        <input type="submit" />
    </form>
    <%
        String error = request.getParameter("error");
        if (error != null) {
    %>
    <div class="error" style="color:red"><%= error %>
    </div>
    <%} %>
</div>
</body>
</html>