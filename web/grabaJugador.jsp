<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" >
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script> 
   <title>Jugadores eSport</title>
  </head>
  <body>
    <%
      Class.forName("com.mysql.jdbc.Driver");
      Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/liga","root", "");
      Statement s = conexion.createStatement();
      request.setCharacterEncoding("UTF-8");
      
      String insercion = "INSERT INTO jugador (CodJugador,Nombre,Apellidos,ArmaFavorita,Descripcion,CodEquipo) VALUES (" 
                           + Integer.valueOf(request.getParameter("CodJugador"))
                           + ", '" + request.getParameter("Nombre")
                           + "', '" + request.getParameter("Apellidos")
                           + "', '" +request.getParameter("ArmaFavorita")
                           + "', '" + request.getParameter("Descripcion")
                           + "', " + Integer.valueOf(request.getParameter("CodEquipo"))
                           + ")";
        s.execute(insercion);
      
      conexion.close();
    %>
    <br>
    <form action="index.jsp" method="post">
        <input type ="submit" name="Aceptar">
    </form>
    <script>
        alert("Jugador añadido correctamente!");
        document.location = "index.jsp"
    </script>
  </body>
</html>