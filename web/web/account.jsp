<%-- 
    Document   : account
    Created on : Mar 22, 2015, 6:36:17 PM
    Author     : Administrator
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Quản lý tài khoản</title>
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
        <%            if (session.getAttribute("username") != null) {
        %>

    <center><font size="5" color="red">Thay đổi thông tin cá nhân</font></center><br>
        <%
            //request.setCharacterEncoding("UTF-8");
            String username = (String) session.getAttribute("username");
            String p = "";
            String cmd = "select * from account where username=\'" + username + "\'";
            try {
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                String concmd = "jdbc:sqlserver://localhost:1433;databaseName=NATRestaurant";
                Connection con = DriverManager.getConnection(concmd, "sa", "sa");

                ResultSet rs = con.createStatement().executeQuery(cmd);
                rs.next();
                p = rs.getString(2);

        %>

    <center><form>

            <table>
                <tr><td>Tên đăng nhập:</td><td><%=rs.getString(1)%></td></tr>
                <tr><td>Mật khẩu mới:</td><td><input type="password" name="password1" value="" /></td></tr>
                <tr><td>Nhập lại mật khẩu mới:  </td><td><input type="password" name="password2" value="" /></td></tr>
                <tr><td>Mail:</td><td><input type="text" name="mail" value="<%=rs.getString(3)%>" /></td></tr>
                <tr><td>Địa chỉ:</td><td><input type="text" name="address" value="<%=rs.getString(4)%>" /></td></tr>
                <tr><td>Điện thoại:</td><td><input type="text" name="phone" value="<%=rs.getString(5)%>" /></td></tr>
                <tr><td><input type="submit" value="Save" name="Save" /></td></tr>
            </table>

        </form></center>
        <%
                con.close();
            } catch (Exception ex) {
                out.println(ex.getMessage());
            }
            String b = request.getParameter("Save");
            if (b != null) {
                boolean check = true;
                String password1 = request.getParameter("password1");
                String password2 = request.getParameter("password2");
                String mail = request.getParameter("mail");
                String address = new String(request.getParameter("address").getBytes("ISO-8859-1"), "UTF-8");
                String phone = request.getParameter("phone");

                if (!(password1.equals(password2))) {
                    check = false;
                    out.print("<pre>           Nhập lại mật khẩu</pre>");
                }
                if (password1 == null || password1.trim() == "") {
                    password1 = p;
                }
                if (mail.trim() == "" || mail == null) {
                    check = false;
                    out.print("<pre>           Mai không dc để trống</pre>");
                }
                if (address.trim() == "" || address == null) {
                    check = false;
                    out.print("<pre>           Địa chỉ không dc để trống</pre>");
                }
                if (phone.trim() == "" || phone == null) {
                    check = false;
                    out.print("<pre>           Điện thoại không dc để trống</pre>");
                }
                if (check) {
                    cmd = "update account set password=\'" + password1 + "\',mail=\'" + mail + "\',address=N\'" + address + "\',phone=\'" + phone + "\' where username=\'" + username + "\'";
                    try {
                        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                        String concmd = "jdbc:sqlserver://localhost:1433;databaseName=NATRestaurant;characterEncoding=UTF-8";
                        Connection con = DriverManager.getConnection(concmd, "sa", "sa");
                        con.createStatement().execute(cmd);
                        out.print("<pre>           Lưu thành công, tải lại trang để cập nhật</pre>");
                        con.close();
                        response.sendRedirect("account.jsp");
                    } catch (Exception ex) {
                        out.println(ex.getMessage());
                    }

                }
            }

            String level = (String) session.getAttribute("level");
            if (level.equals("admin")) {
        %>
    <br><br>
    <center><font size="5" color="red">Quản lý tài khoản (Quyền quản trị)</font></center>  

    <%
        cmd = "select * from account where level=\'user\'";
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String concmd = "jdbc:sqlserver://localhost:1433;databaseName=NATRestaurant;characterEncoding=UTF-8";
            Connection con = DriverManager.getConnection(concmd, "sa", "sa");

            ResultSet rs = con.createStatement().executeQuery(cmd);
            if (rs.next()) {
    %>
    <center>
        <style type="text/css">
            table.bottomBorder { border-collapse:collapse; }
            table.bottomBorder td, table.bottomBorder th { border-bottom:1px dotted black;padding:5px; width: 150px;text-align: left;}
        </style>
        <table class="bottomBorder">
            <tr>
                <th>STT</th>
                <th>Tên tài khoản</th>
                <th>Mail</th>
                <th>Địa chỉ</th>
                <th>Điện thoại</th>
                <th>  </th>
            </tr>
            <%
                int i = 0;
                do {
                    i++;
            %>
            <tr>
                <td><%=i%></td>
                <td><%=rs.getString(1)%></td>
                <td><%=rs.getString(2)%></td>
                <td><%=rs.getString(4)%></td>
                <td><%=rs.getString(5)%></td>

                <td><a onclick="return confirm('Bạn có muốn xóa tài khoản <%=rs.getString(2)%> không')" href="deleteaccount.jsp?username=<%=rs.getString(1)%>">Delete</a></td>
            </tr>
            <%
                } while (rs.next());
            %>
        </table>
    </center>
    <%
                con.close();
            } else {
                    out.println("<center><p>Chưa có tài khoản nào đăng kí</p></center>");
                }
            } catch (Exception ex) {
                out.println(ex.getMessage());
            }
        }
    %>


    <%
        } else
            response.sendRedirect("index.jsp");
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

