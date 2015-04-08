<%-- 
    Document   : product
    Created on : Mar 22, 2015, 7:11:29 AM
    Author     : Administrator
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>




<html>
    <head>
        <title>Ơn giời NAT đây rồi | Trang chủ =))</title>
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
        <div class="main_bg">
            <div class="wrap">
                <div class="main">
                    <!-- start main_content -->
                    <%                        String kind = request.getParameter("kind");
                        String pagenumber = request.getParameter("pagenumber");
                        if (pagenumber == null) {
                            pagenumber = "1";
                        }
                        if (kind == null) {
                            kind = "1";
                        }

                        if (kind != null) {
                            String cmd1 = "select COUNT(*) as \'nhuan\' from food where kind=" + kind;
                            String cmd2 = "select * from food where kind=" + kind+" order by id desc";
                            try {
                                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                                String concmd = "jdbc:sqlserver://localhost:1433;databaseName=NATRestaurant";
                                Connection con = DriverManager.getConnection(concmd, "sa", "sa");

                                ResultSet rs = con.createStatement().executeQuery(cmd1);
                                if (rs.next()) {
                                    String ss = rs.getString(1);
                                    int total = Integer.parseInt(ss);

                                    ResultSet r = con.createStatement().executeQuery(cmd2);
                                    r.next();
                                    int i1 = (Integer.parseInt(pagenumber) * 3) - 2;
                                    int i2 = (Integer.parseInt(pagenumber) * 3) - 1;
                                    int i3 = (Integer.parseInt(pagenumber) * 3);
                    %>
                    <div class="content">
                        <%
                            if (total >= i1) {

                                while (r.getRow() != i1) {
                                    r.next();
                                }
                        %>
                        <div class="content_left">
                            <div class="grids">
                                <ul class="list">

                                    <li>

                                        <div class="grid_img">
                                            <a href="product.jsp?id=<%=r.getString(1)%>">
                                                <span class="next"> </span>
                                            </a>
                                            <img src="<%=r.getString(3)%>" alt="" />

                                        </div>	

                                    </li>
                                    <li class="top">
                                        <div class="grid_info">
                                            <a href="product.jsp?id=<%=r.getString(1)%>"><h3><%=r.getString(2)%></h3></a>
                                            <h4><%=r.getString(4)%></h4>  
                                            <br><p><FONT COLOR="red">Đơn giá: <%=r.getString(7)%>k</font></p>
                                        </div>						
                                    </li>
                                    <div class="clear"></div>
                                </ul>
                            </div>
                        </div>
                        <%
                            }

                        %>
                        <div class="content_right">
                            <div class="grids">
                                <%                                    if (total >= i2) {

                                        while (r.getRow() != i2) {
                                            r.next();
                                        }

                                %>
                                <ul class="list1">
                                    <li class="right">
                                        <div class="grid_info">
                                            <a href="product.jsp?id=<%=r.getString(1)%>"><h3><%=r.getString(2)%></h3></a>
                                            <h4><%=r.getString(4)%></h4>  
                                            <br><p><FONT COLOR="red">Đơn giá: <%=r.getString(7)%>k</font></p>
                                        </div>		
                                    </li>
                                    <li>
                                        <div class="grid_img">
                                            <a href="product.jsp?id=<%=r.getString(1)%>">
                                                <span class="next"> </span>
                                            </a>
                                            <img src="<%=r.getString(3)%>" alt="" />
                                        </div>						
                                    </li>
                                    <div class="clear"></div>
                                </ul>
                                <%
                                    }
                                %>

                                <%
                                    if (total >= i3) {

                                        while (r.getRow() != i3) {
                                            r.next();
                                        }

                                %>
                                <ul class="list1">
                                    <li>
                                        <div class="grid_img">
                                            <a href="product.jsp?id=<%=r.getString(1)%>">
                                                <span class="next"> </span>
                                            </a>
                                            <img src="<%=r.getString(3)%>" alt="" />
                                        </div>						
                                    </li>
                                    <li class="left">
                                        <div class="grid_info">
                                            <a href="product.jsp?id=<%=r.getString(1)%>"><h3><%=r.getString(2)%></h3></a>
                                            <h4><%=r.getString(4)%></h4>  
                                            <br><p><FONT COLOR="red">Đơn giá: <%=r.getString(7)%>k</font></p>
                                        </div>	
                                    </li>
                                    <div class="clear"></div>
                                </ul>
                                <%
                                    }
                                %>
                            </div>
                        </div>		
                        <div class="clear"></div>

                    </div>
                    <%
                                }
                                con.close();

                            } catch (Exception ex) {
                                out.println(ex.getMessage());
                            }
                        }
                    %>
                    <!-- start sidebar -->
                    <div class="sidebar top">	
                        <!---start-da-slider----->
                        <div id="da-slider" class="da-slider">
                            <div class="da-slide">
                                <h2>Truyền thống - hiện đại</h2>
                                <p>Nhà hàng NAT thiết kế theo phong cách vừa truyền thống vừa mang nét hiện đại.</p>
                                <a class="da-link" href="contact.jsp">Liên hệ </a>
                            </div>
                            <div class="da-slide">
                                <h2>Không gian độc đáo</h2>
                                <p>Nhà hàng NAT có kiến trúc hình tròn độc đáo, không gian xung quanh rộng rãi và thoáng đãng</p>
                                <a class="da-link" href="contact.jsp">Liên hệ </a>
                            </div>
                            <div class="da-slide">
                                <h2>Truyền thống - hiện đại</h2>
                                <p>Nhà hàng NAT thiết kế theo phong cách vừa truyền thống vừa mang nét hiện đại.</p>
                                <a class="da-link" href="contact.jsp">Liên hệ </a>
                            </div>
                            <div class="da-slide">
                                <h2>Không gian độc đáo</h2>
                                <p>Nhà hàng NAT có kiến trúc hình tròn độc đáo, không gian xung quanh rộng rãi và thoáng đãng</p>
                                <a class="da-link" href="contact.jsp">Liên hệ </a>
                            </div>			
                            <nav class="da-arrows">
                                <span class="da-arrows-prev"></span>
                                <span class="da-arrows-next"></span>
                            </nav>
                        </div>
                        <!---//End-da-slider----->
                        <!---strat da-slider scipt---->
                        <link rel="stylesheet" type="text/css" href="css/da_slider.css" />
                        <script type="text/javascript" src="js/modernizr.custom.28468.js"></script>
                        <script type="text/javascript" src="js/jquery.cslider.js"></script>
                        <script type="text/javascript">
            $(function() {

                $('#da-slider').cslider({
                    autoplay: true,
                    bgincrement: 450
                });

            });
                        </script>
                        <!---//end da-slider script---->
                        <h3>catogories</h3>
                        <ul class="s_nav">
                            <%
                                try
                                {
                                    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                                    String concmd = "jdbc:sqlserver://localhost:1433;databaseName=NATRestaurant";
                                    Connection con = DriverManager.getConnection(concmd, "sa", "sa"); 
                                    
                                    ResultSet rs = con.createStatement().executeQuery("select kind,COUNT(*) as 'nhuan' from food group by kind order by kind");
                                    String[] total= new String[6];
                                    for(int i=0;i<6; i++)
                                        total[i]=new String("0");
                                    int x=0;
                                    while(rs.next())
                                    {
                                       x=Integer.parseInt(rs.getString(1));
                                       total[x-1]=new String(rs.getString(2));
                                    }
                            %>
                            <li><a href="index.jsp?kind=1&pagenumber=1"><span>Món khai vị</span><label><%=total[0]%></label><div class="clear"></div></a></li> 
                            <li><a href="index.jsp?kind=2&pagenumber=1"><span>Món ăn chính</span><label><%=total[1]%></label><div class="clear"></div></a></li>
                            <li><a href="index.jsp?kind=3&pagenumber=1"><span>Món tráng miệng</span><label><%=total[2]%></label><div class="clear"></div></a></li>
                            <li><a href="index.jsp?kind=4&pagenumber=1"><span>Set Menu</span><label><%=total[3]%></label><div class="clear"></div></a></li>
                            <li><a href="index.jsp?kind=5&pagenumber=1"><span>Thực đơn Buffet</span><label><%=total[4]%></label><div class="clear"></div></a></li> 
                            <li><a href="index.jsp?kind=6&pagenumber=1"><span>Thực đơn tiệc cưới</span><label><%=total[5]%></label><div class="clear"></div></a></li>
                            <%
                                con.close();
                                }
                                catch(Exception ex)
                                {
                                    
                                }
                            %>
                        </ul>
                    </div>
                    <div class="clear"></div>	
                    <!-- end main_content -->

                    <%
                        int p = Integer.parseInt(pagenumber);

                        if (p>1) {
                    %>
                    <pre><br><br><br>                    <button onclick="window.location.href='index.jsp?kind=<%=kind%>&pagenumber=<%=p-1%>' " class="btn btn-danger">Quay lại trang trước</button>                 <button onclick="window.location.href='index.jsp?kind=<%=kind%>&pagenumber=<%=p+1%>' " class="btn btn-danger">Trang tiếp theo</button></pre>
                        <%
                            } else {
                             %>
                    <pre><br><br><br>                   <button onclick="window.location.href='index.jsp?kind=<%=kind%>&pagenumber=<%=p+1%>' " class="btn btn-danger">Trang tiếp theo</button></pre>         
                             <%
                             
                            }
                        %>
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

