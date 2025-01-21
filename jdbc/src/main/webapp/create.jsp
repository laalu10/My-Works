<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<html>
    <head>
        <title>Contact Added</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f7fc;
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }

            .container {
                background-color: #fff;
                padding: 40px;
                border-radius: 8px;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
                width: 400px;
                text-align: center;
            }

            h3 {
                font-size: 24px;
                color: #4CAF50;
            }

            .buttons {
                margin-top: 20px;
            }

            .buttons button {
                background-color: #4CAF50;
                color: white;
                padding: 12px 20px;
                font-size: 16px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                margin: 10px;
                transition: background-color 0.3s ease;
            }

            .buttons button:hover {
                background-color: #45a049;
            }

            .buttons button:focus {
                outline: none;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <%
                String url = "jdbc:mysql://localhost:3306/study";
                String userName = "root";
                String password = "laalu1234";

                
                PreparedStatement statement=null;
                Connection connection=null;
                String message = "";

                try {
                    String name = request.getParameter("name");
                    int age = Integer.parseInt(request.getParameter("age"));

                    // Load MySQL JDBC Driver
                    Class.forName("com.mysql.cj.jdbc.Driver");

                    // Establish connection
                    connection = DriverManager.getConnection(url, userName, password);

                    // SQL query to insert data
                    String query = "INSERT INTO DETAILS(NAME, AGE) VALUES(?, ?)";

                    statement = connection.prepareStatement(query);

                    // Set values to the prepared statement
                    statement.setString(1, name);
                    statement.setInt(2, age);

                    // Execute the update and check if data is inserted
                    int rowInserted = statement.executeUpdate();

                    if (rowInserted > 0) {
                        message = "<h3>Contact Added Successfully</h3>";
                    }

                    // Close the connections
                    statement.close();
                    connection.close();
                } catch (Exception e) {
                    message = "<h3>An error occurred while inserting the data.</h3>";
                    e.printStackTrace();
                }
                out.println(message);
            %>

            <!-- Buttons to navigate -->
            <div class="buttons">
                <button onclick="window.location.href ='create.html'">Add More</button>
                <button onclick="window.location.href = 'homepage.html'">Back to Homepage</button>
            </div>
        </div>
    </body>
</html>
