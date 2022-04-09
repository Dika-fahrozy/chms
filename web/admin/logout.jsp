<%-- 
    Document   : logout
    Created on : Nov 27, 2021, 2:01:42 PM
    Author     : Dika Oji
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    session.setAttribute("user", null);
    session.setAttribute("role", null);
    session.invalidate();
    
%>
<script>document.location='index.jsp?page=login'</script>