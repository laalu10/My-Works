package com.example;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

//@WebServlet("/create")
public class CreateServlet extends HttpServlet {

    private static  final String url = "jdbc:mysql://localhost:3306/usedb";
    private static final String usreName = "root";
    private static final String userPass = "laalu1234";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String name = request.getParameter("name");
        String place = request.getParameter("place");

        Connection connection = null;
        PreparedStatement statement = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(url, usreName, userPass);

            String query = "INSERT INTO USERS (NAME, PLACE) VALUES (?, ?)";
            statement = connection.prepareStatement(query);
            statement.setString(1, name);
            statement.setString(2, place);
            int rowAffected = statement.executeUpdate();

            if (rowAffected > 0) {
               
                out.println("<html>");
                out.println("<head>");
                out.println("<style>");
                out.println("body { font-family: Arial, sans-serif; background-color: #f9f9f9; margin: 0; padding: 0; display: flex; justify-content: center; align-items: center; height: 100vh; text-align: center; }");
                out.println(".container { background-color: #fff; padding: 20px 30px; border-radius: 8px; box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); width: 300px; }");
                out.println("h1 { color: #28a745; font-size: 22px; }");
                out.println("a { text-decoration: none; color: #007BFF; font-size: 16px; display: block; margin-top: 20px; padding: 10px 20px; border-radius: 5px; background-color: #f0f8ff; }");
                out.println("a:hover { background-color: #e6f0f7; }");
                out.println("</style>");
                out.println("</head>");
                out.println("<body>");
                out.println("<div class='container'>");
                out.println("<h1>Added Successfully!</h1>");
                out.println("<a href='/web/create'>Add more +</a>");
                out.println("</div>");
                out.println("</body>");
                out.println("</html>");
            }

        } catch (ClassNotFoundException e) {
            out.println("<h1>Class not found: " + e + "</h1>");
            e.printStackTrace();
        } catch (SQLException e) {
            out.println("<h1>SQL Exception: " + e + "</h1>");
            e.printStackTrace();
        } catch (Exception e) {
            out.println("<h1>An Error Occurred: " + e + "</h1>");
            e.printStackTrace();
        } finally {
            try {
                if (connection != null) connection.close();
                if (statement != null) statement.close();
            } catch (SQLException e) {
                out.println("<h1>Error Closing Resources</h1>");
                e.printStackTrace();
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("homepage.html");
    }
}
