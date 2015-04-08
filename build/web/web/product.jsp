<%-- 
    Document   : product
    Created on : Mar 30, 2015, 9:56:37 PM
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
        <title>Thông tin sản phẩm</title>
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
        <%            
            String id = request.getParameter("id");
            if(id != null)
                session.setAttribute("pid", id);
            String cmd = "select * from food where id=" + id;
            try {
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                String concmd = "jdbc:sqlserver://localhost:1433;databaseName=NATRestaurant;characterEncoding=UTF-8";
                Connection con = DriverManager.getConnection(concmd, "sa", "sa");

                ResultSet rs = con.createStatement().executeQuery(cmd);
                if (rs.next()) { 


        %>
        <br>
        <p class="nhuan1"><font size="5" color="red"><%=rs.getString(2)%></font></p><br>
        <p class="nhuan1"><%=rs.getString(4)%></p><br>
        <p class="nhuan1"><img src="<%=rs.getString(3)%>" alt="" style="width:400px;height:350px"></p><br>
        <p class="nhuan1"><%=rs.getString(5).replaceAll("\\n", "<br>")%></p><br>
        <%                con.close();
                } else {
                    
                    con.close();
                }
            } catch (Exception ex) {

            }
        %>

        <%
            String level = (String) session.getAttribute("level");
            cmd = "select * from vote where foodid=" + id + " order by id desc";
            try {
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                String concmd = "jdbc:sqlserver://localhost:1433;databaseName=NATRestaurant;characterEncoding=UTF-8";
                Connection con = DriverManager.getConnection(concmd, "sa", "sa");

                ResultSet rs = con.createStatement().executeQuery(cmd);
                if (rs.next()) {
                    int count = 0;
                    float total = 0;
                    int score = 0;

        %>

        <table class="vote">
            <tr><th>Ý kiến khách hàng</th><th></th><th></th> <%                
                    if (level != null) 
                    if (level.equals("admin"))
                        out.println("<th></th>");
                            %></tr>
                <%
                    do {
                        count++;
                        score = Integer.parseInt(rs.getString(5));
                        total += score;
                %>
            <tr>
                <td><%=rs.getString(2)%>:</td>
                <td><%=rs.getString(4)%></td>
                <td align="right"><%=score%>đ</td>
                <%                
                    if (level != null) 
                    if (level.equals("admin"))
                    {
                        %>
                        <td><a onclick="return confirm('Bạn có muốn xóa ý kiến của tài khoản <%=rs.getString(2)%> không')" href="deletevote.jsp?id=<%=rs.getString(1)%>">Delete</a></td>
                        <%
                    }
                            %>
            </tr>
            <%
                } while (rs.next());
                    String dtb = String.format("%.2f", total/(float)count);
            %>
            <tr>
                <td></td>
                <td>Điểm trung bình: </td>
                <td align="right"><%=dtb%>đ</td>
                <%                
                    if (level != null) 
                    if (level.equals("admin"))
                        out.println("<td></td>");
                            %>
            </tr>
        </table>

        <%
                }
                con.close();
            } catch (Exception ex) {
            }
        %>

        <%
            if (level != null)
                if (level.equals("user") || level.equals("admin")) {
        %>
        <form class="nhuan1">
            <p>Ý kiến khách hàng:</p>
            <p><textarea name="comment" rows="5" cols="30"></textarea></p>
            <p>Cho điểm: <select name="score">
                    <option value="5">5</option>
                    <option value="4">4</option>
                    <option value="3">3</option>
                    <option value="2">2</option>
                    <option value="1">1</option>
                </select></p>
            <p><input type="submit" value="Submit" name="Submit" /><p>
                <br> <br><br>
                
                <%
                    if(level.equals("admin"))
                    {
                        %>
                        <a href="editfood.jsp?id=<%=id%>">Chỉnh sửa</a>       <a href="deletefood.jsp?id=<%=id%>" >Xóa</a>
                <%
                    }
                %>
        </form>
        <%
                }

            String b = request.getParameter("Submit");
            if (b != null) {
                String productid = (String) session.getAttribute("pid");
                String username=(String) session.getAttribute("username");
                String comment = new String(request.getParameter("comment").getBytes("ISO-8859-1"), "UTF-8");
                String score = request.getParameter("score");
                
                cmd="insert into vote values(\'"+username+"\', "+productid+", N\'"+comment+"\', "+score+")";
                try
                {
                    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                    String concmd = "jdbc:sqlserver://localhost:1433;databaseName=NATRestaurant;characterEncoding=UTF-8";
                    Connection con = DriverManager.getConnection(concmd, "sa", "sa");
                    con.createStatement().execute(cmd);
                    con.close();
                    response.sendRedirect("product.jsp?id="+productid);
                }
                catch(Exception ex)
                {
                    
                }
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
