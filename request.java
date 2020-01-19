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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author lenovo
 */
@WebServlet(name = "request", urlPatterns = {"/request"})
public class request extends HttpServlet {

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
        Connection con=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        HttpSession sess=request.getSession();
        String eno=request.getParameter("request");
        String type=sess.getAttribute("type").toString();
        
        
        if(eno.equals("-1"))
        {
            out.print("<script> alert('Please select a request'); location='welcome_"+type+".jsp';</script>");
        }
        else if(eno.equals("-2"))
        {
            out.print("<script> alert('No Pending Request'); location='welcome_"+type+".jsp';</script>");
        }
        
        else
        {
        try
        {
            con=DbCon.getcon();
            ps=con.prepareStatement("select * from employee_master where e_no=?");
            ps.setString(1,eno);
            rs=ps.executeQuery();
            rs.next();
            request.setAttribute("eno", eno);
            request.setAttribute("name",rs.getString("e_name"));
            request.setAttribute("Location",rs.getString("e_location"));
            request.setAttribute("Designation",rs.getString("e_design"));
            request.setAttribute("Grade",rs.getString("grade"));
            request.setAttribute("Blood Group",rs.getString("blood_group"));
            
            
                RequestDispatcher rd=request.getRequestDispatcher("view_request.jsp");
                rd.forward(request,response);
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
            if(ps!=null)
            {
                ps.close();
                ps=null;
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

