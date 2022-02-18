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
import model.OrderDetail;

/**
 *
 * @author asus
 */
public class OrderDetailDAO extends DBContext {
    public void insert(OrderDetail c) {
        String sql = "insert into  orderdetail values(?,?,?)";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, c.getBillid());
            st.setString(2, c.getPname());
            st.setInt(3, c.getQuantity());
            
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
     public List<OrderDetail> getAllListProduct(int id) {
        String sql = "select * from orderdetail where billid=? order by quantity desc";
        List<OrderDetail> lst = new ArrayList<>();
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                lst.add(new OrderDetail(rs.getInt(1), rs.getString(2),rs.getInt(3)));
            }
        } catch (Exception e) {
        }
        return lst;
    }
    public static void main(String[] args) {
        OrderDetailDAO odd=new OrderDetailDAO();
        odd.insert(new OrderDetail(2, "Orange", 1));
        System.out.println(odd.getAllListProduct(18).size());
    }
}
