<%-- 
    Document   : deletevote
    Created on : Mar 31, 2015, 11:25:22 PM
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
            String cmd = "delete vote where id="+id;
            try {
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                String concmd = "jdbc:sqlserver://localhost:1433;databaseName=NATRestaurant";
                Connection con = DriverManager.getConnection(concmd, "sa", "sa");
                
                con.createStatement().execute(cmd);
                con.close();
                String pid = (String) session.getAttribute("pid");
                response.sendRedirect("product.jsp?id="+pid);
            } catch (Exception ex) {
                
            }
        %>
    </body>
</html>
