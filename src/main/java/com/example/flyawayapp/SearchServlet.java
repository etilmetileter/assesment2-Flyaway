package com.example.flyawayapp;

import com.example.flyawayapp.database.FlightDatabase;
import com.example.flyawayapp.database.HibernateConfig;
import com.example.flyawayapp.entity.Flight;
import org.hibernate.SessionFactory;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "SearchServlet", value = "/search")
public class SearchServlet extends HttpServlet {

    private static final SessionFactory factory = HibernateConfig.getSessionFactory();
    private String source;
    private String destination;
    private String date;
    private int members;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("index.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            this.source = request.getParameter("source");
            this.destination = request.getParameter("destination");
            this.date = request.getParameter("date");
            this.members = Integer.parseInt(request.getParameter("members"));
        } catch (Exception e) {
            response.sendRedirect("index.jsp?error=Fill all the fields!");
            return;
        }


        FlightDatabase db = new FlightDatabase();
        List<Flight> flightList = db.getAllFlights();
        List<Flight> matchedFlightList = new ArrayList<>();

        flightList.forEach(flight -> {
            if (checkFlightCondition(flight.getSource(), flight.getDestination(), flight.getDate(), flight.getAvailableSeats())) {
                matchedFlightList.add(flight);
            }
        });
        request.setAttribute("matchedFlightList", matchedFlightList);
        request.setAttribute("members", this.members);
        RequestDispatcher dispatcher = request.getRequestDispatcher("search.jsp");
        dispatcher.forward(request, response);
    }

    private boolean checkFlightCondition(String source, String destination, String date, int availableSeats) {
        return this.source.equals(source) && this.destination.equals(destination) && this.date.equals(date) && availableSeats >= this.members;
    }
}

