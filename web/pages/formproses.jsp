<%-- 
    Document   : formproses
    Created on : Nov 27, 2021, 3:06:44 AM
    Author     : Dika Oji
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% String ticketno = request.getParameter("ticket"); %>

<%@page import="com.chms.DAO.laporan"%>
<jsp:useBean id="u" class="com.chms.init.lapor"></jsp:useBean>  
<jsp:setProperty property="*" name="u"/>

<%
    int hasil = laporan.save(u);
    if (hasil == 1) {
    %>
        <br>
        <br>
        <div class="content">
            <center>
                <img src="asset/ico_title.gif" style="width: 135px">
                <hr style="border:2px solid">
                <br>
                <h1>Berhasil Mengirimkan Pengaduan</h1>
                <br>
                <p>Pengaduan anda terdaftar dengan nomor tiket :</p>
                <hr style="border:1px solid; width: 50%; margin:10px">
                <h1><%= ticketno %></h1>
                <hr style="border:1px solid; width: 50%; margin:10px">
                <p>Harap disimpan. <br>Nomor tiket ini dapat digunakan untuk melakukan pengecekan status pengaduan anda pada menu</p>
                <br>
                <a href="index.jsp?page=cekstatus" style="color: blue">Cek Status Pengaduan</a>
                <br><br>
                <p>terima kasih, semoga transaksi anda menjadi lebih berkah</p>
            </center>
        </div>
        <br>
        <br>
    <%
    } 
    else {
    %>
        <br>
        <br>
        <div class="content">
            <center>
                <img src="asset/ico_title.gif" style="width: 135px">
                <hr style="border:2px solid">
                <br>
                <h1>Gagal Mengirimkan Pengaduan</h1>
                <br>
                <p>Pengaduan anda gagal dikirimkan oleh sistem</p>
                <hr style="border:1px solid; width: 50%; margin:10px">
                <h1>. . .</h1>
                <hr style="border:1px solid; width: 50%; margin:10px">
                <p>Silahkan lakukan pengisian pengaduan anda kembali</p>
                <br>
                <a href="index.jsp?page=formpengaduan" style="color: blue">Coba Lagi</a>
                <br><br>
                <p>terima kasih, semoga transaksi anda menjadi lebih berkah</p>
            </center>
        </div>
        <br>
        <br>
    <%
    }
%>
