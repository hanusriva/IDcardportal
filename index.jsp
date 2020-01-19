


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>Login</title>
        <link rel="stylesheet" href="css/bootstrap.min.css"/>
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
          <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <link rel="shortcut icon" href="images/logo.ico">
        </head>
    <body>
       
        <div class="container">
            <div class="col-sm-12">
                <div class="col-sm-2"></div>
                <div class="col-sm-8">
                   
                    <center>
                        <img src="images/download.png" style="height:250px;width:30%;margin-top:10%">
                    
                  
                 <form action="login_validate" method="post" style="margin-top:10%;width: 40%;">
                     <input type="text" placeholder="Username" class="form-control" name="user" required   ><br>
                <input  type="Password" placeholder="Password" class="form-control" name="password" required><br>
                <input type="submit" value="Login" class="btn btn-primary" style="width:30%;"> 
        
                    </form>
                    </center>
                    
                </div>
                
                <div class="col-sm-2"></div>
            </div>
            
       </div>
        
               
        
    </body>
</html>
