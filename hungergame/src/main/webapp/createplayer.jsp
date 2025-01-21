<%@ page import = "com.lxi.hungergame.model.Forest"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Players Number</title>
<style>
  body {
    background-color: #e0d6c8; /* Light beige background */
    font-family: 'Arial', sans-serif;
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    color: #433d3c; /* Dark brown text color */
  }
  
  .form {
    background-color: #ddc4a7; /* Light brown background */
    border-radius: 10px;
    width: 320px;
    padding: 30px;
    border: 2px solid #bfaa91; /* Medium brown border */
    text-align: center;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.3); /* Subtle shadow */
  }
  
  .form h1 {
    margin-top: 0;
    font-size: 32px;
    color: #6b615e; /* Medium brown text color */
    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3); /* Text shadow */
  }
  
  .form input[type="text"],
  .form input[type="submit"] {
    margin-bottom: 15px;
  }
  
  .form input[type="text"] {
    width: calc(100% - 20px);
    padding: 12px;
    font-size: 18px;
    border: 2px solid #6b615e; /* Medium brown border */
    border-radius: 5px;
    box-sizing: border-box;
    background-color: #f2e8da; /* Light beige input background */
    color: #433d3c; /* Dark brown text color */
  }
  
  .form input[type="submit"] {
    background-color: #6b615e; /* Medium brown button background */
    color: #fff; /* White text color */
    border: none;
    padding: 10px 20px;
	position:relative;
	top:20px;
    font-size: 20px;
    cursor: pointer;
    border-radius: 5px;
    transition: background-color 0.3s ease;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.3);
  }
  
  .form input[type="submit"]:hover {
    background-color: #4e4644; /* Darker brown on hover */
	
	
  }
</style>
</head>
<body>

  <%
  Forest forest =(Forest)application.getAttribute("forest");
  if(forest == null)
  {
    Forest f = new Forest();
    application.setAttribute("forest",f);
    f.initialize(); 
  }
  else{
    forest.initialize(); 
  }
    %>
    <form action="players.jsp" class="form">
      <h1>Create Player</h1>
      <input type="text" name="playername" placeholder="Enter name of the players" required><br>
      <input type="submit" value="Submit">
    </form>
    
</body>
</html>