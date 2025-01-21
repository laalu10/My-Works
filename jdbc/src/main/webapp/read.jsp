<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.ResultSet" %>

<html>
    <head>
        <title>SHOW CONTACT</title>
        <style>
            table {
                width: 80%;
                margin: 20px auto;
                border-collapse: collapse;
                font-family: Arial, sans-serif;
            }
            th, td {
                padding: 10px;
                text-align: center;
                border: 1px solid #ddd;
            }
            th {
                background-color: #4CAF50;
                color: white;
            }
            tr:nth-child(even) {
                background-color: #f2f2f2;
            }
            tr:hover {
                background-color: #ddd;
            }
        </style>
    </head>
    <body>
        <%
        String url = "jdbc:mysql://localhost:3306/study";
        String userName = "root";
        String password = "laalu1234";

        PreparedStatement statement = null;
        ResultSet resultSet = null;
        Connection connection = null;

        try {
            // Load the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish connection
            connection = DriverManager.getConnection(url, userName, password);

            // Prepare and execute the query
            String query = "SELECT * FROM DETAILS";
            statement = connection.prepareStatement(query);
            resultSet = statement.executeQuery();

            // Print results in an HTML table
            out.println("<table>");
            out.println("<tr><th>ID</th><th>NAME</th><th>AGE</th></tr>");

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                int age = resultSet.getInt("age");

                out.println("<tr>");
                out.println("<td>" + id + "</td>");
                out.println("<td>" + name + "</td>");
                out.println("<td>" + age + "</td>");
                out.println("</tr>");
            }

            out.println("</table>");

            // Close resources
            resultSet.close();
            statement.close();
            connection.close();

        }
        catch (Exception e) 
        {
            out.println("<p>Error: " + e.getMessage() + "</p>");
        }
        %>
        <div>
            <button onclick="window.location.href='homepage.html'">Back to Home Page</button>
        </div>
    </body>
</html>
