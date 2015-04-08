<%-- 
    Document   : deleteaccount
    Created on : Mar 24, 2015, 1:29:37 AM
    Author     : Administrator
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
            String id = request.getParameter("username");
            String cmd = "delete account where username=\'" + id+"\'";
            try {
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                String concmd = "jdbc:sqlserver://localhost:1433;databaseName=NATRestaurant";
                Connection con = DriverManager.getConnection(concmd, "sa", "sa");
                
                con.createStatement().execute(cmd);
                con.close();
                
                response.sendRedirect("account.jsp");
            } catch (Exception ex) {
                response.sendRedirect("account.jsp");
            }
        %>
    </body>
</html>
