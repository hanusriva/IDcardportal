+/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;
import Controller.DbCon;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
@WebServlet(urlPatterns = {"/approve"})
public class approve extends HttpServlet {

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
        String eno="",ename="",r_date="",approver="",sts_DH="",sts_HR="",remark="";
        Connection con=null;
        PreparedStatement ps=null;
        HttpSession sess=request.getSession();
        String type=sess.getAttribute("type").toString();
        ResultSet rs=null;
        
        try 
        {
            eno=request.getParameter("eno");
            con= DbCon.getcon();
            if(type.equals("HR"))
            {
            ps=con.prepareStatement("update request set status_HR='A',approval_date=? where e_no=?");
            
            long mil=System.currentTimeMillis();
            Date date=new Date(mil);
            ps.setDate(1,date);
              ps.setString(2,eno);
            }
            else if(type.equals("DH"))
            {
            ps=con.prepareStatement("update request set status_approver='A' where e_no=?");
              ps.setString(1,eno);
            }
          
            ps.executeQuery();
            
            out.println("<Script> alert('Request Approved'); location='welcome_"+type+".jsp';</Script>");
            
          
            
        } catch(Exception e)
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
