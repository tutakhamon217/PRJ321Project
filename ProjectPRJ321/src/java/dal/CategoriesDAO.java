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
import model.Categories;
import model.Product;

/**
 *
 * @author asus
 */
public class CategoriesDAO extends DBContext {
     public ArrayList<Categories> getAllCategories() {
        ArrayList<Categories> list = new ArrayList<>();
        String sql = "select * from categories";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Categories(rs.getInt(1), rs.getString(2)));
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

   public void insert(Categories c) {
        String sql = "insert into  categories values(?,?)";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, c.getId());
            st.setString(2, c.getName());
            
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
      public boolean exsitedCate(int id) {
        String sql = "select * from categories where id=?";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }static void main(String[] args) {
        CategoriesDAO d=new CategoriesDAO();
        System.out.println(d.getAllCategories().size());
                
    }
}
