<%-- 
    Document   : search
    Created on : Mar 24, 2015, 12:30:37 AM
    Author     : Administrator
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
    <head>
        <title>Tìm kiếm sản phẩm</title>
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
        <%                String id = new String(request.getParameter("search").getBytes("ISO-8859-1"), "UTF-8");
            String cmd = "select * from food where name like N\'%" + id + "%\'";
            try {
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                String concmd = "jdbc:sqlserver://localhost:1433;databaseName=NATRestaurant";
                Connection con = DriverManager.getConnection(concmd, "sa", "sa");

                ResultSet rs = con.createStatement().executeQuery(cmd);
                if (rs.next()) {
        %>
        <table class="nhuan2">
            <%
                do {
            %>
            <tr>
                <td><a href="product.jsp?id=<%=rs.getString(1)%>"><img src="<%=rs.getString(3)%>" alt="j.jsp" height="300" width="350"></a></td>
                <td><b><%=rs.getString(2)%></b> <br><br> <%=rs.getString(4)%> </td>

            </tr>
            <%

                } while (rs.next());
            %>
        </table>
        <%
                }
            } catch (Exception ex) {

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