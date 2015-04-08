/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;

/**
 *
 * @author Administrator
 */
public class addfood extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet addfood</title>");
            out.println("</head>");
            out.println("<body>");
            String productname = "";
            String softinfo = "";
            String longinfo = "";
            String kind = "";
            String price = "";

            DateFormat tipe = new SimpleDateFormat("MM/dd/yyyy");
            Calendar cal = Calendar.getInstance();
            String date = tipe.format(cal.getTime());
            

            try {
                List<FileItem> items = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
                for (FileItem item : items) {
                    if (item.isFormField()) {
                        // Process regular form field (input type="text|radio|checkbox|etc", select, etc).
                        String fieldName = item.getFieldName();
                        String fieldValue = item.getString();
                        

                        if (fieldName.equals("name")) {
                            productname = new String(fieldValue.getBytes("ISO-8859-1"), "UTF-8");
                        } else if (fieldName.equals("softinfo")) {
                            softinfo = new String(fieldValue.getBytes("ISO-8859-1"), "UTF-8");
                        } else if (fieldName.equals("longinfo")) {
                            longinfo = new String(fieldValue.getBytes("ISO-8859-1"), "UTF-8");
                        } else if (fieldName.equals("kind")) {
                            kind = new String(fieldValue.getBytes("ISO-8859-1"), "UTF-8");
                        } else if (fieldName.equals("price")) {
                            price = new String(fieldValue.getBytes("ISO-8859-1"), "UTF-8");
                        }

                    } else {
                        // Process form file field (input type="file").
                        String fieldName = item.getFieldName();
                        String fileName = FilenameUtils.getName(item.getName());
                        InputStream fileContent = item.getInputStream();

                        // ... (do your job here)
                    }
                }
            } catch (Exception e) {
                throw new ServletException("Cannot parse multipart request.", e);
            }

            boolean check = true;
            if (productname == "" || softinfo == "" || longinfo == "") {
                check = false;
            }
            try {
                int checkprice = Integer.parseInt(price);
            } catch (Exception ex) {
                check = false;
            }
            if (check) {
                    String cmd="insert into food values(N\'"+productname+"',\'\',N\'"+softinfo+"\',N\'"+longinfo+"\',"+kind+","+price+",\'"+date+"\')";
                    try
                    {
                        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                        String concmd = "jdbc:sqlserver://localhost:1433;databaseName=NATRestaurant";
                        Connection con = DriverManager.getConnection(concmd, "sa", "sa");
                        
                        con.createStatement().execute(cmd);
                        ResultSet rs = con.createStatement().executeQuery("select * from food order by id desc");
                        rs.next();
                        
                        HttpSession session = request.getSession();
                        session.setAttribute("id", rs.getString(1));
                        con.close();
                        response.sendRedirect("addimage.jsp");
                    }
                    catch(Exception ex)
                    {
                        
                    }
            }
            else
            {
                out.println("Nhập lại các giá trị");
                
            }
            out.println("</body>");
            out.println("</html>");
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
