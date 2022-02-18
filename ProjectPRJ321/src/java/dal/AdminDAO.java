/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import model.Admin;

/**
 *
 * @author Dell
 */
public class AdminDAO extends DBContext{
    public Admin getAdmin(String adname,String adpass){
        try {
            String sql="select * from Admin where adname = ? and adpass = ?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, adname);
            st.setString(2, adpass);
            ResultSet rs = st.executeQuery();
            if(rs.next()){
                return new Admin(adname, adpass);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AdminDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
