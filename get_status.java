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
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author lenovo
 */
public class get_status extends HttpServlet {

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
        HttpSession sess=request.getSession();
        String eno=sess.getAttribute("user").toString();
        Connection con=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        String dh,hr,r="n";
        String s;
        String type=sess.getAttribute("type").toString();
        try{
        con=DbCon.getcon();
        ps=con.prepareStatement("select * from request where e_no=?");
        ps.setString(1,eno);
        rs=ps.executeQuery();
        if(rs.next())
        {
            dh=rs.getString("status_approver");
            hr=rs.getString("status_hr");
            if(dh.equals("P"))
            {
                s="A";
                request.setAttribute("status", s);
                request.setAttribute("remark",r);
            }
            else if(dh.equals("A"))
            {
                if(hr.equals("A"))
                {
                    s="C";
                request.setAttribute("status", s);
                request.setAttribute("remark",r);
        }
                else if(hr.equals("R"))
                        {
                             s="HR";
                             r=rs.getString("remark");
                request.setAttribute("status", s);
                request.setAttribute("remark",r);
                        }
                else if(hr.equals("P"))
                {
                    s="DH";
                request.setAttribute("status", s);
                request.setAttribute("remark",r);
                }
        }
             else if(dh.equals("R"))
            {
                 s="DH";
                             r=rs.getString("remark");
                request.setAttribute("status", s);
                request.setAttribute("remark",r);
            }
            RequestDispatcher rd=request.getRequestDispatcher("view_status.jsp");
            rd.forward(request, response);
            
        }
        else{
            out.print("<script>alert('No Request Found');location='welcome_"+type+".jsp';</script>");
        }
        }
        catch(Exception e){
        out.print("connection failed "+e);
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
