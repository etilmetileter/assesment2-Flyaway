package com.example.flyawayapp;

import com.example.flyawayapp.database.FlightDatabase;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "PasswordServlet", value = "/passwordChange")
public class PasswordServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String password = request.getParameter("password");

        FlightDatabase db = new FlightDatabase();
        try {

            db.updateAdmin(password);
            response.sendRedirect("password.jsp?success=Password has been changed successfully");
        } catch (Exception e) {
            response.sendRedirect("password.jsp?error=Internal Server Error");

        }
    }
}
