<%

    String user="",type="";
    try{
        type=session.getAttribute("type").toString();
    user=session.getAttribute("user").toString();
    }
    catch(Exception e)
    {
        %>
        
        <script>
            
            alert("Please Login First!!");
            location='index.jsp';
            
        </script>
        
        
        <%
    }
    

%>
