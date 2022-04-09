/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.chms.DAO;

import com.chms.init.lapor;
import com.chms.model.koneksi;
import static java.lang.Integer.parseInt;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

/**
 *
 * @author Dika Oji
 */
public class laporan {
    
    public static String randomId() {
        String[] strArr = { "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0" };
        Random rand = new Random();
        String data = "CHMS";
        for (int i = 0; i < 6; i++) {
            int res = rand.nextInt(strArr.length);
            data += strArr[res];
        }
        return data;
    }
    
    public static int save(lapor u){
        int stat = 0;
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        String date = sdf.format(new Date());

        try{
            Connection con = koneksi.getConnection();
            
            String query = "INSERT INTO pelaporan " +
                           "(ticket, rekening, nama_pelapor, email, telp, alamat, jenis_keluhan, keluhan, tanggal_laporan, status) " + 
                           "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            
            PreparedStatement ps = con.prepareStatement(query);
            
            ps.setString(1, u.getTicket());
            ps.setString(2, u.getRekening());
            ps.setString(3, u.getNama_pelapor());
            ps.setString(4, u.getEmail());
            ps.setString(5, u.getTelp());
            ps.setString(6, u.getAlamat());
            ps.setString(7, u.getJenis_keluhan());
            ps.setString(8, u.getKeluhan());
            ps.setString(9, date);
            ps.setString(10, "4");
            
            ps.executeUpdate();
            stat = 1;
        }
        catch(SQLException e){
            System.out.println(e);
        }
        return stat;
    }
    
    public static lapor cekStatusPengaduan(String tiket){
        lapor a = null;
        try{
            Connection con = koneksi.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM pelaporan WHERE ticket=?");
            ps.setString(1,tiket);
            ResultSet rs=ps.executeQuery();
            while(rs.next()) {
                
                a = new lapor();
                a.setRekening(rs.getString("rekening"));
                a.setNama_pelapor(rs.getString("nama_pelapor"));
                a.setEmail(rs.getString("email"));
                a.setTelp(rs.getString("telp"));
                a.setJenis_keluhan(rs.getString("jenis_keluhan"));
                a.setStatus(parseInt(rs.getString("status")));
                a.setKeluhan(rs.getString("keluhan"));
                a.setKeterangan_penerima(rs.getString("keterangan_penerima"));
                a.setPenerima_laporan(rs.getString("penerima_laporan"));
                a.setTgl_terima(rs.getString("tgl_terima"));
                
                PreparedStatement stat = con.prepareStatement("SELECT * FROM master_status WHERE id=?");
                stat.setString(1, rs.getString("status"));
                ResultSet mstat = stat.executeQuery();
                while (mstat.next()){
                    a.setStatus_dsc(mstat.getString("name_status"));
                }
            }
        }
        catch(SQLException e){
            System.out.println(e);
        }
        return a;
    }
    
    public static int update(int opt, String penerima, String opsi, String catatan, String ticket){
        int stat = 0;
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        String date = sdf.format(new Date());

        try{
            Connection con = koneksi.getConnection();
            
            String query;
            if (opt == 1) {
                query = "UPDATE pelaporan SET " +
                        "status = ?, " + 
                        "otorisator = ?, " + 
                        "tgl_otorisator = ?, " + 
                        "keterangan_otorisator = ? " +
                        "WHERE ticket = ?";
            } else {
                query = "UPDATE pelaporan SET " +
                        "status = ?, " + 
                        "penerima_laporan = ?, " + 
                        "tgl_terima = ?, " + 
                        "keterangan_penerima = ? " +
                        "WHERE ticket = ?";
            }
            
            
            PreparedStatement ps = con.prepareStatement(query);
            
            ps.setString(1, opsi);
            ps.setString(2, penerima);
            ps.setString(3, date);
            ps.setString(4, catatan);
            ps.setString(5, ticket);
            
            ps.executeUpdate();
            stat = 1;
        }
        catch(SQLException e){
            System.out.println(e);
        }
        return stat;
    }
}
