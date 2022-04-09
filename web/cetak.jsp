<%-- 
    Document   : cetak
    Created on : Nov 28, 2021, 12:30:16 PM
    Author     : Dika Oji
--%>

<%@page import="java.sql.*"%>
<%@page import="com.chms.model.koneksi"%>

<% 
    int row = 0;
    try {
        int i = 1;
        Connection con = koneksi.getConnection();
        
        String query = "SELECT a.*, CASE (b.nama_lengkap) WHEN '' OR NULL THEN '-' ELSE b.nama_lengkap END as officer FROM pelaporan as a LEFT JOIN user as b ON a.penerima_laporan = b.username";
    
        if (session.getAttribute("role").equals("Otorisator")) {
            if (request.getParameterMap().containsKey("process")) {
                out.print("Otorisasi Pengaduan");
                query += " WHERE a.status = '3'";
            }
        } else {
            if (request.getParameterMap().containsKey("process")) {
                query += " WHERE a.penerima_laporan = '" + request.getParameter("process") + "'";
            } 
            else {
                query += " WHERE a.status = '4'";
            }
        }
        
        // get all data
        PreparedStatement ps = con.prepareStatement(query);
        ResultSet rs = ps.executeQuery();
        
        // get data row
        PreparedStatement gr = con.prepareStatement(query);
        ResultSet dr = gr.executeQuery();
        
        while(dr.next()){ row = row + i; }
%>

<style>
    * {
        padding: 0px;
        margin: 0px;
        white-space: nowrap;
        border-collapse: collapse;
        font-family: sans-serif;
    }
    .content {
        padding:10px
    }
    td , th{
        padding:10px
    }
</style>

<br>
<center>
    <h3>Laporan Pengaduan</h3>
    <h2>Bank Syariah Indonesia</h2>
</center>

<br><br><br>

<div class="content">
    <table width="100%">
        <tr>
            <td><p>Dicetak Oleh : <%= session.getAttribute("nama") %></p></td>
            <td align="right">
                Waktu cetak : <%= (new java.util.Date()).toLocaleString()%> 
            </td>
        </tr>
        <tr>
            <td>Jumlah data : <%= row %></td>
        </tr>
    </table>
    <br>
    <table class="table" id="table" width="100%" border='1'>
        <tr>
            <th>No.</th>
            <th>No. Tiket</th>
            <th>No. Rekening</th>
            <th>Nama Pelapor</th>
            <th>No. Telp</th>
            <th>Jenis Keluhan</th>
            <th>Status Keluhan</th>
            <th>Tanggal Laporan</th>
        </tr>

    <%
            if(row > 0) {
    %>
        <% while(rs.next()) { %>
        <tr>
            <td align="center"><%= i++ %></td>
            <td><%= rs.getString("ticket") %></td>
            <td><%= rs.getString("rekening") %></td>
            <td><%= rs.getString("nama_pelapor") %></td>
            <td><%= rs.getString("telp") %></td>
            <td>
                <% 
                    int keluhan = Integer.parseInt(rs.getString("jenis_keluhan"));
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
            <td class="border">
                <%
                    PreparedStatement stat = con.prepareStatement("SELECT * FROM master_status WHERE id='"+rs.getString("status")+"'");
                    ResultSet mstat = stat.executeQuery();
                    while (mstat.next()){
                        out.print(mstat.getString("name_status"));
                    }
                %>
            </td>
            <td><%= rs.getString("tanggal_laporan") %></td>
        </tr>
        <% } %>
        <% } else { %>
        <tr><td colspan="9" align="center">Tidak ada data ditemukan</td></tr>
        <% } %>

    <%
        }
        catch(SQLException e) {
            %>
            <tr><td colspan="9"><% out.println(e); %></td></tr>
            <%
        }
    %>
    </table>
</div>