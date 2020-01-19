
<%@include file="sessioncheck.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Pending Request</title>
           
  <link rel="shortcut icon" href="images/logo.ico">
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
   <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script> 
   
    
<script class="jsbin" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script class="jsbin" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.0/jquery-ui.min.js"></script>
    <script> 
   $.ajax({
       url:'get_pending_request',
       type:'post',
       success:function(data){
           $("#requests").html(data);
       }
       
       
   });
    
    
    function reas(){
        document.getElementById("reason").style.display='block';
    }
    
    
</script>

    <style>
   
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

        
        
        
        
        span{
            font-weight: 700;
            color: black;
        }
    
        th,td {
  border:none;
     color: black;
      height: 30px;
            padding: 30px;
        
     
         
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
          
        }
        
        th,td {
  border: 1px solid white;
     color: white;
      height: 30px;
            padding: 10px;
        
     
         
}
    table
    {
    text-align: center;
        font-weight: 700;
        
    }
       
    </style>
   
    </head>
    <body id="backgroundImage">
        
        
        <center> 
         <div class="col-sm-12">
            <div class="col-sm-2"></div>
            <div class="col-sm-8" >
                <div class="col-sm-2">
                    <img src="images/iocllogo.jpg" style="height: 100px; width: 100px;">
                    
            </div>
                 <div class="col-sm-4">
                     <h2 style="float:right; margin-top:50px;;">IOCL ID Card Portal</h2>
                 </div>
                <div class="col-sm-6" style="margin-top: 3%">
     <ul class="nav navbar-right navbar-nav">
         <li><a href="welcome_<%out.println(session.getAttribute("type").toString());%>.jsp" style="color:#101E40"> Home </a></li>
         <li>  <a href="password.jsp" style="color:#101E40"> Change Password </a></li>
          <li><a href="logout" style="color:#101E40"> Logout   <span class="glyphicon glyphicon-log-out"></span></a></li>
        </ul>
            </div>
        </div>
      
            </div>
            <%
      String eno="",name="",location="",designation="",blood_grp="",grade="";
      eno=request.getAttribute("eno").toString();
      name=request.getAttribute("name").toString();
      location=request.getAttribute("Location").toString();
      designation=request.getAttribute("Designation").toString();
      grade=request.getAttribute("Grade").toString();
      blood_grp=request.getAttribute("Blood Group").toString();
      
       
      
        
      %>
        
        
        <hr style="border: 1px solid black">
        
        <div class=" col-sm-12" style="margin-bottom: 1.5%">
            <div class="col-sm-3"></div>
            <div class="col-sm-7" style=" margin-top: 4%;">
                  
                      
                <div class="col-sm-2"></div>
            <div class="col-sm-7" style="background-color:#E46713; padding: 2%;border: 1px solid black" >
                 <div  class="col-sm-3">
                <img src="images/iocllogo.jpg" style="height: 80px;width: 60%; margin-left: 10%;">
                <img id="target" src="get_blob?n=pic&en=<%=eno%>" width="100px" height="100px" style="padding-top: 5%">
                     <img id="blah" src="get_blob?n=sign&en=<%=eno%>" width="120px" height="50px" style="padding-top: 10%">
                    
                </div>
                
<div style="background-color:#E46713" class="col-sm-9">
    
    <div><span class="span" style="margin-left: 9%;"> UPSO-1/HR/<%=eno%>/2019</span></div>

    <div style="border: 1px solid white; text-align: center;width: 97%">
        <span class="span"></span><br>
        <span class="span">INDIAN OIL CORPORATION LIMITED</span><br>
        <span class="span">Marketing Division</span>
        
    </div>
    <table>
  <tr>
    <td colspan="2">  Valid Upto</td>
    <td colspan="2">  Location</td> 
    
  </tr>
        <tr>
    <td colspan="2">Date</td>
    <td colspan="2"><%=location%></td> 
    
  </tr>
        
  <tr>
    <td>  Name</td>
      <td colspan="3"><%=name%></td>
    
  </tr>
   
        <tr>
     <td>   EMP.No.</td>     
        <td><%=eno%></td> 
        <td>   Blood Group</td> 
        <td><%=blood_grp%></td> 
         
        </tr>
</table>
 
                </div>
                
                   
                </div>
             
            </div>
        <div class="col-sm-2"></div>  
        
                 </div>
                               
        
              
                <form action="approve" method="post" style="display:inline" >
                               <input type="hidden" value='<%=eno%>' name="eno" class="btn btn-primary ">
                               <input type="Submit" value="Approve" style="margin-right: 2%;margin-left:4%"  class="btn btn-primary">
                           </form>
                               
                               
       
                                   
                               <input type="button" style="margin-right: 2%" onclick="reas()" value="Reject" class="btn btn-danger">
                             <div id="reason" style="display:none">
                                 <br>
                               
                                 <form action="rej" method="get" style="display: inline">
                                 <input type="text" required placeholder="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;           Please mention the Reason!"  class="form-control" name="reason" style="width:25%;margin-left:5% " >     
                                   <br>
                                                      <input type="hidden" value='<%=eno%>' name="eno">
                                                      <input type="submit" value="Submit" style="margin-left: 2%" class="btn btn-primary">
                          
                               </form>
                             </div>  
           
              
             </div>
     <div  class="col-sm-12">
            <div  class="col-sm-2"> </div>
               <div  class="col-sm-8">  
                  
                           
          
              <div  class="col-sm-2"> </div>
        </div>
            </center>     
    </body>
</html>
