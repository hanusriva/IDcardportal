/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author lenovo
 */
public class login_validate extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
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
        String user,pass,type;
        user=request.getParameter("user");
        pass=request.getParameter("password");
        
        Connection con=null;
        PreparedStatement p=null;
        ResultSet rs=null;
        
        
        try{
            
            con=DbCon.getcon();
            p=con.prepareStatement("select * from login_users where e_no=? and password=?");
            p.setString(1,user);
            p.setString(2,pass);
            
            rs=p.executeQuery();
            
            if(rs.next())
            {
                type=rs.getString("type");
                HttpSession sess=request.getSession();
                sess.setAttribute("user",user);
                sess.setAttribute("type",type);
               response.sendRedirect("welcome_"+type+".jsp");
            }
            else
            {
                out.print("<script>");
                out.print("alert('Invalid Credentials');");
                out.print("location='index.jsp';");
                out.print("</script>");
            }
        }
        
        catch(Exception e)
        {
            out.println("Could not Connect! PLease try later! "+ e);
        }
        
        finally{
            try{
            if(con!=null)
            {
                con.close();
                con=null;
            }
            if(p!=null)
            {
                p.close();
                p=null;
            }
            if(rs!=null)
            {
                rs.close();
                rs=null;
            }
            }
            catch(Exception e)
            {
                
            }
            out.close();
        }
    }
        
        
        
        
        
   

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
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
     * Handles the HTTP
     * <code>POST</code> method.
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
