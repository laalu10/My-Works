<%@ page import="com.lxi.hungergame.model.*" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hunger Game</title>
    <style>
        body {
            background-color: #7cc4a3;
            color: #333;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            font-family: 'Arial', sans-serif;
        }

        table {
            background-color: #333;
            border-collapse: collapse;
            margin: auto;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            background-color: #ffffff;
            margin-top: 10px;
        }

        td {
            width: 65px; /* Increased cell width */
            height:30px; /* Increased cell height */
            border: 1px solid #cccccc;
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
            transition: background-color 0.3s, transform 0.3s;
            padding: 0;
            position: relative;
            text-align: center; /* Center align content in table cells */
            vertical-align: middle; /* Middle align content in table cells */
        }

        td:hover {
            background-color: #e0e0e0;
            transform: scale(1.1);
        }

        td:active {
            background-color: #d0d0d0;
        }

        .food-icon {
            position: absolute;
            width: 50%;
            max-width: 25px; /* Adjust size as needed */
            height: auto;
            object-fit: cover;
            top: 50%;
            transform: translateY(-50%);
            left: 5px; /* Adjust position from left */
            opacity: 0.8;
            border: 2px solid #fff;
            border-radius: 50%;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.3);
        }

        .hunter-icon {
            position: absolute;
            width: 50%;
            max-width: 25px; /* Adjust size as needed */
            height: auto;
            object-fit: cover;
            top: 50%;
            transform: translateY(-50%);
            right: 5px; /* Adjust position from right */
            opacity: 0.8;
            border: 1px solid #fff;
            border-radius: 50%;
            box-shadow: 0 0 3px rgba(0, 0, 0, 0.3);
        }

        .player-container {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
            margin-left: 20px;
        }

        .player-icon-container {
            position: relative;
            display: flex;
            align-items: center;
        }

        .player-icon {
            width: 50px; /* Adjust size as needed */
            height: auto;
            object-fit: cover;
            margin-right: 10px; /* Add space between icon and text */
            border-radius: 50%; /* Ensure the icon is circular */
        }

        .player-health-container {
            display: flex;
            flex-direction: column;
            width: 100%;
        }

        .player-health-badge {
            background-color: #e0e0e0; /* Light gray background for empty badge */
            height: 10px; /* Adjust height */
            width: 100%; /* Make it full width */
            display: flex;
            justify-content: flex-start; /* Align content to the start */
            align-items: center;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.3);
            overflow: hidden;
            border-radius: 0 0 5px 5px; /* Rounded corners at the bottom */
        }

        .health-bar {
            height: 100%; /* Ensure the bar fills the badge height */
            transition: width 0.3s; /* Smooth transition for width change */
        }

        .health-bar.low { background-color: #4CAF50; }  /* Green */
        .health-bar.medium { background-color: #FFEB3B; }  /* Yellow */
        .health-bar.high { background-color: #FF9800; }  /* Orange */
        .health-bar.critical { background-color: #f44336; }  /* Red */

        .player-details {
            display: flex;
            flex-direction: column;
            width: 100%;
        }

        .player-name {
            font-size: 16px; /* Adjust font size */
            margin-bottom: 5px; /* Space between name and button */
        }

        .roll-button-container {
            margin-top: 5px; /* Space between name and button */
        }

        .roll-button {
            padding: 8px 16px; /* Adjust padding for button */
            background-color: #4CAF50; /* Green background */
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 4px;
            font-size: 14px; /* Adjust font size */
        }

        .roll-button:disabled {
            background-color: #cccccc; /* Light gray background for disabled state */
            cursor: not-allowed;
        }

        .player-icon-small {
            width: 40px; /* Adjust size as needed */
            height: auto;
            object-fit: cover;
            margin-right: 5px; /* Add space between icon and text */
        }

        .dice-result {
            font-size: 10px;
            font-weight: bold;
            margin-top: 10px;
            color: #007bff; /* Blue color */
             margin-left: 20px ;
        }
        .killed
            {
                height : 5px;
                width : 10px;
                margin-bottom: 600px;
                margin-left: 100px;
            }
        .win
        {
            height : 5px;
            width : 5px;
            margin-bottom: 700px;
            margin-left: 30px;
        }
    </style>
</head>
<body>

<%
    Forest f = (Forest)application.getAttribute("forest");

    if(f.getActivePlayer() == null && !f.getGamers().isEmpty() ){
        f.setActivePlayer(f.getGamers().get(0));
    }

    String name;

    if (request.getParameter("gameloop") != null) {
        name = f.getActivePlayer().getName();
        
        boolean x = f.gameLoop();
        
        if(!f.getWinners().isEmpty())
        {
            for(Player winner : f.getWinners())
            {
                %>
                <div class="win">
                <img src="<%= winner.getPlayerIcon() %>" alt="Player Image" width="50" height="50">
                 <%= winner.getName() %> WINNER 
                </div>
                <% 
            } 
        }


        if(f.getGamers().size() == 1)
        {
            for(Player player : f.getGamers())
            {
                f.getWinners().add(player);
            }
            response.sendRedirect("winners.jsp");
        }
        
        
        if (!x) 
        { 
            %>
                <div class="killed">
                    <%= name %> has been killed!
                </div>
         <%
        } 
        
    }
      

    if(!f.getGamers().isEmpty()) {
        List<Player> players = f.getGamers();
%>

<div>

<%
        for (Player player : players) {
            int hungerLevel = player.getHungerLevel(); // Assuming hunger level is out of 20
            int hungerPercentage = (hungerLevel * 100) / 20; // Convert to percentage
            String healthClass;
            if (hungerLevel <= 5) {
                healthClass = "low";
            } else if (hungerLevel <= 10) {
                healthClass = "medium";
            } else if (hungerLevel <= 15) {
                healthClass = "high";
            } else {
                healthClass = "critical";
            }
%>

<form action="forest.jsp" method="post">
    <div class="player-container">
        <div class="player-icon-container">
            <img class="player-icon" src="<%= player.getPlayerIcon() %>" alt="Player Icon">
        </div>
        <div class="player-details">
            <div class="player-name"><%= player.getName() %></div>
            <h2><%= "Hunger level: " + player.getHungerLevel() %></h2>

            <div class="player-health-container">
                <div class="player-health-badge">
                    <div class="health-bar <%= healthClass %>" style="width: <%= hungerPercentage %>%;"></div>
                 </div>
            </div>
            <div class="roll-button-container">
                <input type="submit" class="roll-button"name = "gameloop" <%= player.equals(f.getActivePlayer()) ? "" : "disabled" %> value="Roll Dice"/>
            </div>
            <div class="dice-result"> You Rolled: <%= player.getResult() %></div>
        </div>
    </div>
</form>

<% if (player.equals(f.getActivePlayer())) { %>
    
<% } %>

<%
        }
%>
</div>

<%
    }
%>

<table border="1">
    <% for (int i = 0; i < 10; i++) { %>
    <tr>
        <% for (int j = 0; j < 10; j++) {
            Cell cell = f.getCell()[i][j];
        %>
        <td>

          <h2><%=f.getCell()[i][j].getCellCount()%></h2>

            <% if(!cell.getPlayers().isEmpty()) {
            for(Player player : cell.getPlayers()){ %>
            <img class="player-icon-small" src="<%= player.getPlayerIcon() %>" alt="Player Icon"/>

            <%    }
        } %>

            <% if(!cell.getFoods().isEmpty()) {
            for(Food food : cell.getFoods()){ %>
            <img class="food-icon" src="<%= food.getFoodIcon() %>"/>
            <% }
        } %>

            <% if(!cell.getHunters().isEmpty()) {
            for(Hunter hunter : cell.getHunters()){ %>
            <img class="hunter-icon" src="<%= hunter.getHunterIcon() %>"/>
            <% }
        } %>
        </td>
        <% } %>
    </tr>
    <% } %>
</table>

</body>
</html>



