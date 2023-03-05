package com.example.flyawayapp;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "bookServlet", value = "/book")
public class BookServlet extends HttpServlet {

    public void init() {
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html");
        response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
        response.setHeader("Pragma", "no-cache");//http1.0
        response.setHeader("Pragma", "0");//proxies

        request.setAttribute("source", request.getParameter("source"));
        request.setAttribute("destination", request.getParameter("destination"));
        request.setAttribute("date", request.getParameter("date"));
        request.setAttribute("price", request.getParameter("price"));
        request.setAttribute("members", request.getParameter("members"));
        request.setAttribute("airline", request.getParameter("airline"));

        RequestDispatcher dispatcher = request.getRequestDispatcher("book.jsp");
        dispatcher.forward(request, response);
    }

    public void destroy() {
    }
}