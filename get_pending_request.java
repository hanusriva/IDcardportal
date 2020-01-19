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
public class get_pending_request extends HttpServlet {

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
        String data="";
        data="<option value='-1'>Pending Requests</option>";
        int flag=0;
        try{
        con=DbCon.getcon();
        HttpSession sess=request.getSession();
        String type=sess.getAttribute("type").toString();
        if(type.equals("HR"))
        {
        ps=con.prepareStatement("select * from request where status_hr='P' and status_approver='A'");
        }
        else if(type.equals("DH"))
        {
            String eno=sess.getAttribute("user").toString();
        ps=con.prepareStatement("select * from request where status_approver='P' and approver=?");
        ps.setString(1, eno);
            
        }
        rs=ps.executeQuery();
        while(rs.next()){
        flag=1;    
        String eno=rs.getString("e_no");
        String name=rs.getString("e_name");
        data=data+"<option value='"+eno+"'>"+name+"</option>";
            
        }
        
        if(flag==0){
            data=data+"<option value='-2'>No Pending Requests</option>";
        }
        out.print(data);
        }
        
        catch(Exception e)
        {
        out.println("Connection Failed! "+e);
     
        }
        finally{
            try{
            if(con!=null){
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
                out.println(e.toString());
                        
                        
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
