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
import model.Cart;
import model.Item;
import model.Product;
import model.Sold;

/**
 *
 * @author Dell
 */
public class ProductDAO extends DBContext {
//int id, String name, String image, float price, float PriceAfter, String describe)

    public ArrayList<Product> getAllProducts() {
        ArrayList<Product> list = new ArrayList<>();
        String sql = "select * from Product";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getFloat(4), rs.getFloat(6), rs.getString(5), rs.getInt(6)));
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public ArrayList<Product> getProductByCateID(int idtype) {
        String sql = "select * from Product where idtype=?";
        ArrayList<Product> list = new ArrayList<>();

        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, idtype);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getFloat(4), rs.getFloat(6), rs.getString(5), rs.getInt(6)));
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Product getProductByID(int id) {
        String sql = "select * from Product where id=?";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getFloat(4), rs.getFloat(6), rs.getString(5), rs.getInt(6));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public ArrayList<Product> getListByPage(ArrayList<Product> list,
            int start, int end) {
        ArrayList<Product> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    public boolean exsitedPro(int id) {
        String sql = "select * from Product where id=?";
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
    }

    public void insert(Product c) {
        String sql = "insert into Product values(?,?,?,?,?,?)";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, c.getId());
            st.setString(2, c.getName());
            st.setString(3, c.getImage());
            st.setFloat(4, c.getPrice());
            st.setString(5, c.getDescribe());
            st.setFloat(6, c.getPriceAfter());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void delete(int id) {
        String sql = "delete from Product where id=?";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void update(Product c) {
        String sql = "UPDATE [Product]\n"
                + "   SET [name] = ?\n"
                + "      ,[image] = ?\n"
                + "      ,[price] = ?\n"
                + "      ,[Describes] = ?\n"
                + "      ,[PriceAfter] = ?\n"
                + " WHERE id=?";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, c.getName());
            st.setString(2, c.getImage());
            st.setFloat(3, c.getPrice());
            st.setString(4, c.getDescribe());
            st.setFloat(5, c.getPriceAfter());
            st.setInt(6, c.getId());

            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<Item> checkquantity(Cart c) {
        List<Item> list = c.getCart();
        List<Item> listout = new ArrayList<>();
        for (Item l : list) {
            if (l.getQuantity() > l.getProduct().getRest()) {
                listout.add(l);
            }
        }
        return listout;
    }

    public void updateCart(Cart c) {
        List<Item> list = c.getCart();
        for (Item l : list) {
            l.getProduct().setRest(l.getProduct().getRest() - l.getQuantity());
//            l.getProduct().setSold(l.getQuantity());
        }
    }

    public void updateProductAfterBuy(Cart c) {
        List<Item> list = c.getCart();
        for (Item l : list) {
            String sql = "Update Product set rest = " + l.getProduct().getRest() + "  where id=" + l.getProduct().getId();
            try {
                PreparedStatement ps = con.prepareStatement(sql);
                ps.execute();
            } catch (Exception e) {
                System.out.println("Loi khi cap nhat lai quantity product" + e.getMessage());
            }
        }

    }
//     public void updateProductAfterBuy2(Cart c){
//        List<Item> list=c.getCart();
//        for(Item l:list){
//            String sql="Update Product set  sold = "+l.getProduct().getSold()+"  where id="+l.getProduct().getId();
//            try {
//                PreparedStatement ps = con.prepareStatement(sql);
//                ps.execute();
//            } catch (Exception e) {
//                System.out.println("Loi khi cap nhat lai quantity product"+e.getMessage());
//            }
//        }
//        
//    }

    public ArrayList<Product> getAllProductByName(String name) {
        ArrayList<Product> list = new ArrayList<>();
        String sql = "select * from Product where name like '%" + name + "%'";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getFloat(4), rs.getFloat(6), rs.getString(5), rs.getInt(6));
                list.add(p);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public ArrayList<Sold> getAllSold() {
        ArrayList<Sold> list = new ArrayList<>();
        String sql = "select  pname,sum(quantity)as sold from orderdetail group by pname order by sold desc";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Sold(rs.getString(1), rs.getInt(2)));
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public static void main(String[] args) {
        ProductDAO p = new ProductDAO();
        System.out.println(p.getProductByID(2).getImage());

    }
}
