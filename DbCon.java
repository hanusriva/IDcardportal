/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.sql.*;

/**
 *
 * @author lenovo
 */
public class DbCon {
    public static Connection con;
    
    public static Connection getcon()
    {
        try{
        Class.forName("oracle.jdbc.driver.OracleDriver");
        con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/xe","","");
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return con;
                
               
     }
    
    
}
