package com.example.flyawayapp;

import com.example.flyawayapp.database.FlightDatabase;
import com.example.flyawayapp.entity.Admin;
import com.example.flyawayapp.entity.Flight;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.function.Function;
import java.util.function.Predicate;
import java.util.stream.Collectors;

@WebServlet(name = "LoginServlet", value = "/login")
public class LoginServlet extends HttpServlet {

    public LoginServlet() {
        System.out.println("Login Servlet for admin only");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("index.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
        response.setHeader("Pragma", "no-cache");//http1.0
        response.setHeader("Pragma", "0");//proxies
        response.setContentType("text/html");

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        FlightDatabase db = new FlightDatabase();

        Admin currentAdmin = db.getAdmin();

        try {
            if (!password.equals(currentAdmin.getPassword())) {
                response.sendRedirect("login.jsp?error=Invalid Credentials");
            } else {

                // GET FLIGHTS LIST FROM DB

                List<Flight> flightList = db.getAllFlights();
                request.setAttribute("flights", flightList);

                List<Flight> uniqueAirlineList = getUniqueAirline(flightList);
                request.setAttribute("uniqueAirlineList", uniqueAirlineList);

                RequestDispatcher dispatcher = request.getRequestDispatcher("admin.jsp");
                dispatcher.forward(request, response);

            }
        } catch (Exception e) {
            response.sendRedirect("login.jsp?error=Internal Server Error");

        }
    }

/*    public List<Flight> getUniqueSourceAndDestination(List<Flight> flightList){
        List<Flight> fromSource = flightList.stream()
                .filter(distinctByKey(Flight::getSource))
                .collect(Collectors.toList());
    }*/


    public List<Flight> getUniqueAirline(List<Flight> flightList) {
        return flightList.stream()
                .filter(distinctByKey(Flight::getAirline))
                .collect(Collectors.toList());
    }

    public static <T> Predicate<T> distinctByKey(Function<? super T, ?> keyExtractor) {
        Map<Object, Boolean> seen = new ConcurrentHashMap<>();
        return t -> seen.putIfAbsent(keyExtractor.apply(t), Boolean.TRUE) == null;
    }
}
