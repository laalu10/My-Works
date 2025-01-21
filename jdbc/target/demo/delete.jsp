<%@ page import = "java.sql.*" %>

<html>
    <head>
        <title>Delete Record</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f7fa;
                margin: 0;
                padding: 0;
            }

            .container {
                width: 80%;
                margin: 50px auto;
                padding: 30px;
                background-color: #fff;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            h1 {
                text-align: center;
                color: #333;
                font-size: 28px;
            }

            h3 {
                text-align: center;
                color: #4CAF50;
            }

            h4 {
                text-align: center;
                color: #FF5733;
            }

            .feedback {
                text-align: center;
                margin-top: 20px;
                font-size: 18px;
                padding: 15px;
                border-radius: 5px;
            }

            .success {
                background-color: #d4edda;
                color: #155724;
            }

            .error {
                background-color: #f8d7da;
                color: #721c24;
            }

            button {
                display: block;
                width: 200px;
                padding: 10px;
                margin: 20px auto;
                background-color: #4CAF50;
                color: white;
                font-size: 16px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            button:hover {
                background-color: #45a049;
            }

            .back-btn-container {
                text-align: center;
            }
        </style>
    </head>
    <body>

        <div class="container">
            <h1>Delete Record</h1>

            <%
            String url = "jdbc:mysql://localhost:3306/study";
            String userName = "root";
            String password = "laalu1234";
            Connection connection = null;
            PreparedStatement statement = null;

            try {
                // Load MySQL JDBC driver
                Class.forName("com.mysql.cj.jdbc.Driver");

                // Establish database connection
                connection = DriverManager.getConnection(url, userName, password);

                // Retrieve parameters from the request
                String name = request.getParameter("name");
                String idParam = request.getParameter("id");
                int id = (idParam != null && !idParam.isEmpty()) ? Integer.parseInt(idParam) : 0;

                // Check if ID or Name is provided
                if (id != 0 || (name != null && !name.isEmpty())) {
                    String query = null;

                    if (id != 0) {
                        query = "DELETE FROM DETAILS WHERE ID = ?";
                    } else if (name != null && !name.isEmpty()) {
                        query = "DELETE FROM DETAILS WHERE NAME = ?";
                    }

                    // Prepare the query
                    statement = connection.prepareStatement(query);

                    // Set parameters for the query
                    if (id != 0) {
                        statement.setInt(1, id);
                    } else if (name != null && !name.isEmpty()) {
                        statement.setString(1, name);
                    }

                    // Execute the delete operation
                    int rowsAffected = statement.executeUpdate();

                    // Provide feedback based on the result
                    if (rowsAffected > 0) {
                        out.println("<div class='feedback success'><h3>Contact Deleted Successfully</h3></div>");
                    } else {
                        out.println("<div class='feedback error'><h3>No Record Found</h3></div>");
                    }
                } else {
                    out.println("<div class='feedback error'><h3>Please provide either an ID or a Name to delete.</h3></div>");
                }

            } catch (ClassNotFoundException | SQLException e) {
                out.println("<div class='feedback error'><h4>An error occurred. Please try again later.</h4></div>");
            } finally {
                try {
                    if (statement != null) {
                        statement.close();
                    }
                    if (connection != null) {
                        connection.close();
                    }
                } catch (SQLException e) {
                    out.println("<div class='feedback error'><h4>Error closing resources: " + e.getMessage() + "</h4></div>");
                }
            }
            %>

            <div class="back-btn-container">
                <button onclick="window.location.href = 'homepage.html'">Back To HomePage</button>
            </div>

        </div>

    </body>
</html>
