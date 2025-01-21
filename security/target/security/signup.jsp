<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import ="com.example.MD5Hash" %>

<html>
    <head>
        <title>User Registration</title>
    </head>
    <body>
        <%
            String url = "jdbc:mysql://localhost:3306/security";
            String dbUser = "root";
            String dbPassword = "laalu1234";

            String name = request.getParameter("username");
            String rawPass = request.getParameter("password");

            String password = MD5Hash.hashPassword(rawPass);

            PreparedStatement statement1 = null;
            PreparedStatement statement2 = null;
            Connection connection = null;

            try {
                // Load the MySQL JDBC driver
                Class.forName("com.mysql.cj.jdbc.Driver");
                connection = DriverManager.getConnection(url, dbUser, dbPassword);

                // Insert into USERS table
                String query1 = "INSERT INTO USERS (user_name, user_pass) VALUES (?, ?)";
                statement1 = connection.prepareStatement(query1);
                statement1.setString(1, name);
                statement1.setString(2, password); 
                statement1.executeUpdate();

                // Insert into USER_ROLE table
                String query2 = "INSERT INTO USER_ROLE (user_name, user_role) VALUES (?, ?)";
                statement2 = connection.prepareStatement(query2);
                statement2.setString(1, name);
                statement2.setString(2, "Intern"); // Default role
                statement2.executeUpdate();

                // Redirect to home.jsp after successful registration
                response.sendRedirect("home.jsp");

            } catch (ClassNotFoundException e) {
                out.println("<h3>Error: JDBC Driver not found.</h3>");
                e.printStackTrace();
            } catch (SQLException e) {
                out.println("<h3>Database Error: " + e.getMessage() + "</h3>");
                e.printStackTrace();
            } catch (Exception e) {
                out.println("<h3>Unexpected Error: " + e.getMessage() + "</h3>");
                e.printStackTrace();
            } finally {
                // Close resources
                if (statement1 != null) statement1.close();
                if (statement2 != null) statement2.close();
                if (connection != null) connection.close();
            }
        %>
    </body>
</html>
