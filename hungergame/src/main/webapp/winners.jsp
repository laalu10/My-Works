<%@ page import="com.lxi.hungergame.model.*" %>
<html>
<head>
    <title>Game Result</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 20px;
        }
        table {
            width: 80%;
            margin: auto;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #f2f2f2;
        }
        img.player-icon {
            vertical-align: middle;
            border-radius: 50%;
            margin-right: 10px;
        }
    </style>
</head>
<body>
    <h1>Game Result</h1>
    
    <%-- Assuming 'forest' is an attribute in application scope --%>
    <%
    Forest f = (Forest) application.getAttribute("forest");
    %>

    <table>
        <thead>
            <tr>
                <th>RANK</th>
                <th>PLAYER</th>
            </tr>
        </thead>
        <tbody>
            <% int rank = 1;
            for (Player p : f.getWinners()) { %>
                <tr>
                    <td><%= rank %></td>
                    <td>
                        <img src="<%= p.getPlayerIcon() %>" alt="Player Image" class="player-icon" width="50" height="50">
                        <%= p.getName() %>    
                    </td>
                </tr>
                <% rank++;
            } %>
        </tbody>
    </table>
</body>
</html>
