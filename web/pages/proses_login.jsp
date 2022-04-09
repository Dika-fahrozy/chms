<%-- 
    Document   : proses_login
    Created on : Nov 26, 2021, 11:18:56 PM
    Author     : Dika Oji
--%>
<%@page import="com.chms.DAO.userDao"%>
<%@page import="com.chms.init.user"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    if (request.getParameterMap().containsKey("username")){
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        user u = userDao.getRecordByParams(username, password);
        
        if (u != null) {
            session.setAttribute("user", u.getUsername());
            session.setAttribute("role", u.getRole());
            session.setAttribute("nama", u.getNama_lengkap());
            session.setMaxInactiveInterval(60*60);
            out.print("<script>document.location='index.jsp?admin=home'</script>");
        } else {
            %>
                <script>
                    alert("Username atau Password salah, silahkan coba lagi");
                    document.location='index.jsp?page=login';
                </script>
            <%
        }
    } else {
        out.println("<center><font color='red'<b>Maap, pastikan username dan password terisi</b></font></center>");
    }
%>