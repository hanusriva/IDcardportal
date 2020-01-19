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
import java.sql.SQLException;
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
@WebServlet(name = "changepass", urlPatterns = {"/changepass"})
public class changepass extends HttpServlet {

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String empno,oldpwd,newpwd,conpwd;
        Connection con=null;
        PreparedStatement ps=null;;
        ResultSet rs=null;
        HttpSession sess=request.getSession();
        String type=sess.getAttribute("type").toString();
        try
        {
            
        
        empno=request.getParameter("empid");
        oldpwd=request.getParameter("oldpassword");
        newpwd=request.getParameter("newpassword");
        conpwd=request.getParameter("conpassword");
        String err="";
        int flag=0;
        
        con=DbCon.getcon();
        ps=con.prepareStatement("select * from login_users where e_no=? and password=? ");
        ps.setString(1, empno);
        ps.setString(2, oldpwd);
        
        rs=ps.executeQuery();
        if(rs.next())
        {
            if(newpwd.equals(conpwd))
            {
                if(newpwd.length()<6)
                {
                    err="Password cannot be less than 6 characters";
                    flag=1;

                }
                else
                {
                    ps=null;
                    ps=con.prepareStatement("update login_users set password =? where e_no=?");
                    ps.setString(1,newpwd);
                    ps.setString(2,empno);
                    ps.executeQuery();
                    
                    out.print("<script> alert('Password changed successfully!! ');location='welcome_"+type+".jsp';</script>");
                            
                }
            }
            else
            {
                err="Passwords does not match";
                    flag=1;
              
            }
        }
        else{
              err="Old password incorrect";
                    flag=1;

       }
        if(flag==1)
        {
              out.print("<script> alert('"+err+"');location='password.jsp';</script>");
        }
        }
        catch(Exception e)
        {
            out.println("Connection Failed.. Try again! "+ e);
        }
        
        finally
                {
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
                        out.print(e.toString());
                    }
                }
        
            
            
        
    
        
        
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
