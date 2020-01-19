<%-- 
    Document   : welcome_HOD
    Created on : Jul 1, 2019, 10:51:48 PM
    Author     : lenovo
--%>
<%@include file="sessioncheck.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Welcome!</title>
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
        li
        {
            font-weight: bold;
            font-size: 17px;
            margin-top: 15%;
        }
       
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
        
        
        
        <div class="col-sm-12" ng-app="">
           
       
            <div class="col-sm-2">
            
                
             <div class="list-group">
                 
             
                 <br><br>
   
                  

</div>
                
                
                
                
                
                
            
            </div>
            
            <div class="col-sm-8" style="margin-top: 10%;">
                 
            <div class="col-sm-6" style="border: 1px solid black">
                <form action="apply"  method="POST" enctype='multipart/form-data'>
                    <div class="form-group">
                      
                    <span>Upload Your Picture</span>
                        
                
                        
                    <input id="src" type="file" required name="src" accept="image/jpeg" class="form-control" /> <!-- input you want to read from (src) -->
                        
                    <br>
                         <span>Upload Your Signature</span>
                     <input type="file" required  onchange="readURL(this);" name="sign" accept="image/jpeg" class="form-control">
                    <br>
                        <span>Select Blood Group</span>
                    <select name='bg' class="form-control">
                        <option value='-1'>--Select--</option>
                         <option value='O+'>O+</option>
                         <option value='O-'>O-</option>
                         <option value='A-'>A-</option>
                         <option value='A+'>A+</option>
                         <option value='B+'>B+</option>
                         <option value='B-'>B-</option>
                         <option value='AB+'>AB+</option>
                         <option value='AB-'>AB-</option>
                    </select>
                        <br>
                        <input type="submit" value="Request"  class="btn btn-primary"> 
                        </form>
                
                        <a href='get_status'>  <input type="button" style='margin-left: 15%;'value="View status" class="btn btn-success"></a> 
                       
                        <form action="request" method='post' style='display: inline'>
                            <input type="submit" style='margin-left: 10%' value="Pending Request" class="btn btn-warning">
                      <select  id="requests"  name="request" class='form-control' ></select>
                        
                        </form>
                    </div>
                
                
               
                </div>
                
                
            <div class="col-sm-6" style="background-color:#E46713; padding: 2%;height:307px" >
                 <div  class="col-sm-3">
                <img src="images/iocllogo.jpg" style="height: 80px;width: 60%; margin-left: 10%;">
                <img id="target" src="#"  width="100px" height="100px" style="padding-top: 5%">
                     <img id="blah" src="#" width="120px" height="50px" style="padding-top: 10%">
                    
                </div>
                
<div style="background-color:#E46713" class="col-sm-9">
    
    <div><span class="span" style="margin-left: 25%;"> UPSO-1/HR/3XXXX/2019</span></div>

    <div style="border: 1px solid white; text-align: center;">
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
    <td colspan="2">UPSO-1</td> 
    
  </tr>
        
  <tr>
    <td>  Name</td>
      <td colspan="3">{{name}}</td>
    
  </tr>
   
        <tr>
     <td>   EMP.No.</td>     
        <td>00000</td> 
        <td>   Blood Group</td> 
        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td> 
         
        </tr>
</table>
 
                </div>
                
                   
                </div>
             
           
           
                
            <div class="col-sm-2"></div>
            </div>
        </div>
      
  <script>

function showImage(src,target) {
  var fr=new FileReader();
  // when image is loaded, set the src of the image where you want to display it
  fr.onload = function(e) { target.src = this.result; };
  src.addEventListener("change",function() {
    // fill fr with image data    
    fr.readAsDataURL(src.files[0]);
  });
}

var src = document.getElementById("src");
var target = document.getElementById("target");
showImage(src,target);

      
      
</script>
      
        
        <script>
         function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#blah')
                        .attr('src', e.target.result)
                        
                };

                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>
    

    
    
        </body> 
        
    
</html>