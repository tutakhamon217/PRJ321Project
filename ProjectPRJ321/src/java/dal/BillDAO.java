/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Bill;

/**
 *
 * @author Dell
 */
public class BillDAO extends DBContext {

    public void insert(Bill c) {
        String sql = "insert into Bill values(?,?,?,?,?,?,?,GETDATE(),?)";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, c.getName());
            st.setString(2, c.getPhone());
            st.setString(3, c.getCard());
            st.setString(4, c.getShipaddress());
            st.setString(5, c.getNotice());
            st.setString(6, c.getTotal());
            st.setFloat(7, c.getInterest());
            st.setInt(8, c.getId());
            
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<Bill> getAllBill() {
        String sql = "select * from Bill";
        List<Bill> lst = new ArrayList<>();
        try {
            PreparedStatement st = con.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                lst.add(new Bill(rs.getString(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getString(6), rs.getFloat(7),rs.getDate(8),rs.getInt(9)));
            }
        } catch (Exception e) {
        }
        return lst;
    }
   public List<Bill> getAllBillByName(String name) {
        String sql = "select * from Bill where name=?";
        List<Bill> lst = new ArrayList<>();
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, name);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
             lst.add(new Bill(rs.getString(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getString(6), rs.getFloat(7),rs.getDate(8),rs.getInt(9)));
            }
        } catch (Exception e) {
        }
        return lst;
    }
    public List<Bill> getAllBillByDay(int day) {
        String sql = "select * from bill where day(date)=?";
        List<Bill> lst = new ArrayList<>();
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, day);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
             lst.add(new Bill(rs.getString(1), rs.getString(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getString(6), rs.getFloat(7),rs.getDate(8),rs.getInt(9)));
            }
        } catch (Exception e) {
        }
        return lst;
    }
   public void deleteBill(int id){
        String sql = "delete  from Bill where id=?";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, id);
             st.executeUpdate();
           
            
        } catch (Exception e) {
    
        }
   }
   
    public static void main(String[] args) {
        BillDAO b = new BillDAO();
        System.out.println(b.getAllBill().size());
      
    }
    
}
