/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Blob;
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
public class get_blob extends HttpServlet {

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
@Override

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
   
    String type=request.getParameter("n");
   
    Connection con=null;
    String eno=request.getParameter("en");
    ResultSet rs=null;

    PreparedStatement ps=null;
    try{
        con=DbCon.getcon();
    if(type.equals("pic"))
    {
        ps=con.prepareStatement("select e_pic from employee_master where e_no=?");
        
    }
    else if(type.equals("sign"))
    {
        ps=con.prepareStatement("select e_sign from employee_master where e_no=?");
        
    }
    ps.setString(1, eno);
    rs=ps.executeQuery();
    rs.next();
    Blob b=null;
    if(type.equals("pic"))
    {
        b=rs.getBlob("e_pic");
    }
    else if(type.equals("sign"))
    {
        b=rs.getBlob("e_sign");
    }
    response.setContentType("image/png");
        InputStream is=b.getBinaryStream();
        int length=(int)b.length();
int bufferSize=1024;
        OutputStream os=null;
        os=response.getOutputStream();
        byte buffer[]=new byte[length];
        while((length=is.read(buffer))!=-1)
                {
            os.write(buffer,0,length);
        }
        is.close();
        os.flush();
        
    }
     catch(Exception e){
        response.getWriter().print("connection failed "+e);
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
