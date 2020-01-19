
<%@include file="sessioncheck.jsp"%>
<%
String s="";String r="";
s=request.getAttribute("status").toString();
r=request.getAttribute("remark").toString();

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Status!</title>
     <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 <link rel="shortcut icon" href="images/logo.ico">
<title>Status!</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  
  
  
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
  
   <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script> 
   
    <link class="jsbin" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
<script class="jsbin" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script class="jsbin" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.0/jquery-ui.min.js"></script>
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

        
        
        
        
    span    {
            font-weight: 700;
            color: black;
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
    .span
    {
     color: white;
         font-weight: 700;
    }
        
  .progressbar {
      counter-reset: step;
  }
  .progressbar li {
      list-style-type: none;
      width: 25%;
      float: left;
      font-size: 12px;
      position: relative;
      text-align: center;
      text-transform: uppercase;
      color: #7d7d7d;
  }
  .progressbar li:before {
      width: 30px;
      height: 30px;
      content: counter(step);
      counter-increment: step;
      line-height: 30px;
      border: 2px solid #7d7d7d;
      display: block;
      text-align: center;
      margin: 0 auto 10px auto;
      border-radius: 50%;
      background-color: white;
  }
  .progressbar li:after {
      width: 100%;
      height: 2px;
      content: '';
      position: absolute;
      background-color: #7d7d7d;
      top: 15px;
      left: -50%;
      z-index: -1;
  }
  .progressbar li:first-child:after {
      content: none;
  }
  .progressbar li.active {
      color: green;
  }
  .progressbar li.active:before {
      border-color: #55b776;
  }
  .progressbar li.active + li:after {
      background-color: #55b776;
  }
    
          </style>
    
   <script>
       function func(){
       var v=$("#status").val();
       
       var rem=$("#rmrk").val();
       if(v=='A')
       {
           n=1;
       }
       else if(v=='DH')
           {
               n=2;
           }
           else if(v=='HR')
               {
                   n=3;
               }
               else if(v=='C')
                   {
                       n=4
                   }
               if(rem!="n")
                   {
                       document.getElementById("rejected").style.display='block';
                       document.getElementById(n+"a").innerHTML='Rejected';
                       
                      
                       
                   document.getElementById(n+"a").setAttribute("style", "color:red"); 
                       
                       n=n-1;
                   }
               
               for(var i=1;i<=n;i++){
                   
                   document.getElementById(i).setAttribute("class", "active"); 
               }
       }
       
   </script>
   

       
    
    </head>
    <body onload="func()" id="backgroundImage">
    
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
         <li style=" font-weight: bold;font-size: 17px;margin-top: 15%;"><a href="welcome_<%=type%>.jsp" style="color:#101E40"> Home </a></li>
         <li style="font-weight: bold;font-size: 17px;margin-top: 15%;">  <a href="password.jsp" style="color:#101E40"> Change Password </a></li>
          <li style="font-weight: bold;font-size: 17px;margin-top: 15%;"><a href="logout" style="color:#101E40"> Logout   <span class="glyphicon glyphicon-log-out"></span></a></li>
        </ul>
            </div>
        </div>
      
            </div>
         <hr style="border: 1px solid black">
         <center style="margin-top: 4%;"> <h1>Request Status</h1> </center>
         <div class="container" style="margin-top: 10%">
            
      <ul class="progressbar">
          <li id="1" class="" >Request Generated</li>
          <li id="2" class=""><x style="" id="2a">Approved</x> by department head</li>
          <li id="3" class="" ><x style=""  id="3a">Approved</x> by HR</li>
          <li id="4" class="">Request Completed </li>
  </ul>
             
             <input type="hidden" id="status" value=<%=s%>>
             <input type="hidden" id="rmrk" value=<%=r%>>
             
             <div  id="rejected" style="display:none;">
               
                 <center style="margin-top: 8%;">
                     <h1 style="color:red" >Request Rejected</h1>
                     <p style="border :solid 1px;margin-top: 2%" ><span style="color: red">Reason:</span> <span id='remark'><%=r%></span></p>
                 </center>
             </div>
             
             
    </body>
</html>
