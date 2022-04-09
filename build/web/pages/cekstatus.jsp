<%-- 
    Document   : cekstatus
    Created on : Nov 26, 2021, 9:31:14 PM
    Author     : Dika Oji
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%><!DOCTYPE html>
<div class="nav">
    <a href="index.jsp">home</a> > <u>cek status pengaduan</u>
</div>
<br>
<br>
<h1>Cek Status Pengaduan</h1>
<p>Silahkan masukan nomor tiket pengaduan anda untuk melihat status perkembangan nya</p>
<br>
<div class="content" style="margin-top: 30px;">
    <form method="post" action="index.jsp">
        <table width="100%" style="margin: 0 auto;width: 70%;">
            <tr>
                <td width="317px">Nomor Tiket Pengaduan <i class="red">*</i></td>
                <td><input type="text" name="ticketno" required></td>
            </tr>
            <tr>
                <td>
                    <br>
                    <input type="hidden" name='page' value='cekstatus_proses'>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <button type="submit" class="submit">Cek Status</button>
                </td>
            </tr>
        </table>
    </form>
</div>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>