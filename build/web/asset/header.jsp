<%-- 
    Document   : header
    Created on : Nov 26, 2021, 2:35:05 PM
    Author     : Dika Oji
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<section id="header">
    <style>
        td.header{
            padding:10px
        }
    </style>
    <table width="100%">
        <tr>
            <td rowspan="2">
                <a href="index.jsp">
                    <img src="asset/bsi.png" width="170px" alt="Bank Syariah Indonesia">
                </a>
            </td>
            <td class='header' align="right">
                <% if (session.getAttribute("user") != null) { %>
                    <p style="color:#fff;padding:0 10px;"><%= session.getAttribute("nama") %> (<%= session.getAttribute("role") %>)</p>
                    <hr style="border:1px solid #fff; margin: 15px 0px; width: 500px">
                <%}%>
                
                <% if (request.getParameterMap().containsKey("page")) { %>
                    <a href="index.jsp" class="menu">Home</a>
                <% } %>
                
                <% if ((session.getAttribute("user") == null) || (session.getAttribute("user") == "")) { %>
                    <a href="index.jsp?page=login" class="menu">Log In</a>
                <% } else { %>
                    <% if (request.getParameterMap().containsKey("admin")) { %>
                        <% if (!request.getParameter("admin").equals("home") || request.getParameterMap().containsKey("process")) {%>
                            <a href="index.jsp?admin=home" class="menu">Home</a>
                        <% } %>
                        <a href="index.jsp?admin=home&process=<%= session.getAttribute("user") %>" class="menu">
                            <%
                                if(session.getAttribute("role").equals("Otorisator")) {
                                    out.print("Otorisasi laporan");
                                } else {
                                    out.print("Laporan diproses");
                                }
                            %>
                            
                        </a>
                    <% } %>
                    <a href="index.jsp?admin=logout" class="menu">Log out</a>
                <% } %>
            </td>
        </tr>
    </table>
</section>
<br>