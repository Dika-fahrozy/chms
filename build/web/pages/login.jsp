<%-- 
    Document   : login
    Created on : Nov 26, 2021, 8:29:58 PM
    Author     : Dika Oji
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="nav">
    <a href="index.jsp">home</a> > <u>login</u>
</div>
<br>
<br>
<h1>Masuk Aplikasi CHMS</h1>
<p>Silahkan isi username dan password anda yang telah terdaftar</p>
<br>
<div class="content">
    <form method="post" action="index.jsp?page=proses_login">
        <table width="100%" style="margin: 0 auto;width: 70%;">
            <tr>
                <td width="317px">Username <i class="red">*</i></td>
                <td><input type="text" name="username" required></td>
            </tr>
            <tr>
                <td>Password <i class="red">*</i></td>
                <td><input type="password" name="password" required></td>
            </tr>
            <tr>
                <td><br></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <button type="submit" class="submit">Masuk</button>
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