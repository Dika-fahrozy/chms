<%-- 
    Document   : detail
    Created on : Nov 28, 2021, 1:49:11 PM
    Author     : Dika Oji
--%>
<%@page import="com.chms.init.lapor"%>
<%@page import="com.chms.DAO.laporan"%>


<%
    String tiket = request.getParameter("xid");
    lapor z = laporan.cekStatusPengaduan(tiket);
    if(z != null) {
    %>
    <style>
        td{
            padding: 10px
        }
    </style>
    <h1>No. Tiket : <%= tiket %></h1>
    <br>
    <form class="content" method="post" action="index.jsp?admin=prosesLaporan" style="padding-bottom: 10px;">
        <table style="width: 100%;">
            <tr>
                <td>Detail Pelapor </td>
            </tr>
            <tr>
                <td>No. Rekening</td>
                <td>: <%= z.getRekening()%></td>
                <td>No. Telepon/HP</td>
                <td>: <%= z.getTelp()%></td>
            </tr>
            <tr>
                <td>Nama Pelapor</td>
                <td>: <%= z.getNama_pelapor() %></td>
                <td>Email</td>
                <td>: <%= z.getEmail() %> </td>
            </tr>
            <tr>
                <td colspan="4"><hr style="border:1px solid;"></td>
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
                    <textarea disabled><%= z.getKeluhan()%></textarea>
                </td>
            </tr>
            
            <% if (z.getPenerima_laporan() != null) {%>
                <tr>
                    <td colspan="4"><hr style="border:1px solid;"></td>
                </tr>
                <tr>
                    <td>Officer Penerima</td>
                    <td><%= z.getPenerima_laporan() %></td>
                    <td>Tanggal diterima</td>
                    <td><%= z.getTgl_terima()%></td>
                </tr>
                <tr>
                    <td style="vertical-align: top">Catatan Officer</td>
                    <td><textarea disabled><%= z.getKeterangan_penerima() %></textarea></td>
                </tr>
            <% } %>
            
            <tr>
                <td colspan="4"><hr style="border:1px solid;"></td>
            </tr>
            <tr>
                <td>Opsi pada laporan <i class="red">*</i></td>
                <td>
                    <select name="opsi" required>
                        <option value="" selected disabled>- Silahkan Pilh -</option>
                        <% if (session.getAttribute("role").equals("Otorisator")) {%>
                            <option value="5">Selesai</option>
                            <option value="1">Terima</option>
                            <option value="2">Tolak</option>
                        <% } else {%>
                            <option value="3">Proses Laporan</option>
                            <option value="2">Tolak</option>
                        <% } %>
                    </select>
                </td>
            </tr>
            <tr>
                <td style="vertical-align: top">Catatan <i class="red">*</i></td>
                <td style="vertical-align: top"><textarea name="catatan" required></textarea></td>
            </tr>
            <tr>
                <td colspan="4"><hr style="border:1px solid;"></td>
            </tr>
            <tr>
                <td colspan="4" align="center">
                    <br>
                    <input type="hidden" name="ticket" value="<%= tiket %>">
                    <input type="submit" class="btn" style="height: 30px" value="SUBMIT">
                </td>
            </tr>
    </table>
</form>
<% } %>