<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.SQLException" %>

<html>
    <head>
        <title>Update Contact</title>
        <style>
            /* Basic styling for body */
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f9;
                margin: 0;
                padding: 0;
            }

            /* Centered container */
            .container {
                width: 50%;
                margin: 50px auto;
                background-color: #fff;
                padding: 30px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                border-radius: 8px;
            }

            h1 {
                text-align: center;
                color: #333;
            }

            /* Styling form elements */
            label {
                display: block;
                margin-bottom: 10px;
                font-size: 1.1em;
                color: #333;
            }

            input[type="text"], input[type="number"] {
                width: 100%;
                padding: 12px;
                margin: 8px 0;
                border: 1px solid #ccc;
                border-radius: 5px;
                box-sizing: border-box;
                font-size: 1em;
            }

            input[type="submit"] {
                background-color: #4CAF50;
                color: white;
                padding: 12px;
                font-size: 1.1em;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                width: 100%;
                transition: background-color 0.3s;
            }

            input[type="submit"]:hover {
                background-color: #45a049;
            }

            .message {
                text-align: center;
                font-size: 1.2em;
                padding: 15px;
                margin-top: 20px;
            }

            .message h3 {
                color: #333;
            }

            /* Error and Success message styles */
            .error {
                color: #e74c3c;
                font-size: 1.2em;
                text-align: center;
                margin-top: 20px;
            }

            .success {
                color: #2ecc71;
                font-size: 1.2em;
                text-align: center;
                margin-top: 20px;
            }

            /* Footer with button links */
            .footer {
                text-align: center;
                margin-top: 30px;
            }

            .footer button {
                background-color: #3498db;
                color: white;
                padding: 12px 20px;
                font-size: 1em;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                margin: 10px;
                transition: background-color 0.3s;
            }

            .footer button:hover {
                background-color: #2980b9;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Update Contact</h1>
            <%
                String url = "jdbc:mysql://localhost:3306/study";
                String userName = "root";
                String password = "laalu1234";
                Connection connection = null;
                PreparedStatement statement = null;

                try {
                    // Load the JDBC driver
                    Class.forName("com.mysql.cj.jdbc.Driver");

                    // Establish connection to the database
                    connection = DriverManager.getConnection(url, userName, password);

                    // Retrieve parameters from the request
                    int id = Integer.parseInt(request.getParameter("id"));
                    String name = request.getParameter("name");
                    int age = Integer.parseInt(request.getParameter("age"));

                    String query = "UPDATE DETAILS SET NAME = ?, AGE = ? WHERE ID = ?";

                    statement = connection.prepareStatement(query);

                    statement.setString(1, name);
                    statement.setInt(2, age);
                    statement.setInt(3, id);

                    int rowUpdated = statement.executeUpdate();

                    if (rowUpdated > 0) {
                        out.println("<div class='success'><h3>Contact Updated Successfully</h3></div>");
                    } else {
                        out.println("<div class='error'><h3>No record found with the given ID.</h3></div>");
                    }

                } catch (ClassNotFoundException e) {
                    out.println("<div class='error'><h4>Class not found: " + e.getMessage() + "</h4></div>");
                    e.printStackTrace();
                } catch (SQLException e) {
                    out.println("<div class='error'><h4>SQL Exception: " + e.getMessage() + "</h4></div>");
                    e.printStackTrace();
                } catch (Exception e) {
                    out.println("<div class='error'><h4>An error occurred: " + e.getMessage() + "</h4></div>");
                    e.printStackTrace();
                } finally {
                    try {
                        if (statement != null) {
                            statement.close();
                        }
                        if (connection != null) {
                            connection.close();
                        }
                    } catch (SQLException e) {
                        out.println("<div class='error'><h4>Error closing resources: " + e.getMessage() + "</h4></div>");
                        e.printStackTrace();
                    }
                }
            %>

            <!-- Footer buttons -->
            <div class="footer">
                <button onclick="window.location.href='homepage.html'">Back to Home Page</button>
            </div>
        </div>
    </body>
</html>
