/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Scanner;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author lenovo
 */
@MultipartConfig
public class apply extends HttpServlet {

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
        Connection con=null;
        PreparedStatement ps=null;
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        Part bg=request.getPart("bg");
        ResultSet rs=null;
        HttpSession  sess=request.getSession();
        String type=sess.getAttribute("type").toString();
        Scanner sc=new Scanner(bg.getInputStream());
        String bldg=sc.nextLine();
        
        if(bldg.equals("-1"))
        {
            out.print("<script>alert('Please select blood group');location='welcome_"+type+".jsp';</script>");
        }
        else{
        Part pic=request.getPart("src");
        Part sign=request.getPart("sign");
        String eno=sess.getAttribute("user").toString();
       try{
           con=DbCon.getcon();
           ps=con.prepareStatement("select * from request where e_no=?");
           ps.setString(1, eno);
           rs=ps.executeQuery();
           if(rs.next())
           {
               out.print("<script>alert('A request already exists');location='get_status';</script>"); 
           }
           else{
               ps=null;
               rs=null;
           ps=con.prepareStatement("update employee_master set e_pic=?,e_sign=?,blood_group=? where e_no=?");
           ps.setBinaryStream(1, pic.getInputStream(),(int)pic.getSize());
           ps.setBinaryStream(2, sign.getInputStream(),(int)sign.getSize());
           ps.setString(3, bldg);
           ps.setString(4, eno);
           ps.executeQuery();
           ps=null;
           String ename="";
           ps=con.prepareStatement("select * from employee_master where e_no=?");
           ps.setString(1, eno);
           rs=ps.executeQuery();
           rs.next();
           ename=rs.getString("e_name");
           long mil=System.currentTimeMillis();
           Date date=new Date(mil);
           String approver="";
           ps=null;
           ps=con.prepareStatement("select * from employee_master where psa_code=(select psa_code from employee_master where e_no=?) and e_location=(select e_location from employee_master where e_no=?) and grade like 'A%' order by grade desc");
           ps.setString(1, eno);
           ps.setString(2, eno);
           rs=null;
           rs=ps.executeQuery();
           rs.next();
           approver=rs.getString("e_no");
           ps=null;
           ps=con.prepareStatement("insert into request(e_no,e_name,request_date,approver,status_approver,status_HR) values(?,?,?,?,?,?)");
           ps.setString(1, eno);
           ps.setString(2, ename);
           ps.setDate(3, date);
           ps.setString(4, approver);
           ps.setString(5,"P");
           ps.setString(6, "P");
           ps.executeQuery();
            out.print("<script>alert('Request Generated');location='get_status';</script>");
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
