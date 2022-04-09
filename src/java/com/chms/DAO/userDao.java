/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.chms.DAO;

/**
 *
 * @author Dika Oji
 */

import java.sql.*;
import com.chms.init.user;
import com.chms.model.koneksi;

public class userDao {
    public static user getRecordByParams(String username, String pass){
        user u = null;
        try{
            Connection con = koneksi.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM user WHERE username=? AND password=?");
            ps.setString(1,username);
            ps.setString(2,pass);
            ResultSet rs=ps.executeQuery();
            while(rs.next()) {
                u = new user();
                u.setUsername(rs.getString("username"));
                u.setRole(rs.getString("role"));
                u.setNama_lengkap(rs.getString("nama_lengkap"));
            }
        }
        catch(SQLException e){
            System.out.println(e);
        }
        return u;
    }
}
