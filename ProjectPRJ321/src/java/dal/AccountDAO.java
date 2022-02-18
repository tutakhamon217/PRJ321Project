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
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;

/**
 *
 * @author Dell
 */
public class AccountDAO extends DBContext {

    public List<Account> getAllAccount() {
        List<Account> list = new ArrayList<>();
        try {
            String sql = "select * from Account ";
            PreparedStatement st = con.prepareStatement(sql);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Account(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4)));
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public Account getAccount(String user, String pass) {
        try {
            String sql = "select * from Account where username = ? and pass = ?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, user);
            st.setString(2, pass);

            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Account(user, pass, rs.getString(3), rs.getString(4));
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public boolean exsitedAcc(String user) {
        String sql = "select * from Account where username=?";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, user);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public void insert(Account a) {
        String sql = "INSERT INTO [dbo].[Account]\n"
                + "           ([username]\n"
                + "           ,[pass]\n"
                + "           ,[email]\n"
                + "           ,[Phone])\n"
                + "     VALUES\n"
                + "           (?,?,?,?)";
        try {

            PreparedStatement statement = con.prepareStatement(sql);
            statement.setString(1, a.getUsername());
            statement.setString(2, a.getPass());
            statement.setString(3, a.getEmail());
            statement.setString(4, a.getPhone());
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void Changepass(Account a, String newpass){
          String sql = "UPDATE [dbo].[Account]\n"
                + "   SET \n"
                + "     [pass] = ?\n"
                + "      \n"
                + " WHERE username=?";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, newpass);
            st.setString(2, a.getUsername());
            st.executeUpdate();

        } catch (SQLException e) {
            System.out.println(e);
        }

    }

    public static void main(String[] args) {
        AccountDAO a = new AccountDAO();
        System.err.println(a.getAllAccount().size());
    }
}
