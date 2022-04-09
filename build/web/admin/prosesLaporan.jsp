<%-- 
    Document   : prosesLaporan
    Created on : Nov 28, 2021, 7:42:37 PM
    Author     : Dika Oji
--%>

<%@page import="com.chms.DAO.laporan"%>
<%@page import="com.chms.init.lapor"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    if (request.getParameterMap().containsKey("opsi") && request.getParameterMap().containsKey("catatan")){
        String opsi = request.getParameter("opsi");
        String catatan = request.getParameter("catatan");
        String user = session.getAttribute("user").toString();
        String ticket = request.getParameter("ticket");
        
        int opt = 0;
        if (session.getAttribute("role").equals("Otorisator")) {
            opt = 1;
        }
        
        int u = laporan.update(opt, user, opsi, catatan, ticket);
        
        if (u == 1) {
            out.print("<center><h1>Pengaduan berhasil diproses, cek <a style='color:blue!important; text-decoration:underline' href='index.jsp?admin=home&process="+user+"'>Laporan diproses</a></h1></center>");
        } else {
            out.print("<center><h1>Pengaduan gagal diproses, silahkan <a style='color:blue!important; text-decoration:underline' href='index.jsp?admin=detail&xid="+ticket+"'>Coba lagi</a></h1></center>");
        }
    } else {
        out.println("<center><font color='red'<b>Opsi yang diberikan tidak sesuai, silahkan <a style='color:blue!important' href='index.jsp?admin=detail'>Coba Lagi</a></b></font></center>");
    }
%>