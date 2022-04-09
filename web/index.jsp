<%-- 
    Document   : index
    Created on : Nov 25, 2021, 12:19:53 AM
    Author     : Dika Oji
--%>

<%
    String pages = "";
    String folder = "pages/";
    if (request.getParameterMap().containsKey("page")) {
        pages = request.getParameter("page");
    }
    else if (request.getParameterMap().containsKey("admin")) {
        if(session.getAttribute("user") == null) { %>
            <script>document.location = 'index.jsp?page=login';</script>
        <% }
        folder = "admin/";
        pages = request.getParameter("admin");
    }
    else {
        pages = "home";
        if(session.getAttribute("user") != null) { 
            session.setAttribute("user", null);
            session.setAttribute("role", null);
            session.invalidate();
        }
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sistem Pengaduan | BSI</title>
    <link rel="stylesheet" href="asset/all.css">
    <link rel="icon" href="asset/ico_title.gif" type="image/x-icon">
</head>
<body>
    <!--header-->
    <jsp:include page="asset/header.jsp" />
    
    <!--content-->
    <section>
        <div class="landing">
            <jsp:include page= '<%=  folder + pages + ".jsp" %>'/>
        </div>
    </section>
    
    <!--footer-->
    <section id="footer">
        <p>&copy; <%= new java.text.SimpleDateFormat("yyyy").format(new java.util.Date()) %> By Dika Fahrozy</p>
    </section>
</body>
</html>