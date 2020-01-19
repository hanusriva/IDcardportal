
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
   
    <link class="jsbin" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
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
    
</script>
    
<script>
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
   background-image: url(login-bg-orange.jpg);
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
       
    </style>
   
    </head>
    <body id="backgroundImage">
        
        
        
         <div class="col-sm-12">
            <div class="col-sm-2"></div>
            <div class="col-sm-8" >
                <div class="col-sm-2">
                    <img src="iocllogo.jpg" style="height: 100px; width: 100px;">
                    
            </div>
                 <div class="col-sm-4">
                     <h2 style="float:right; margin-top:50px;;">IOCL ID Card Portal</h2>
                 </div>
            <div class="col-sm-6">
     <ul class="nav navbar-right navbar-nav">
         <li><a href="welcome_<%out.println(session.getAttribute("type").toString());%>.jsp" style="color:#101E40"> Home </a></li>
         <li>  <a href="password.jsp" style="color:#101E40"> Change Password </a></li>
          <li><a href="logout" style="color:#101E40"> Logout   <span class="glyphicon glyphicon-log-out"></span></a></li>
        </ul>
            </div>
        </div>
      
            </div>
          
        
        
        <hr style="border: 1px solid black">
        
        <div class=" col-sm-12">
            <div class="col-sm-2"></div>
            <div class="col-sm-8" style="border: 1px solid black; margin-top: 4%; padding-bottom: 10px;">
                <ol >
                    <li >
                        
                        <%
      String eno="",name="",location="",designation="",blood_grp="",grade="";
      eno=request.getAttribute("eno").toString();
      name=request.getAttribute("name").toString();
      location=request.getAttribute("Location").toString();
      designation=request.getAttribute("Designation").toString();
      grade=request.getAttribute("Grade").toString();
      blood_grp=request.getAttribute("Blood Group").toString();
      
       
      
        
      %>
      <table>
          <tr>
              <td>
                  
                  <%=eno%>
                  
              </td>
              <td>
                  
                  <%=name%>
                  
              </td>
              <td>
                  
                  <%=location%>
                  
              </td>
              <td>
                  
                  <%=designation%>
                  
              </td>
              <td>
                  
                  <%=grade%>
                  
              </td>
              <td>
                  
                   <%=blood_grp%>
                  
              </td>
          </tr>
          
          
          
          
          
      </table>
     
      
      
      
      
     
      
                        
                    </li>
                  
                </ol>
                   <center>
                       <div style="padding-top: 10px;">
                           <form action="approve" method="post" style="display: inline">
                               <input type="hidden" value='<%=eno%>' name="eno">
                               <input type="Submit" value="Approve" class="btn btn-primary">
                           </form>
                               
                               
       
                                   
                               <input type="button" onclick="reas()" value="Reject" class="btn btn-danger">
                             <div id="reason" style="display: none">
                                 <br>
                               
                                 <form action="rej" method="get" style="display: inline">
                                 <input type="text" required placeholder="Please mention the Reason!" class="form-control" name="reason" style="width:50%" >     
                                   <br>
                                                      <input type="hidden" value='<%=eno%>' name="eno">
                                 <input type="submit" value="submit" class="btn btn-primary">
                          
                               </form>
                             </div>
          
          
                   </center>
                               

                   </div>
                 </div>
                               
                
            <div class="col-sm-2"></div>    
                
           
            
             </div>
        
        
        
        
        
      
      <form>
          
        
          
          
          
          
      </form>
      
      
      
    </body>
</html>
