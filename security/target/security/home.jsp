<%@ page import = "java.security.Principal"%>
<html>
    <head><title> Home Page</title> 
    </head>
    <body>
        <%
         Principal principal = request.getUserPrincipal();
         
         if(principal != null)
         {
            if(request.isUserInRole("Admin") )
            {
                out.println("<h2> HI Admin </h2>");
            }
            if(request.isUserInRole("Intern"))
            {
                out.println("<h2> HI Intern </h2>");
            }
         }
        %>

    </body>
</html>