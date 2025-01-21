<%@ page import = "com.lxi.hungergame.model.Player" %>
<%@ page import = "com.lxi.hungergame.model.Forest" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Players</title>
  <style>
    body {
      background-color: #f5f5f5;
      color: #333;
      font-family: 'Arial', sans-serif;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      margin: 0;
    }

    .players-container {
      max-width: 600px;
      margin-top: 50px;
      text-align: center;
      background-color: #fff;
      border-radius: 8px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      padding: 20px;
    }

    h1 {
      font-size: 2.5em;
      margin-bottom: 20px;
      color: #2c3e50;
    }

    ul {
      list-style-type: none;
      padding: 0;
    }

    li {
      display: flex;
      align-items: center;
      margin-bottom: 10px;
      padding: 10px;
      border-radius: 6px;
      transition: background-color 0.3s ease;
    }

    li:hover {
      background-color: #f0f0f0;
    }

    img {
      width: 50px;
      height: 50px;
      border-radius: 50%;
      margin-right: 15px;
      object-fit: cover;
      border: 2px solid #3498db; /* Optional border for player images */
    }

    .play-button {
      margin-top: 20px;
      background-color: #3498db;
      color: #fff;
      border: none;
      padding: 10px 20px;
      font-size: 1em;
      border-radius: 5px;
      cursor: pointer;
      transition: background-color 0.3s ease;
    }

    .play-button:hover {
      background-color: #2980b9;
    }
  </style>
</head>
<body>
  <div class="players-container">
    <h1>Players</h1>
    <%
    Forest f = (Forest)application.getAttribute("forest");
    String name = request.getParameter("playername");
    
    if (name != null && !name.isEmpty()) {
        Player player = new Player(name, "/hungergame/images/player" + (f.getGamers().size()) + ".jpg");
        f.getGamers().add(player);
        //f.setTotalPlayers(f.getGamers().size());
    }
    
    if (!f.getGamers().isEmpty()) {
        %>
        <ul>
        <% 
        for(Player p : f.getGamers()) { 
        %>
          <li>
            <img src="<%= p.getPlayerIcon() %>" alt="Player Icon">
            <%= p.getName() %>
          </li>
        <% 
        }
        %>
        </ul>
    <% 
    }
    %>
    <a href="createplayer.jsp">Add more players</a>
    <form action="forest.jsp" method="post">
        <button type="submit" class="play-button">Play</button>
    </form>
  </div>
</body>
</html>
