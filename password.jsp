
<%@include file="sessioncheck.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Change Password</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
   <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script> 
   
    <link class="jsbin" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
<script class="jsbin" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script class="jsbin" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.0/jquery-ui.min.js"></script>
    
    <link rel="shortcut icon" href="images/logo.ico">
  <style>
        <style>
    span
        
        
        
        #backgroundImage{z-index: 1;}

#backgroundImage:before {
   content: "";
   position: absolute;
   z-index: -1;
   top: 0;
   bottom: 0;
   left: 0;
   right: 0;
   background-image: url(images/login-bg-orange.jpg);
    background-repeat: no-repeat;
    background-size: 100%;
    opacity: 0.4;
    filter:alpha(opacity=50);
  
 }

        
        
        
        
        {
            font-weight: 700;
            color: black;
        }
    
        th,td {
  border: 1px solid white;
     color: black;
      height: 30px;
            padding: 10px;
        
     
         
}
    table
    {
    text-align: center;
        font-weight: 700;
        
    }
    .span
    {
     color: white;
         font-weight: 700;
    }
        li
        {
            font-weight: bold;
            font-size: 17px;
            margin-top: 15%;
        }
       
    </style>
    
  </style>
  
     
      
      
   </head>
    
   <body id="backgroundImage">
          <div class="col-sm-12">
            <div class="col-sm-2"></div>
            <div class="col-sm-8" >
                <div class="col-sm-2">
                    <img src="images/iocllogo.jpg" style="height: 100px; width: 100px;">
                    
            </div>
                 <div class="col-sm-4">
                     <h2 style="float:right; margin-top:50px;;">IOCL ID Card Portal</h2>
                 </div>
            <div class="col-sm-6">
     <ul class="nav navbar-right navbar-nav">
         <li><a href="welcome_<%=type%>.jsp" style="color:#101E40"> Home </a></li>
         <li>  <a href="password.jsp" style="color:#101E40"> Change Password </a></li>
          <li><a href="logout" style="color:#101E40"> Logout   <span class="glyphicon glyphicon-log-out"></span></a></li>
        </ul>
            </div>
        </div>
      
            </div>
         <hr style="border: 1px solid black">
        
          
    <center>
        
        <form method="post" action="changepass">
            
<table id="t01" >
    <tbody class="ui-widget-content">
        <tr>
            
            <td>Employee ID</td>
            <td>
           <input type="text" name="empid" value=<%=user%> readonly="readonly" required="required">
           
           </td>
           
        </tr>
        <tr>
        <td>Old Password</td>
        <td><input name="oldpassword" type="password" id="OLDpwd" required="required"></td>
        </tr>
        <tr>
        <td>New Password</td>
        <td><input name="newpassword" type="password" id="newpassword" required="required">
        </td>
        </tr>
        <tr>
        <td>Confirm Password</td>
        <td><input name="conpassword" type="password" id="conpassword" required="required">
        </td>
        </tr>
        <tr>
    </tbody>
</table><br>

<input type="submit" name="Submit" class="btn btn-primary"  value="Save">
<input type="reset" class="btn btn-warning" value="Reset">
        <a href="logout" class="btn btn-danger">Logout</a>

</form>
        
    </center>
</body>
</html>
