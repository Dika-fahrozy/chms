<%-- 
    Document   : formpengaduan
    Created on : Nov 26, 2021, 4:38:51 PM
    Author     : Dika Oji
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.chms.DAO.laporan"%>
<%
    String numeric = "onKeyPress=\"var e = event.keyCode; if( e == 0) e = event.which; if (e >=48 && e < 58 || e==8 || e==9 || e==37 || e==39){}else{event.returnValue = false;event.preventDefault();}\"";
%>

<div class="nav">
    <a href="index.jsp">home</a> > <u>form pengaduan</u>
</div>
<h1>Form Pengaduan</h1>
<p>Silahkan isi pengaduan anda pada form di bawah ini</p>
<br>
<div class="content">
    <form method="post" action="index.jsp?page=formproses" autocomplete="off">
        <table width="100%" style="margin: 0 auto;width: 70%;">
            <tr>
                <td width="317px">No. Rekening <i class="red">*</i></td>
                <td>
                    <input type="text" name="rekening" required maxlength="10" <%= numeric %>>
                    <input type="hidden" name="ticket" value="<%= laporan.randomId() %>">
                </td>
            </tr>
            <tr>
                <td>Nama <i class="red">*</i></td>
                <td><input type="text" name="nama_pelapor" required></td>
            </tr>
            <tr>
                <td>Email</td>
                <td><input type="email" name="email"></td>
            </tr>
            <tr>
                <td>No. Telepon/Hp <i class="red"></i></td>
                <td><input type="text" name="telp" required maxlength="12" <%= numeric %>></td>
            </tr>
            <tr>
                <td>Alamat <i class="red">*</i></td>
                <td>
                    <textarea name="alamat" rows="3" cols="5" required></textarea>
                </td>
            </tr>
            <tr>
                <td>Jenis Pengaduan <i class="red">*</i></td>
                <td>
                    <select name="jenis_keluhan" required>
                        <option value="" disabled selected>- Silahkan Pilih -</option>
                        <option value="1">Gagal transaksi</option>
                        <option value="2">Tidak dapat melakukan transaksi</option>
                        <option value="3">Penipuan</option>
                        <option value="4">Lainnya</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Keluhan <i class="red">*</i></td>
                <td>
                    <textarea name="keluhan" rows="3" cols="5" required></textarea>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <br>
                    <input type="submit" value="Buat Laporan" class="submit">
                </td>
            </tr>
        </table>
    </form>
</div>