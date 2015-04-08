<%-- 
    Document   : deletefood
    Created on : Mar 23, 2015, 9:41:45 PM
    Author     : Administrator
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String id = request.getParameter("id");
            
            try {
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                String concmd = "jdbc:sqlserver://localhost:1433;databaseName=NATRestaurant";
                Connection con = DriverManager.getConnection(concmd, "sa", "sa");
                
                String cmd = "delete vote where foodid="+id;
                con.createStatement().execute(cmd);
                cmd = "delete food where id=" + id;
                con.createStatement().execute(cmd);
                
                con.close();
                
                response.sendRedirect("add.jsp");
            } catch (Exception ex) {
                out.println(ex.getMessage());
            }
        %>
    </body>
</html>
