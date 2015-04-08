<%-- 
    Document   : add
    Created on : Mar 22, 2015, 9:21:55 PM
    Author     : Administrator
--%>


<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>

<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.io.DataInputStream"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.File"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>


<!DOCTYPE html>
<html>
    <head>
        <title>Thêm | quản lý món ăn</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600' rel='stylesheet' type='text/css'/>
        <link href='http://fonts.googleapis.com/css?family=Alegreya+SC:400,700' rel='stylesheet' type='text/css'/>
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
        <!--  jquery plguin -->
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <!--start manu -->
        <link href="css/flexy-menu.css" rel="stylesheet"/>
        <script type="text/javascript" src="js/flexy-menu.js"></script>
        <script type="text/javascript">$(document).ready(function() {
                $(".flexy-menu").flexymenu({speed: 400, type: "horizontal", align: "right"});
            });</script>
        <!--start slider -->
        <script src="js/responsiveslides.min.js"></script>
        <script>
            // You can also use "$(window).load(function() {"
            $(function() {
                // Slideshow 1
                $("#slider1").responsiveSlides({
                    maxwidth: 1600,
                    speed: 600
                });
            });
        </script>
    </head>
    <body>
        <!-- start sb-search -->
        <div id="sb-search" class="sb-search">
            <form action="search.jsp">
                <input class="sb-search-input" placeholder="Enter your search term..." type="text" value="" name="search" id="search">
                <input class="sb-search-submit" type="submit" value="">
                <span class="sb-icon-search"></span>
            </form>
        </div>
        <script src="js/classie.js"></script>
        <script src="js/uisearch.js"></script>
        <script>
            new UISearch(document.getElementById('sb-search'));
        </script>
        <!-- start header -->
        <div class="header">
            <div class="wrap">
                <div class="logo">
                    <a href="index.html"><img src="images/logo.jpg" alt="" /></a>
                </div>
                <div class="h_right">
                    <h4>Hỗ trợ khách hàng 24/7: <span>+84 1648 701 960         </span></h4>
                    <!-- start nav-->
                    <ul class="flexy-menu thick orange">
                        <li class="active">
                            <a  href="index.jsp">
                                <span class="color">Home</span>	
                                <i class="icon3"></i>
                            </a>
                        </li>
                        <%
                            Object checks = session.getAttribute("username");
                            if (checks != null) {
                        %>
                        <li>
                            <a href="pages.html">
                                <span>Tài khoản</span>	
                                <i class="icon2"></i>
                            </a>
                            <ul>
                                <li><a href="account.jsp">Quản lý tài khoản</a></li>
                                <li><a href="logout.jsp">Đăng xuất</a>  
                                    <%
                                        String ll = (String) session.getAttribute("level");
                                        if (ll.equals("admin")) {
                                            out.print("<li><a href=\"add.jsp\">Thêm món ăn mới</a> ");
                                        }
                                    %>
                                </li>

                            </ul>
                        </li>
                        <%
                        } else {
                        %>

                        <li>
                            <a href="login.jsp">
                                <span>Đăng nhập</span>	
                                <i class="icon3"></i>
                            </a>

                        </li>
                        <%
                            }

                        %>
                        <li class="last">
                            <a href="contact.jsp">
                                <span>Liện hệ</span>	
                                <i class="icon3"></i>
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="clear"></div>
            </div>
        </div>
        <!-- start slider -->
        <div class="slider">
            <div class="image-slider">
                <!-- Slideshow 1 -->
                <ul class="rslides" id="slider1">
                    <li><img src="images/slider1.jpg" alt=""></li>
                    <li><img src="images/slider2.jpg" alt=""></li>
                    <li><img src="images/slider3.jpg" alt=""></li>
                </ul>
                <!-- Slideshow 2 -->
            </div>
        </div>
        <!-- start main -->
        <%            String cmd = "select * from kindoffood ORDER BY id ASc";
            try {
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                String concmd = "jdbc:sqlserver://localhost:1433;databaseName=NATRestaurant";
                Connection con = DriverManager.getConnection(concmd, "sa", "sa");

                ResultSet rs = con.createStatement().executeQuery(cmd);


        %>
       
        
        <FORM action="addfood" method="post"  enctype="multipart/form-data">
            <table>
                <tr>
                    <td>
                        <pre>               <font size="5" color="red">Thêm món ăn mới</font></pre><br><br>
                        <pre>               Tên món ăn: <input type="text" name="name" value="" /></pre><br>
                        <pre>               Thông tin hiển thị: </pre>
                        <pre>               <textarea name="softinfo" rows="10" cols="80"></textarea></pre><br>
                        <pre>               Thông tin chi tiết: </pre>
                        <pre>               <textarea name="longinfo" rows="20" cols="80"></textarea></pre><br>
                        <pre>               Loại món ăn: <select name="kind">
                                <%                                                
                while (rs.next()) {
                                        out.println("<option value=\"" + rs.getString(1) + "\">" + rs.getString(2) + "</option>");
                                    }
                                    con.close();
                                %>
                                            </select>               Giá: <input type="text" name="price" value="" /> 000 đồng</pre><br>
                        <pre>               <input type="submit" value="Submit" name="Submit"  id="checkIn" class="btn btn-danger" /></pre>                        
                    </td>
                    <td>
                        <%
                                cmd="select * from food where kind=";
                                con = DriverManager.getConnection(concmd, "sa", "sa");
                                int i=0;
                                try
                                {
                                    
                                    
                                    
                        %>
                        <pre>               <font size="5" color="Blue">Các món ăn hiện có</font></pre><br>
                        
                        <pre>               <font size="3" color="Orange">1. Món khai vị</font></pre><br>
                        <%
                                    rs = con.createStatement().executeQuery(cmd+1);
                                    i=0;
                                    while(rs.next())
                                    {i++;%>
                        <pre>                           <font size="2" color="Green"><%=i%>. <a href="product.jsp?id=<%=rs.getString(1)%>"><%=rs.getString(2)%></a>       Giá: <%=rs.getString(7)%>.000 vnđ     <a href="editfood.jsp?id=<%=rs.getString(1)%>">Chỉnh sửa</a>       <a href="deletefood.jsp?id=<%=rs.getString(1)%>" >Xóa</a></font></pre><br>
                                    <%}
                        %>
                        <pre>               <font size="3" color="Orange">2. Món ăn chính</font></pre><br>
                        <%
                                    rs = con.createStatement().executeQuery(cmd+2);
                                    i=0;
                                    while(rs.next())
                                    {i++;%>
                        <pre>                           <font size="2" color="Green"><%=i%>. <a href="product.jsp?id=<%=rs.getString(1)%>"><%=rs.getString(2)%></a>       Giá: <%=rs.getString(7)%>.000 vnđ     <a href="editfood.jsp?id=<%=rs.getString(1)%>">Chỉnh sửa</a>       <a href="deletefood.jsp?id=<%=rs.getString(1)%>">Xóa</a></font></pre><br>
                                    <%}
                        %>
                        <pre>               <font size="3" color="Orange">3. Món tráng miệng</font></pre><br>
                        <%
                                    rs = con.createStatement().executeQuery(cmd+3);
                                    i=0;
                                    while(rs.next())
                                    {i++;%>
                       <pre>                           <font size="2" color="Green"><%=i%>. <a href="product.jsp?id=<%=rs.getString(1)%>"><%=rs.getString(2)%></a>       Giá: <%=rs.getString(7)%>.000 vnđ     <a href="editfood.jsp?id=<%=rs.getString(1)%>">Chỉnh sửa</a>       <a href="deletefood.jsp?id=<%=rs.getString(1)%>">Xóa</a></font></pre><br>
                                    <%}
                        %>
                        <pre>               <font size="3" color="Orange">4. Set Menu</font></pre><br>
                        <%
                                    rs = con.createStatement().executeQuery(cmd+4);
                                    i=0;
                                    while(rs.next())
                                    {i++;%>
                        <pre>                           <font size="2" color="Green"><%=i%>. <a href="product.jsp?id=<%=rs.getString(1)%>"><%=rs.getString(2)%></a>       Giá: <%=rs.getString(7)%>.000 vnđ     <a href="editfood.jsp?id=<%=rs.getString(1)%>">Chỉnh sửa</a>       <a href="deletefood.jsp?id=<%=rs.getString(1)%>">Xóa</a></font></pre><br>
                                    <%}
                        %>
                        <pre>               <font size="3" color="Orange">5. Thực đơn Buffet</font></pre><br>
                        <%
                                    rs = con.createStatement().executeQuery(cmd+5);
                                    i=0;
                                    while(rs.next())
                                    {i++;%>
                        <pre>                           <font size="2" color="Green"><%=i%>. <a href="product.jsp?id=<%=rs.getString(1)%>"><%=rs.getString(2)%></a>       Giá: <%=rs.getString(7)%>.000 vnđ     <a href="editfood.jsp?id=<%=rs.getString(1)%>">Chỉnh sửa</a>       <a href="deletefood.jsp?id=<%=rs.getString(1)%>">Xóa</a></font></pre><br>
                                    <%}
                        %>
                        <pre>               <font size="3" color="Orange">6. Thực đơn tiệc cưới</font></pre><br>
                        <%
                                    rs = con.createStatement().executeQuery(cmd+6);
                                    i=0;
                                    while(rs.next())
                                    {i++;%>
                        <pre>                           <font size="2" color="Green"><%=i%>. <a href="product.jsp?id=<%=rs.getString(1)%>"><%=rs.getString(2)%></a>       Giá: <%=rs.getString(7)%>.000 vnđ     <a href="editfood.jsp?id=<%=rs.getString(1)%>">Chỉnh sửa</a>       <a href="deletefood.jsp?id=<%=rs.getString(1)%>">Xóa</a></font></pre><br>
                                    <%}
                        %>
                        <%
                                    con.close();
                                }
                                catch(Exception ex)
                                {
                                    out.println(ex.getMessage());
                                }
                        %>
                    </td>
                </tr>
            </table>
        </form>                                 
                                            

        
                                            
        <%
            } catch (Exception ex) {
                out.println(ex.getMessage());
            }
        %>

        

        <!-- end main_content -->
        
        <!-- start span_of_4 -->
        <div class="span_of_4">
            <div class="span1_of_4">
                <span class="icon_1"></span>
                <h4>made with love</h4>
                <p>Lorem Ipsum is simply dummy text of the Lorem Ipsum has been when an unknown printer took  make a type specimen book.</p>
                <a href="details.html" class="btn">learn more</a>
            </div>
            <div class="span1_of_4">
                <span class="icon_2"></span>
                <h4>trendy design</h4>
                <p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form.</p>
                <a href="details.html" class="btn">learn more</a>
            </div>
            <div class="span1_of_4">
                <span class="icon_3"></span>
                <h4>user friendly</h4>
                <p>Lorem Ipsum is simply dummy text of the Lorem Ipsum has been when an unknown printer took  make a type specimen book.</p>
                <a href="details.html" class="btn">learn more</a>
            </div>
            <div class="span1_of_4">
                <span class="icon_4"></span>
                <h4>script effects</h4>
                <p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form.</p>
                <a href="details.html" class="btn">learn more</a>
            </div>
            <div class="clear"></div>
        </div>

    </body>
</html>
