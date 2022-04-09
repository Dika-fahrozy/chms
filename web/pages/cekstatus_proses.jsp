<%-- 
    Document   : cekstatus_proses
    Created on : Nov 26, 2021, 10:09:17 PM
    Author     : Dika Oji
--%>
<%@page import="com.chms.init.lapor"%>
<%@page import="com.chms.DAO.laporan"%>


<%
    String tiket = request.getParameter("ticketno");
    lapor z = laporan.cekStatusPengaduan(tiket);
    if(z != null) {
    %>
    <br>
    <style>
        td {
            height: 40px
        }
    </style>
    <div class="content">
        <center>
            <h1 style="color: #00a39d">Tiket Pengaduan <%= z.getStatus_dsc()%></h1>
            <br>
            <hr style="border:2px solid">
            <br>
            <br>
            <p>Tiket Pengaduan anda : <b><%= tiket %></b></p>
            <br>
            <p>Detail Pengaduan</p>
            <br><br>
        </center>
        <div style="width: 80%;margin:0 auto;padding:20px;border: 1px solid;">
            <table style="width:100%">
                <tr>
                    <td>No. Rekening</td>
                    <td><%= z.getRekening()%></td>
                    <td>No. Telepon/HP</td>
                    <td><%= z.getTelp()%></td>
                </tr>
                <tr>
                    <td>Nama Pelapor</td>
                    <td><%= z.getNama_pelapor()%></td>
                    <td>Email</td>
                    <td><%= z.getEmail() %></td>
                </tr>
                <tr>
                    <td colspan="4"><hr style="border:1px solid"></td>
                </tr>
                <tr>
                    <td style="vertical-align: top">Jenis Pengaduan</td>
                    <td style="vertical-align: top">
                        <%
                            int keluhan = Integer.parseInt(z.getJenis_keluhan());
                            switch(keluhan){
                                case 1:
                                    out.print("Gagal transaksi");
                                    break;
                                case 2:
                                    out.print("Tidak dapat melakukan transaksi");
                                    break;
                                case 3:
                                    out.print("Penipuan");
                                    break;
                                case 4:
                                    out.print("Lainnya");
                                    break;
                            }
                        %>
                    </td>
                </tr>
                <tr>
                    <td style="vertical-align: top">Keluhan</td>
                    <td colspan='2'>
                        <textarea disabled><%=z.getKeluhan()%></textarea>
                    </td>
                </tr>
            </table>
        </div>
        <center>
            <br><br>
            <a href="index.jsp?page=cekstatus" style="color: blue!important"> Kembali </a>
            <br><br><br>
            <p>terima kasih, semoga transaksi anda menjadi lebih berkah</p>
        </center>
    </div>
    <br>
    <%
    }
    else {
    %>
    <br>
    <div class="content">
        <center>
            <h1 style="color: #ff0000">Tiket pengaduan anda tidak ditemukan</h1>
            <br>
            <hr style="border:2px solid">
            <br>
            <br>
            <p>Pastikan tiket yang anda masukan sesuai dengan tiket pengaduan anda</p>
            <br>
            <p>Tiket yang anda input : </p>
            <br>
            <hr style="border:1px solid; width: 50%; margin:10px">
            <h1><%= tiket %></h1>
            <hr style="border:1px solid; width: 50%; margin:10px">
            <br><br>
            <p>Apabila masalah masih terjadi, silahkan lakukan pengisian pengaduan anda kembali</p>
            <br>
            <a href="index.jsp?page=formpengaduan" style="color: blue!important">Buat Pengaduan</a>
            atau
            <a href="index.jsp?page=cekstatus" style="color: blue!important"> Coba input ulang </a>
            <br><br><br><br
            <p>terima kasih, semoga transaksi anda menjadi lebih berkah</p>
        </center>
    </div>
    <br>
    <%
    }
%>