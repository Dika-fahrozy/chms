<%-- 
    Document   : home
    Created on : Nov 27, 2021, 3:15:23 PM
    Author     : Dika Oji
--%>

<%@page import="java.sql.*"%>
<%@page import="com.chms.model.koneksi"%>
<% int row = 0; %>

<h1>Selamat Datang <%= session.getAttribute("nama") %>!</h1>

<style>
    table.table, .border {
        border: 1px solid;
        padding:5px 
    }
    th.border {
        background: #00a39d;
        color: #fff;
        border: 1px solid #000
    }
</style>

<br>
<h3>
<% 
    int allow = 1, print = 1, ofc = 0, opsi = 1;
    String query = "SELECT a.*, (SELECT nama_lengkap FROM user WHERE username = a.penerima_laporan) as officer, (SELECT nama_lengkap FROM user WHERE username = a.otorisator) as otorisator FROM pelaporan as a";
    
    if (session.getAttribute("role").equals("Otorisator")) {
        if (request.getParameterMap().containsKey("process")) {
            out.print("Otorisasi Pengaduan");
            query += " WHERE a.status = '3'";
            print = 0;
            ofc = 1;
            opsi = 0;
        }
        else {
            allow = 0;
            ofc = 1;
            opsi = 0;
        }
    } else {
        if (request.getParameterMap().containsKey("process")) {
            out.print("Pengaduan yang saya proses");
            query += " WHERE a.penerima_laporan = '" + request.getParameter("process") + "'";
            allow = 0;
            ofc = 1;
            opsi = 0;
        } 
        else {
            out.print("Inquiry Pengaduan");
            query += " WHERE a.status = '4'";
        }
    }
%>
</h3>
<br>
<br>

<%
    try {
        int i = 1;
        Connection con = koneksi.getConnection();
        
        // get data row
        PreparedStatement gr = con.prepareStatement(query);
        ResultSet dr = gr.executeQuery();
        
        while(dr.next()){ row = row + i; }
%>

<table width="100%">
    <tr>
        <td style="vertical-align: bottom;padding:0px"><p>Jumlah Data : <%= row %></p></td>
        <td align="right" style="vertical-align: bottom;padding:0px">
            <% if (print == 1) { %> <button class='btn' style='height: 30px;width: 70px;margin-bottom: -15px;' onclick='cetak()'>Cetak</button> <% } %>
        </td>
    </tr>
</table>
<br>
<table class="table" id="table" width="100%">
    <tr>
        <th class="border">No.</th>
        <th class="border">No. Tiket</th>
        <th class="border">Nama Pelapor</th>
        <% if(opsi == 1) {%>
            <th class="border">No. Telp</th>
            <th class="border">Jenis Keluhan</th>
        <% } %>
        <th class="border">Tgl. Laporan</th>
        <th class="border">Status Laporan</th>
        <% if(ofc == 1) {%>
            <th class="border">Officer</th>
            <th class="border">Otorisator</th>
        <% }%>
        <% if(allow == 1) {%><th class="border">Aksi</th><% }%>
    </tr>
<%      
        // get all data
        PreparedStatement ps = con.prepareStatement(query);
        ResultSet rs = ps.executeQuery();
        
        if(row > 0) {
%>
    <% while(rs.next()) { %>
    <tr>
        <td align="center" class="border"><%= i++ %></td>
        <td class="border"><%= rs.getString("ticket") %></td>
        <td class="border"><%= rs.getString("nama_pelapor") %></td>
        <% if(opsi == 1) {%>
            <td class="border"><%= rs.getString("telp") %></td>
            <td class="border">
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
        <% } %>
        <td class="border"><%= rs.getString("tanggal_laporan") %></td>
        <td class="border">
            <%
                PreparedStatement stat = con.prepareStatement("SELECT * FROM master_status WHERE id='"+rs.getString("status")+"'");
                ResultSet mstat = stat.executeQuery();
                while (mstat.next()){
                    out.print(mstat.getString("name_status"));
                }
            %>
        </td>
        <% if(ofc == 1) {%>
            <td class="border" align="center"><%= (rs.getString("officer") == null ? '-' : rs.getString("officer")) %></td>
            <td class="border" align="center"><%= (rs.getString("otorisator") == null ? '-' : rs.getString("otorisator")) %></td>
        <% } %>
        <% if(allow == 1) {%>
            <td class="border" align="center"><a href="index.jsp?admin=detail&xid=<%= rs.getString("ticket") %>" style="color: blue"><u>Detail</u></a></td> 
        <% } %>
    </tr>
    <% } %>
    <% } else { %>
    <tr><td class="border" colspan="9" align="center">Tidak ada data ditemukan</td></tr>
    <% } %>

<%
    }
    catch(SQLException e) {
        %>
        <tr><td class="border" colspan="9"><% out.println(e); %></td></tr>
        <%
    }
%>
</table>
<br>

<div id="content-laporan" style="display:none">
    <div id="laporan">
        <jsp:include page= '<%=  "../cetak.jsp" %>'/>
    </div>
</div>

<script>
    function cetak() {
        var myWindow = window.open("", "MyWindows", "width=600,height=500");
        myWindow.document.write(document.getElementById("laporan").innerHTML);
        myWindow.print();
        myWindow.close();
    }
</script>