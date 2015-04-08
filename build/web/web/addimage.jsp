<%-- 
    Document   : addimage
    Created on : Mar 23, 2015, 3:00:33 PM
    Author     : Administrator
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Upload ảnh :v</title>
    </head>
    <body>
        <%
            String id=(String)session.getAttribute("id");
            String cmd = "select * from food where id="+id;
            try {
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                String concmd = "jdbc:sqlserver://localhost:1433;databaseName=NATRestaurant";
                Connection con = DriverManager.getConnection(concmd, "sa", "sa");

                ResultSet rs = con.createStatement().executeQuery(cmd);
                if (rs.next()) {
        %>
        <table border="3">
            <tr>
                <td>ID</td>
                <td>Tên món ăn</td>
                <td>Giá</td>
            </tr>
            <tr>
                <td><%=rs.getString(1)%></td>
                <td><%=rs.getString(2)%></td>
                <td><%=rs.getString(7)%></td>
            </tr>
        </table><br><br>


        <form name="uploadForm" action="addimage.jsp" enctype="multipart/form-data" method="post">
            <input type="file" name="file"/>
            <input TYPE=Button name='Upload' Value='Upload' onClick="uploadForm.Upload.value = 'Uploading...';
                    document.uploadForm.action = 'addimage.jsp';
                    document.uploadForm.submit()" class="btn btn-danger">
        </form>
        <%
            response.setContentType("text/html");
            response.setHeader("Cache-control", "no-cache");

            String err = "<br>Tải hình ảnh hiển thị cho món ăn";
            
            String[] duongdan=request.getRealPath("/").replace('\\', '/').split("/");
            String newpath="";
            for(int i=0; i<duongdan.length-2;i++)
            {
                newpath+=duongdan[i]+"/";
            }
            newpath+="web/web/images/data/"+rs.getString(6)+"/";
            String fileOutPath = newpath;         
            String lastFileName = "";

            String contentType = request.getContentType();
            String boundary = "";
            final int BOUNDARY_WORD_SIZE = "boundary=".length();
            if (contentType == null || !contentType.startsWith("multipart/form-data")) {
                
            } else {
                boundary = contentType.substring(contentType.indexOf("boundary=") + BOUNDARY_WORD_SIZE);
                boundary = "--" + boundary;
                try {
                    javax.servlet.ServletInputStream sis = request.getInputStream();
                    byte[] b = new byte[1024];
                    int x = 0;
                    int state = 0;
                    String name = null, fileName = null, contentType2 = null;
                    java.io.FileOutputStream buffer = null;
                    while ((x = sis.readLine(b, 0, 1024)) > -1) {
                        String s = new String(b, 0, x);
                        if (s.startsWith(boundary)) {
                            state = 0;
//out.println("name="+name+"<br>");
//out.println(fileName+"<br>");

                            name = null;
                            contentType2 = null;
                            fileName = null;

                        } else if (s.startsWith("Content-Disposition") && state == 0) {
                            state = 1;
                            if (s.indexOf("filename=") == -1) {
                                name = s.substring(s.indexOf("name=") + "name=".length(), s.length() - 2);
                            } else {
                                name = s.substring(s.indexOf("name=") + "name=".length(), s.lastIndexOf(";"));
                                fileName = s.substring(s.indexOf("filename=") + "filename=".length(), s.length() - 2);
                                if (fileName.equals("\"\"")) {
                                    fileName = null;
                                } else {
                                    String userAgent = request.getHeader("User-Agent");
                                    String userSeparator = "/";  // default
                                    if (userAgent.indexOf("Windows") != -1) {
                                        userSeparator = "\\";
                                    }
                                    if (userAgent.indexOf("Linux") != -1) {
                                        userSeparator = "/";
                                    }
                                    fileName = fileName.substring(fileName.lastIndexOf(userSeparator) + 1, fileName.length() - 1);
                                    if (fileName.startsWith("\"")) {
                                        fileName = fileName.substring(1);
                                    }
                                }
                            }
                            name = name.substring(1, name.length() - 1);
                            if (name.equals("file")) {
                                if (buffer != null) {
                                    buffer.close();
                                }
                                lastFileName = fileName;
                                buffer = new java.io.FileOutputStream(fileOutPath + fileName);
                            }
                        } else if (s.startsWith("Content-Type") && state == 1) {
                            state = 2;
                            contentType2 = s.substring(s.indexOf(":") + 2, s.length() - 2);
                        } else if (s.equals("\r\n") && state != 3) {
                            state = 3;
                        } else {
                            if (name.equals("file")) {
                                buffer.write(b, 0, x);
                            }
                        }
                    }
                    String imagepath="images/data/"+rs.getString(6)+"/"+lastFileName;
                    cmd = "update food set image=\'"+imagepath+"\' where id="+rs.getString(1);
                    con.createStatement().execute(cmd);
                    response.sendRedirect("add.jsp");
                    sis.close();
                    buffer.close();
                } catch (java.io.IOException e) {
                    err = e.toString();
                }
            }
            boolean ok = err.equals("");
            if (!ok) {
                out.println(err);
            } else {
        %>
        <SCRIPT language="javascript">
            //history.back(1)
            alert('Uploaded <%=lastFileName%>');
            //window.location.reload(false)
        </SCRIPT>
        <%
            }
        %>

        <%
                    con.close();
                }
            } catch (Exception ex) {

            }
        %>
        <br><a href="index.jsp">Bấm vào đây để trở về trang chủ phát nào</a>
    </body>
</html>
